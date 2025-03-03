# HL7 EU Imaging Studies and Reports Implementation Guide.

This github repository contains the source material for the HL7 EU Imaging Studies and Reports Implementation Guide.

* Current Web-build: https://build.fhir.org/ig/hl7-eu/imaging/index.html
* Issues: https://github.com/hl7-eu/imaging/issues 

## Quick Start
1. Clone this repository:
    ```sh
    git clone https://github.com/hl7-eu/imaging.git
    ```
2. Run the Docker publisher:
    ```sh
    ./startDockerPublisher.sh
    ```
3. Download the IG Publisher:
    ```sh
    ./_updatePublisher.sh
    ```
4. Edit files only in the `IG-base` directory.
5. Build for FHIR R4:
    ```sh
    ./_genonce.sh R4
    ```
6. Build for FHIR R5:
    ```sh
    ./_genonce.sh R5
    ```

## Writing FSH Files
This IG supports building a FHIR R4 or R5 IG from the same source files.

- For version-specific resources, use `yourfilename.liquid.fsh` filenames.
    - Block editing:
        ```liquid
        {% if isR4 %}
        // FSH content to be included only in R4 build
        {% endif %}

        {% if isR5 %}
        // FSH content to be included only in R5 build
        {% endif %}
        ```
    - Inline editing:
        ```liquid
        {{R4}} /* Some R4 FSH line */
        {{R5}} /* Some R5 FSH line */
        ```
- For non-version-specific resources (i.e., to be included in both versions), use regular `.fsh` files without `.liquid`.

## Important Notes
- Only edit files in the main `IG-base/` directory. Do not edit files in `R4-build` and `R5-build` as they are generated.