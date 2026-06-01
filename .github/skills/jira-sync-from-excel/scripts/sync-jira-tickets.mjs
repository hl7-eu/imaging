#!/usr/bin/env node

import { spawnSync } from "node:child_process";
import fs from "node:fs";
import path from "node:path";

const scriptDir = path.dirname(new URL(import.meta.url).pathname);
const repoRoot = path.resolve(scriptDir, "../../../..");
const repoSyncScript = path.join(repoRoot, "jira", "sync-jira-tickets.mjs");

if (!fs.existsSync(repoSyncScript)) {
  console.error(`ERROR: repository sync script not found: ${repoSyncScript}`);
  process.exit(1);
}

const result = spawnSync(process.execPath, [repoSyncScript, ...process.argv.slice(2)], {
  cwd: repoRoot,
  stdio: "inherit"
});

if (result.error) {
  throw result.error;
}

process.exit(result.status ?? 0);
