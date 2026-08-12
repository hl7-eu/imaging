#!/bin/bash
publisher_jar=publisher.jar
input_cache_path=./input-cache/
echo Checking internet connection...
# Probe a real FHIR endpoint (metadata) and require HTTP 200. The bare root
# https://tx.fhir.org returns HTTP 404, which "curl -sSf" treats as failure,
# causing a false "Offline" result and a "-tx n/a" build that crashes during
# ValueSet narrative generation (TerminologyClientContext "tc" is null).
tx_status="$(curl -s -o /dev/null -w '%{http_code}' --max-time 15 https://tx.fhir.org/r4/metadata || echo 000)"

if [ "$tx_status" = "200" ]; then
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
	java -jar $publisher -ig . $txoption $*

else
	publisher=../$publisher_jar
	if test -f "$publisher"; then
		java -jar $publisher -ig . $txoption $*
	else
		echo IG Publisher NOT FOUND in input-cache or parent folder.  Please run _updatePublisher.  Aborting...
	fi
fi
