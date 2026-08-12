---
name: build-igs
description: 'Build the HL7 Europe Imaging IG for all FHIR versions (R4, R5, R6) in parallel, writing a separate timestamped build log per version into build-logs/. Use when asked to build the IGs, build all FHIR versions, rebuild the imaging guide, run the IG Publisher, or produce/collect build logs. Covers preprocessing from ig-src, ensuring the IG Publisher jar, running genonce per version concurrently, and summarizing QA results.'
argument-hint: '[versions: r4 r5 r6] — omit to build all'
---

# Build Imaging IGs (all FHIR versions, in parallel)

## When to Use
- "Build all FHIR versions", "build the IGs", "rebuild the imaging guide".
- Producing per-version build logs in `build-logs/` for post-failure inspection.
- Running R4, R5, and R6 builds concurrently instead of one at a time.

## Key Facts About This Repo
- Sources live in `ig-src/` as `*.liquid.*` templates. They are NOT built directly.
- `_preprocessMultiVersion.sh` renders `ig-src/` into version-specific IG folders:
  `igs/imaging-r4`, `igs/imaging-r5`, `igs/imaging-r6`, driven by `context-R4.json` / `context-R5.json` / `context-R6.json`.
- Each `igs/imaging-r*` folder builds independently via its own `_genonce.sh` (wraps the IG Publisher jar).
- Because the version folders are independent, builds run safely in parallel.
- `build-logs/` is gitignored; it holds one combined run log plus one log per version.
- The stock `_build.sh` only covers R4 and R5. To include R6, use this skill's script.

## Procedure
1. From the repo root, run the bundled script (defaults to all three versions):
   [build-all-igs.sh](./scripts/build-all-igs.sh)
   ```bash
   bash .github/skills/build-igs/scripts/build-all-igs.sh          # r4 r5 r6
   bash .github/skills/build-igs/scripts/build-all-igs.sh r4 r5     # subset
   ```
2. The script will:
   - Run `_preprocessMultiVersion.sh` to regenerate the version folders from `ig-src/`.
   - Ensure each version has a publisher jar (runs `_updatePublisher.sh -y` if missing).
   - Build via the `hl7fhir/ig-publisher-base` Docker image, automatically falling back to a
     local `java -jar` build if Docker (or java in the image) is unavailable.
   - Launch every requested version's `_genonce.sh` in parallel.
   - Write per-version logs to `build-logs/build-<version>-<timestamp>.log` and a combined
     `build-logs/build-<timestamp>.log`.
   - Wait for all builds, then print each version's exit code and `qa.txt` `err =` summary line.
3. On failure, open the specific `build-logs/build-<version>-<timestamp>.log` to see that
   version's IG Publisher / SUSHI output.

### Environment overrides
- `PUBLISHER_IMAGE` — Docker image (default `hl7fhir/ig-publisher-base:latest`).
- `PUBLISHER_FHIR_CACHE_MODE` — `volume` (default) or `tmpfs` for the `~/.fhir` package cache.
- `PUBLISHER_FHIR_CACHE_DIR` — host cache dir when mode is `volume` (default `~/.fhir`).

## Completion Checks
- Each requested version exited 0.
- `igs/imaging-<version>/output/qa.txt` exists and its `err =` count is acceptable.
- A per-version log file exists in `build-logs/` for every requested version.

## Notes / Caveats
- R6 (`6.0.0-ballot3`) support is newer; if its `sushi-config`/`ig.ini`/publisher are incomplete,
  its build may fail while R4/R5 succeed. The parallel run isolates this — check the R6 log.
- Set `PUBLISHER_TX=n/a` behaviour is handled inside each `_genonce.sh` (it probes tx.fhir.org).
- Do not build inside `igs/imaging-r*` by editing generated files; edit `ig-src/` then rebuild.
