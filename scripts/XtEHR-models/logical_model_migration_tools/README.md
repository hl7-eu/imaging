# XtEHR Logical Model Migration Tools

Tools to migrate FHIR Implementation Guide mappings when XtEHR releases a new version of their logical models (e.g., 0.2.0 → 0.3.0).

## When to Use

Use these tools when:
- XtEHR releases a new version of their logical models
- You need to preserve existing FHIR mappings while updating to the new model
- You want to identify what changed between versions

## Tools Overview

### `compareModels.js`
Compare two versions of the XtEHR model to identify differences.

**Usage:**
```bash
node compareModels.js [ResourceName1] [ResourceName2] ...

# Examples
node compareModels.js EHDSImagingReport EHDSImagingStudy
node compareModels.js  # Uses defaults
```

**Output:** Detailed comparison showing added, removed, and modified fields with changes to cardinality, type, definition, and binding.

---

### `migrateMappingTsv.js`
Migrate mapping data from the old version to the new version.

**Usage:**
```bash
node migrateMappingTsv.js
```

**Input files required:**
- `xtehr-model.csv` (new version)
- `xtehr-model-mapping.tsv` (old version with mappings)
- `xtehr-model.0.2.0.csv` (old version for comparison)

**Output files:**
- `xtehr-model-mapping-migrated.tsv` - New mapping file with preserved mappings
- `migration-log.txt` - Detailed log of changes

**Key features:**
- Preserves existing FHIR mappings for unchanged and modified elements
- Handles one-to-many mappings (single XtEHR element → multiple FHIR resources)
- Creates empty mapping rows for new elements
- Generates detailed log of all changes

---

### `verifyMigration.js`
Verify that the migrated TSV contains all entries from the new CSV.

**Usage:**
```bash
node verifyMigration.js
```

Reports any missing entries and confirms successful migration.

---

## Migration Workflow

### Prerequisites
⚠️ **Before starting:**
1. Commit your current work to git (or backup files manually)
2. Download the new XtEHR version and place StructureDefinition files in `XtEHR-models/`

### Step-by-Step Process

**1. Backup current version**
```bash
cd scripts
cp xtehr-model.csv xtehr-model.0.2.0.csv
```
Manually move old StructureDefinition JSON files, package.json, etc. to `XtEHR-models/previous_versions/`

**2. Generate new model CSV**
```bash
node parseLogicalModels.js XtEHR-models xtehr-model.csv
```

**3. Compare versions (optional but recommended)**
```bash
cd XtEHR-models/logical_model_migration_tools
node compareModels.js EHDSImagingReport EHDSImagingStudy
```
Review output to understand changes in the new version.

**4. Run migration**
```bash
node migrateMappingTsv.js
```

Review the migration summary:
```
================================================================================
MIGRATION SUMMARY
================================================================================
Total rows in new CSV:        1169
Total rows in migrated TSV:   1511 (includes one-to-many mappings)

✅ Migrated (unchanged):      138
🔄 Migrated (data modified):  826
⭐ New elements:              547
❌ Removed elements:          805
```

**5. Verify migration**
```bash
node verifyMigration.js
```
Should output: `✓ All entries match perfectly!`

**6. Review and replace**
```bash
cd ../../  # Back to scripts directory
```
- Review `migration-log.txt` for complete list of new and removed elements
- Review `xtehr-model-mapping-migrated.tsv`
- When satisfied:
```bash
cp xtehr-model-mapping-migrated.tsv xtehr-model-mapping.tsv
```

**7. Map new elements**
1. Upload `xtehr-model-mapping.tsv` to Google Sheets
2. Map the new elements (empty mapping columns)
3. Review modified elements to ensure mappings are still valid
4. Download as `xtehr-model-mapping.tsv`

**8. Generate IG artifacts and test**
```bash
cd ..  # To imaging root
./scripts/xtehr-mapping.sh
sushi .
```

**9. Commit changes**
```bash
git add scripts/
git commit -m "Migrate to XtEHR v0.3.0 with preserved mappings"
```

---

## Understanding Migration Output

### Migration Categories

**Migrated (unchanged):**
Elements with identical metadata in both versions. Mappings are copied directly.

**Migrated (data modified):**
Elements present in both versions but with changed metadata. Examples:
- Cardinality: `0..1` → `1..1`
- Type: `EHDSPatient` → `http://www.xt-ehr.eu/fhir/models/StructureDefinition/EHDSPatient`
- Definition text updated
- Binding changed

⚠️ **Review these elements** to ensure mappings are still appropriate.

**New elements:**
Elements in the new version that didn't exist before. These have empty mapping columns.

⚠️ **Action required:** Create FHIR mappings for these elements.

**Removed elements:**
Elements from the old version not present in the new version. Logged in `migration-log.txt` for reference.

### One-to-Many Mappings

The migration correctly handles elements mapped to multiple FHIR resources:

```
EHDSImagingReport.header.subject → CompositionEuImaging.subject
EHDSImagingReport.header.subject → DiagnosticReportEuImaging.subject
```

Both mappings are preserved as separate rows in the migrated TSV.

---

## Troubleshooting

**Error: File not found**
- Ensure required input files exist in `/scripts/` directory
- Run tools from `/scripts/XtEHR-models/logical_model_migration_tools/`

**Migrated TSV has more rows than CSV**
- This is expected when one-to-many mappings exist
- Each mapping creates a separate row

**Missing mappings after migration**
- Use `compareModels.js` to check if element was renamed or removed
- Review `migration-log.txt` for details

---

## Notes

- Always backup/commit before running migration
- Review `migration-log.txt` thoroughly before proceeding
- Test with `sushi .` after migration
- Migration preserves FHIR mappings (columns 8-29) while updating XtEHR metadata (columns 1-7)
