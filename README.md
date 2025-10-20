# README

This repository contains the source files to build and deploy a multi-FHIR version of the HL7 EU Imaging Studies EHDS Implementation Guide.

```text
┌───────────────────────────┐                 
│                           │     ┌──────────────────────────────┐ 
│ github.com/hl7eu/imaging  ┼─────► github.com/hl7eu/imaging-r4  │ 
│                           │     └──────────────────────────────┘  │                              │ 
└────────────┬──────────────┘               
             │                    ┌──────────────────────────────┐
             └────────────────────► github.com/hl7eu/imaging-r5  │
                                  └──────────────────────────────┘
```

The content of this repository is processed and generates the content of the imaging-r4 and imaging-r5 repositories. The content of these repositories is not edited directly but generated based on the content of this repository.

This approach has been chosen as it allows both versions of the specification to be generated from a single codebase and still allows the R4 and R5 versions to be build using the FHIR autobuilder.

Structure of this repository
- The IG source files are located in the `ig-src` directory.
- Run `./_preprocessgenerate.sh` to generate FHIR-version-specific IGs under the `igs/imaging-<rx>` directory, where the <rx> will be replaced with FHIR version.
- The `./_preprocessgenerate.sh` process uses **Liquid tags** to insert version-specific content from the source files into the appropriate folders.
- The repository also has a mock FHIR-IG that contains one page that forwards to the imaging-r5 version of the specification. This ensures that people that have older versions of the IG are still seeing the current build.

The versions in the igs/imaging-r4 and igs/imaging-r5 directory can be used to check the R4 and R5 versions during editing.

Once the changes have checked and results can be committed, the script `_commitToMainRepos.sh` should be run. This will checkout the corresponding branch on the imaging-r4 and imaging-r5 repositories, copy the contents of the igs/imaging-r4 and igs/imaging-r5 directories and check in the changes. 

## Multi-version process

Each target version is specified in the `_preprocessgenerate.sh` script in the `versions` variable. For each element in the array the script will:

1. Clean the target directory of existing content.
2. Copy relevant content from the `ig-src` directory to the target directory
3. Run liquid on each file in the target directory which is named `*.liquid.*`. The liquid file will be removed and replaced with a file that does not have liquid in its name.
4. The variables used in the liquid process are defined in the `context-<Rx>.json` files.

The main files on which this process is typically used are `sushi-config.yaml`, `ig.ini` and `fsh` files. FHIR release specific pages are generated using the standard variables made available by the IG-publisher, mainly `site.data.fhir.version`.

## Multi-FHIR shorthand files

Using the variables defined in the context files FHIR version variations can be added in multiple ways. The two main approaches are shown below.

The first pattern uses the  `{% if isR4 % }` and `{% endif}` statements as is depicted in the example below.

```text
* status = #final
{% if isR5 % }
* version = "1.0.0" // invented - not there in the report
{% endif}
{% if isR4 % }
* extension[version].valueString = "1.0.0"
{% endif}
```

In the R4 version of the shorthand file on the R4 part will be present, the R5 version will only hand the R5 alternative.

This approach has the advantage that the identation remains in place but the disadvantage that the line numbers change. An alternative approach is illustrated below.

```text
* status = #final
{%R5%}* version = "1.0.0" // invented - not there in the report
{%R4%}* extension[version].valueString = "1.0.0"
{% endif}
```

In the R4 version, `{%R4%}` will be replaced by "" and `{%R4%}` by "//R5". In the R5 version `{%R4%}` will be replaced by "//R4" and `{%R4%}` by "".
The different sections are clearly marked and the line numbering is not compromised at the expense of loosing indent alignment. 

## Compiling Content

1. From the root directory, run:
   ```sh
   ./_preprocessMultiVersion.sh
   ```
2. The compiled IGs will be found in the `igs/r4` and `igs/r5` directories.
3. Run `./_updatePublisher.sh` and then `./_genonce.sh` to build each IG.

