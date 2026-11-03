#!/bin/bash
set -euo pipefail
cd "$(dirname "${BASH_SOURCE[0]}")"
source_state="$(bash ./_source-state.sh)"
rm -f .build-source.sha256
build_started="$(mktemp)"
trap 'rm -f "$build_started"' EXIT
publisher_jar=publisher.jar
input_cache_path=./input-cache/
publisher_home="${FHIR_PUBLISHER_HOME:-$HOME/.fhir/tools/publisher}"
echo Checking internet connection...
if curl -sSf tx.fhir.org > /dev/null; then
	echo "Online"
	txoption=()
else
	echo "Offline"
	txoption=(-tx n/a)
fi

echo "${txoption[*]}"

export JAVA_TOOL_OPTIONS="${JAVA_TOOL_OPTIONS:-} -Dfile.encoding=UTF-8"

publisher="${input_cache_path}${publisher_jar}"
if test -f "$publisher"; then
	java -jar "$publisher" -ig . "${txoption[@]}" "$@"

else
	publisher="../${publisher_jar}"
	if test -f "$publisher"; then
		java -jar "$publisher" -ig . "${txoption[@]}" "$@"
	else
		publisher="${publisher_home}/${publisher_jar}"
		if test -f "$publisher"; then
			java -jar "$publisher" -ig . "${txoption[@]}" "$@"
		else
			echo IG Publisher NOT FOUND in input-cache, parent folder, or FHIR publisher home.  Please run _updatePublisher.  Aborting...
			exit 1
		fi

	fi
fi

for evidence in output/qa.json output/package.tgz; do
	if [[ ! -s "$evidence" || ! "$evidence" -nt "$build_started" ]]; then
		echo "Missing or stale Publisher build evidence: $evidence" >&2
		exit 1
	fi
done
if [[ "$source_state" != "$(bash ./_source-state.sh)" ]]; then
	echo "API sources changed during the build; rebuild before synchronization." >&2
	exit 1
fi
printf '%s\n' "$source_state" > .build-source.sha256
