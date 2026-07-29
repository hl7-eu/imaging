#!/bin/bash
# Clone of _preProcessAndCheckAll.sh that disables the terminology server.
#
# WHY: During the Validate step the publisher makes many requests to tx.fhir.org.
# If the server is slow or unresponsive the build hangs indefinitely.
# Passing -tx n/a to the publisher skips all terminology validation,
# which lets the build complete offline or when tx.fhir.org is unavailable.
#
# USAGE: ./_preProcessAndCheckAll-notx.sh [4.0.1|5.0.0]

ig_base="imaging"
version="${1:-}"

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
echo Preprocessing - generate FHIR version specific IG
if [ -n "$version" ]; then
	./_preprocessMultiVersion.sh "$version"
else
	./_preprocessMultiVersion.sh
fi

echo ==================================================================================
echo ensure publisher is available for both IGs
ensure_publisher_for_ig "igs/${ig_base}-r4" || exit 1
ensure_publisher_for_ig "igs/${ig_base}-r5" || exit 1


echo ==================================================================================
echo check build R4 "(terminology server disabled: -tx n/a)"
if [ "$version" = "4.0.1" ] || [ -z "$version" ]; then
	cd igs/${ig_base}-r4
	./_genonce.sh -tx n/a
	cd ../..
fi


echo ==================================================================================
echo check build R5 "(terminology server disabled: -tx n/a)"
if [ "$version" = "5.0.0" ] || [ -z "$version" ]; then
	cd igs/${ig_base}-r5
	./_genonce.sh -tx n/a
	cd ../..
fi

echo ==================================================================================
echo validate external links in rendered output
if [ -f "./scripts/validate-links.sh" ]; then
	bash ./scripts/validate-links.sh
else
	echo "Warning: validate-links.sh not found, skipping link validation"
fi
