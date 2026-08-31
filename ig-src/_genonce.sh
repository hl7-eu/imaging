#!/usr/bin/env bash
publisher_jar=publisher.jar
input_cache_path=./input-cache/

tx_args=()
if [[ -n "${TX_URL:-}" ]]; then
	echo "Using terminology server: $TX_URL"
	tx_args=(-tx "$TX_URL")
	if [[ -n "${FHIR_SETTINGS:-}" ]]; then
		tx_args=(-fhir-settings "$FHIR_SETTINGS" "${tx_args[@]}")
	fi
else
	version_code="r4"
	if [[ "$(basename "$PWD")" == *r5 ]]; then
		version_code="r5"
	fi
	public_tx_url="https://tx.fhir.org/$version_code"
	echo "Checking public terminology server: $public_tx_url"
	if curl --fail --silent --show-error --max-time 15 "$public_tx_url/metadata" >/dev/null 2>&1; then
		echo "Public terminology server is available."
	else
		echo "Public terminology server is unavailable; building without terminology services."
		tx_args=(-tx n/a)
	fi
fi

export JAVA_TOOL_OPTIONS="${JAVA_TOOL_OPTIONS:-} -Dfile.encoding=UTF-8"

publisher=$input_cache_path/$publisher_jar
if [[ -f "$publisher" ]]; then
	java -jar "$publisher" -ig . "${tx_args[@]}" "$@"

else
	publisher=../$publisher_jar
	if [[ -f "$publisher" ]]; then
		java -jar "$publisher" -ig . "${tx_args[@]}" "$@"
	else
		echo IG Publisher NOT FOUND in input-cache or parent folder.  Please run _updatePublisher.  Aborting...
		exit 1
	fi
fi
