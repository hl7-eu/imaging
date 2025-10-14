echo ==================================================================================
echo Preprocessing - generate FHIR version specific IGs
./_preprocessMultiVersion.sh

echo ==================================================================================
echo checking repos - SUSHI R4
sushi igs/imaging-r4

echo ==================================================================================
echo checking repos - SUSHI R5
sushi igs/imaging-r5

echo ==================================================================================
echo check build R5
cd igs/imaging-r4
./_genonce.sh

echo ==================================================================================
echo check build R4
cd ../imaging-r5
./_genonce.sh

echo ==================================================================================


