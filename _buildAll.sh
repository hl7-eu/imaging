ig_base="imaging"

echo ==================================================================================
echo Preprocessing - generate FHIR version specific IGs
./_preprocessMultiVersion.sh

echo ==================================================================================
echo check build R5
cd igs/${ig_base}-r4
./_genonce.sh &

echo ==================================================================================
echo check build R4
cd ../${ig_base}-r5
./_genonce.sh  &

echo ==================================================================================
echo building
wait
echo done
echo ==================================================================================

