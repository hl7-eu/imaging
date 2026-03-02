rm -f ../ig-src/input/fsh/obligations/*
rm -f ../ig-src/input/fsh/xtehr-model-maps/*
rm -f ../ig-src/input/intro-notes/ConceptMaps-EHDS*
node generateDataBasedOnModel.js
find ../input/resources/ -type f -name "*.json" -exec ./removeTextFromJson.sh {} \;