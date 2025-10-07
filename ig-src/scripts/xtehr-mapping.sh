rm -f ../input/fsh/obligations/*
rm -f ../input/fsh/xtehr-model-maps/*
rm -f ../input/intro-notes/ConceptMaps-EHDS*
node generateDataBasedOnModel.js
find ../input/resources/ -type f -name "*.json" -exec ./removeTextFromJson.sh {} \;