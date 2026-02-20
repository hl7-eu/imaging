ig_base="imaging"

ensure_publisher_for_ig() {
	ig_dir="$1"
	local_publisher="$ig_dir/input-cache/publisher.jar"
	parent_publisher="$(dirname "$ig_dir")/publisher.jar"

	if [ -f "$local_publisher" ] || [ -f "$parent_publisher" ]; then
		echo "IG Publisher FOUND for $ig_dir"
		return 0
	fi

	echo "IG Publisher NOT FOUND for $ig_dir. Running _updatePublisher..."
	(
		cd "$ig_dir" || exit 1
		./_updatePublisher.sh -y
	)

	if [ -f "$local_publisher" ] || [ -f "$parent_publisher" ]; then
		echo "IG Publisher ready for $ig_dir"
		return 0
	fi

	echo "IG Publisher still missing for $ig_dir after update. Aborting..."
	return 1
}

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
echo check build R5
ensure_publisher_for_ig "igs/${ig_base}-r4" || exit 1
cd igs/${ig_base}-r4
./_genonce.sh

echo ==================================================================================
echo check build R4
ensure_publisher_for_ig "../${ig_base}-r5" || exit 1
cd ../${ig_base}-r5
./_genonce.sh

echo ==================================================================================


