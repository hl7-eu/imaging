echo ==================================================================================
echo Preprocessing - generate FHIR version specific IGs
./_preprocessMultiVersion.sh

echo ==================================================================================
echo check build R5
cd igs/r4
./_genonce.sh &

echo ==================================================================================
echo check build R4
cd ../r5
./_genonce.sh &

echo ==================================================================================

wait
echo Rapid Build Complete

