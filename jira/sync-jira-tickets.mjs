#!/usr/bin/env node
import fs from "node:fs";
import path from "node:path";
import XLSX from "xlsx";

const KEY_PATTERN = /^FHIR-\d+$/i;

function asText(value) {
  if (value === null || value === undefined) {
    return "";
  }
  return String(value).trim();
}

function getArg(name, defaultValue = "") {
  const idx = process.argv.indexOf(name);
  if (idx === -1 || idx + 1 >= process.argv.length) {
    return defaultValue;
  }
  return process.argv[idx + 1];
}

function parseWorkbook(excelPath) {
  const workbook = XLSX.readFile(excelPath);
  const sheetName = workbook.SheetNames[0];
  const sheet = workbook.Sheets[sheetName];
  const rows = XLSX.utils.sheet_to_json(sheet, { defval: "", raw: false });

  const tickets = new Map();

  for (let i = 0; i < rows.length; i += 1) {
    const row = rows[i];
    const key = asText(row.Key);

    if (KEY_PATTERN.test(key)) {
      const ticketKey = key.toUpperCase();

      if (!tickets.has(ticketKey)) {
        tickets.set(ticketKey, {
          key: ticketKey,
          issueType: asText(row["Issue Type"]),
          status: asText(row.Status),
          resolution: asText(row.Resolution),
          resolutionDescription: asText(row["Resolution Description"]),
          summary: asText(row.Summary),
          description: asText(row.Description),
          relatedSections: asText(row["Related Section(s)"]),
          relatedArtifacts: asText(row["Related Artifact(s)"]),
          raisedInVersion: asText(row["Raised in Version"]),
          reporter: asText(row.Reporter),
          grouping: asText(row.Grouping),
          assignee: asText(row.Assignee),
          created: asText(row.Created),
          parentKey: asText(row["Parent key"])
        });
      }
    }

  }

  return { tickets, sheetName };
}

function renderTicketMarkdown(ticket) {
  const lines = [];

  lines.push(`# ${ticket.key}: ${ticket.summary || "(no summary)"}`);
  lines.push("");
  
  // Description section
  if (ticket.description) {
    lines.push("## Description");
    lines.push("");
    lines.push(ticket.description);
    lines.push("");
  }
  
  lines.push("## Metadata");
  lines.push("");
  
  // Only render fields that have values
  lines.push(`- Issue Type: ${ticket.issueType || ""}`);
  lines.push(`- Key: ${ticket.key}`);
  lines.push(`- Summary: ${ticket.summary || ""}`);
  lines.push(`- Status: ${ticket.status || ""}`);
  if (ticket.raisedInVersion) {
    lines.push(`- Raised in Version: ${ticket.raisedInVersion}`);
  }
  if (ticket.relatedSections) {
    lines.push(`- Related Sections: ${ticket.relatedSections}`);
  }
  if (ticket.specificationLocation) {
    lines.push(`- Specification Location: ${ticket.specificationLocation}`);
  }
  if (ticket.relatedArtifacts) {
    lines.push(`- Related Artifacts: ${ticket.relatedArtifacts}`);
  }
  if (ticket.reporter) {
    lines.push(`- Reporter: ${ticket.reporter}`);
  }
  if (ticket.assignee) {
    lines.push(`- Assignee: ${ticket.assignee}`);
  }
  if (ticket.created) {
    lines.push(`- Created: ${ticket.created}`);
  }
  lines.push("");
  
  // Resolution section
  lines.push("## Resolution");
  lines.push("");
  lines.push(`- Status: ${ticket.status || ""}`);
  lines.push(`- Resolution: ${ticket.resolution || ""}`);
  if (ticket.resolutionDescription) {
    lines.push("");
    lines.push(ticket.resolutionDescription);
  }
  lines.push("");
  
  // Related tickets section
  if (ticket.parentKey || ticket.grouping) {
    lines.push("## Related");
    lines.push("");
    if (ticket.parentKey) {
      lines.push(`- Parent: ${ticket.parentKey}`);
    }
    if (ticket.grouping) {
      lines.push(`- Grouping: ${ticket.grouping}`);
    }
    lines.push("");
  }

  return lines.join("\n");
}

function ensureDir(dirPath) {
  fs.mkdirSync(dirPath, { recursive: true });
}

function isClosedStatus(status) {
  const closedStatuses = ["Applied", "Duplicate", "Resolved - No Change", "Resolved - change required", "Deferred"];
  return closedStatuses.includes(status);
}

