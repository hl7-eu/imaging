#!/bin/bash


# Determine script directory to reliably invoke companion scripts
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
publisher_jar=publisher.jar
input_cache_path=./input-cache/
echo Checking internet connection...
curl -sSf tx.fhir.org > /dev/null

if [ $? -eq 0 ]; then
	echo "Online"
	txoption=""
else
	echo "Offline"
	txoption="-tx n/a"
fi

echo "$txoption"

export JAVA_TOOL_OPTIONS="$JAVA_TOOL_OPTIONS -Dfile.encoding=UTF-8"

publisher=$input_cache_path/$publisher_jar
if test -f "$publisher"; then
	java -jar "$publisher" -ig . $txoption "$@"
else
	publisher=../$publisher_jar
	if test -f "$publisher"; then
		java -jar "$publisher" -ig . $txoption "$@"
	else
		echo "IG Publisher NOT FOUND in input-cache or parent folder."
		# Prompt user to optionally run the updater
		read -r -p "Run _updatePublisher.sh now? (y/n): " response
		if [[ $response =~ ^[yY]$ ]]; then
			if [ -x "$SCRIPT_DIR/_updatePublisher.sh" ]; then
				echo "Running updater..."
				"$SCRIPT_DIR/_updatePublisher.sh"
				# After update, re-check preferred location
				if test -f "$input_cache_path/$publisher_jar"; then
					publisher=$input_cache_path/$publisher_jar
				elif test -f "../$publisher_jar"; then
					publisher=../$publisher_jar
				fi
				if test -f "$publisher"; then
					echo "Publisher downloaded. Continuing generation..."
					java -jar "$publisher" -ig . $txoption "$@"
				else
					echo "Updater finished but publisher.jar still not found. Aborting."
					exit 1
				fi
			else
				echo "Updater script _updatePublisher.sh not found or not executable at $SCRIPT_DIR. Aborting."
				exit 1
			fi
		else
			echo "User declined to run updater. Aborting."
			exit 1
		fi
	fi
fi
