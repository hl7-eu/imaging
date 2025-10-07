# README

This repository contains the source files to build and deploy a multi-FHIR version of the HL7 EU Imaging Studies EHDS Implementation Guide.

- The IG source files are located in the `IG-base` directory.
- Run `./_preprocessgenerate.sh` to generate FHIR-version-specific IGs under the `igs/Rx` directory.
- The `./_preprocessgenerate.sh` process uses **Liquid tags** to insert version-specific content from the source files into the appropriate folders.

## Compiling Content

1. From the root directory, run:
   ```sh
   ./_preprocessMultiVersion.sh
   ```
2. The compiled IGs will be found in the `igs/r4` and `igs/r5` directories.
3. Run `./_updatePublisher.sh` and then `./_genonce.sh` to build each IG.

## Authoring

- Check the available Liquid tags in the `context-Rx.json` files and add any new required ones.
- Use the tags in the files to mark version-specific content.

**Examples:**

- Inline tag:
  ```liquid
  {{R5}}  <!-- This line will appear only in the r5 file. -->
  ```

- Block tag:
  ```liquid
  {% if isR4 %}
  This multi-line code snippet
  will appear only in the r4 directory.
  {% endif %}
  ```