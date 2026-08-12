#!/bin/sh

# Download the published EHDS Logical Information Models v1.0.0 package
# and extract the StructureDefinitions into XtEHR-models.
cd XtEHR-models
curl -fsSL -o package.tgz https://www.xt-ehr.eu/fhir/models/1.0.0/package.tgz
tar xzf package.tgz
# Copy the published base logical models (excluding *Obligations) into place.
for f in package/StructureDefinition-*.json; do
    case "$f" in
        *Obligations.json) ;;
        *) cp "$f" ./ ;;
    esac
done
# Copy the published obligation profiles into the obligations/ subdirectory.
# parseLogicalModels.js reads these to enrich xtehr-model.csv with the
# producer/consumer obligations defined for each element.
mkdir -p obligations
for f in package/StructureDefinition-*Obligations.json; do
    [ -e "$f" ] && cp "$f" obligations/
done
cp package/package.json ./package.json
cp package/.index.json ./.index.json 2>/dev/null || true
cp package/ImplementationGuide-xtehr.eu.ehds.models.json ./ImplementationGuide-xtehr.eu.ehds.models.json
rm -rf package package.tgz
cd ..
