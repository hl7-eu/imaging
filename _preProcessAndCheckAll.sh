ig_base="imaging"

echo ==================================================================================
echo Preprocessing - generate FHIR version specific IGs
./_preprocessMultiVersion.sh

# echo ==================================================================================
# echo checking repos - SUSHI R4
# sushi igs/${ig_base}-r4

# echo ==================================================================================
# echo checking repos - SUSHI R5
# sushi igs/${ig_base}-r5

echo ==================================================================================
echo check build R4
cd igs/${ig_base}-r4
./_genonce.sh

echo ==================================================================================
echo check build R5
cd ../${ig_base}-r5
./_genonce.sh

echo ==================================================================================