function migrateOldTicketStructure(outDir) {
  // Migrate any root-level FHIR-* directories to open/closed structure
  const rootTickets = [];
  try {
    const entries = fs.readdirSync(outDir, { withFileTypes: true });
    entries.forEach((entry) => {
      if (entry.isDirectory() && KEY_PATTERN.test(entry.name)) {
        rootTickets.push(entry.name);
      }
    });
  } catch (e) {
    // Directory may not exist yet
  }

  rootTickets.forEach((ticketKey) => {
    const sourcePath = path.join(outDir, ticketKey);
    const markdownFile = path.join(sourcePath, `${ticketKey}.md`);
    
    try {
      // Try to determine if ticket should be open or closed
      // by reading its markdown file
      if (fs.existsSync(markdownFile)) {
        const content = fs.readFileSync(markdownFile, "utf8");
        const statusMatch = content.match(/^- Status: (.+)$/m);
        const status = statusMatch ? statusMatch[1].trim() : "";
        
        const isClosed = isClosedStatus(status);
        const destDir = isClosed ? "closed" : "open";
        const destPath = path.join(outDir, destDir, ticketKey);
        
        // Only migrate if destination doesn't already exist
        if (!fs.existsSync(destPath)) {
          ensureDir(path.dirname(destPath));
          fs.renameSync(sourcePath, destPath);
        } else {
          // If destination exists, just remove the old one
          fs.rmSync(sourcePath, { recursive: true, force: true });
        }
      }
    } catch (e) {
      console.warn(`Warning: Could not migrate ${ticketKey}: ${e.message}`);
    }
  });
}

function syncTickets({ excelPath, outDir, prune }) {
  const { tickets, sheetName } = parseWorkbook(excelPath);
  ensureDir(outDir);

  // Migrate old root-level ticket structure
  migrateOldTicketStructure(outDir);

  const openDir = path.join(outDir, "open");
  const closedDir = path.join(outDir, "closed");
  ensureDir(openDir);
  ensureDir(closedDir);

  const keys = [...tickets.keys()].sort();
  let openCount = 0;
  let closedCount = 0;

  keys.forEach((key) => {
    const ticket = tickets.get(key);
    const isClosed = isClosedStatus(ticket.status);
    const statusDir = isClosed ? closedDir : openDir;
    
    const ticketDir = path.join(statusDir, key);
    ensureDir(ticketDir);

    const markdownPath = path.join(ticketDir, `${key}.md`);
    const content = renderTicketMarkdown(ticket);
    fs.writeFileSync(markdownPath, content, "utf8");

    if (isClosed) {
      closedCount++;
    } else {
      openCount++;
    }
  });

  if (prune) {
    // Prune closed tickets
    const existingClosed = fs.readdirSync(closedDir, { withFileTypes: true });
    const closedKeySet = new Set([...tickets.values()].filter(t => isClosedStatus(t.status)).map(t => t.key));
    existingClosed.forEach((entry) => {
      if (!entry.isDirectory()) {
        return;
      }
      if (!KEY_PATTERN.test(entry.name)) {
        return;
      }
      const normalized = entry.name.toUpperCase();
      if (!closedKeySet.has(normalized)) {
        fs.rmSync(path.join(closedDir, entry.name), { recursive: true, force: true });
      }
    });

    // Prune open tickets
    const existingOpen = fs.readdirSync(openDir, { withFileTypes: true });
    const openKeySet = new Set([...tickets.values()].filter(t => !isClosedStatus(t.status)).map(t => t.key));
    existingOpen.forEach((entry) => {
      if (!entry.isDirectory()) {
        return;
      }
      if (!KEY_PATTERN.test(entry.name)) {
        return;
      }
      const normalized = entry.name.toUpperCase();
      if (!openKeySet.has(normalized)) {
        fs.rmSync(path.join(openDir, entry.name), { recursive: true, force: true });
      }
    });
  }

  return { count: keys.length, openCount, closedCount, sheetName };
}

function main() {
  const excelArg = getArg("--excel");
  const outArg = getArg("--out");
  const prune = process.argv.includes("--prune");

  const cwd = process.cwd();
  const excelPath = path.resolve(cwd, excelArg || "export.xlsx");
  const outDir = path.resolve(cwd, outArg || ".");

  if (!fs.existsSync(excelPath)) {
    throw new Error(`Excel file not found: ${excelPath}`);
  }

  const { count, openCount, closedCount, sheetName } = syncTickets({ excelPath, outDir, prune });
  console.log(`Synced ${count} Jira tickets from sheet '${sheetName}'.`);
  console.log(`  - Open (unresolved): ${openCount}`);
  console.log(`  - Closed (resolved): ${closedCount}`);
  console.log(`Output directory: ${outDir}`);
  console.log(`  - Open tickets: ${outDir}/open`);
  console.log(`  - Closed tickets: ${outDir}/closed`);
  console.log(`Prune mode: ${prune ? "enabled" : "disabled"}`);
}

main();
