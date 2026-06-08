# Error Fix Playbook

Common failures seen in the imaging preprocessing/build pipeline and the first fix to try.

| Error pattern | Proposed fix |
|---|---|
| IG Publisher NOT FOUND / still missing | Run _updatePublisher.sh -y in the failing IG folder and verify internet access and write permissions. |
| Offline / Could not resolve host / Failed to connect | Check network or proxy settings. If terminology server is unreachable, run _genonce.sh with -tx n/a. |
| java: command not found / Unable to access jarfile | Install Java (typically 17+) and verify publisher.jar exists in input-cache or parent folder. |
| npx: command not found / npm: command not found | Install Node.js and npm (preprocess uses npx liquidjs). |
| liquidjs not found / Cannot find module liquidjs | Validate npm registry access and rerun npx --yes liquidjs manually. |
| Permission denied | chmod +x script files and ensure write permissions on igs/imaging-r4 and igs/imaging-r5. |
| No such file or directory | Run from repository root and verify ig-src, context-R4.json, context-R5.json, and igs folders exist. |
| OutOfMemoryError / Java heap space | Increase Java heap, for example JAVA_TOOL_OPTIONS='-Xms1g -Xmx4g -Dfile.encoding=UTF-8'. |
| Usage errors in _preprocessMultiVersion.sh | Use no argument, 4.0.1, or 5.0.0 only. |
