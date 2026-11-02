#!/bin/bash
# Copy the per-resource OID assignments written by the IG Publisher
# (igs/imaging-r4/oids.ini, igs/imaging-r5/oids.ini) back into the single
# source file ig-src/oids.liquid.ini, so they survive the next preprocess.
#
# The root OIDs are set by `auto-oid-root` in ig-src/sushi-config.liquid.yaml.
# If a version's oids.ini is missing, the existing block for that version is kept.
#
# Usage (from the fork root or any directory): ./scripts/syncOidsIni.sh

set -euo pipefail

root_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
target="$root_dir/ig-src/oids.liquid.ini"
r4_ini="$root_dir/igs/imaging-r4/oids.ini"
r5_ini="$root_dir/igs/imaging-r5/oids.ini"

if [ ! -f "$r4_ini" ] && [ ! -f "$r5_ini" ]; then
	echo "syncOidsIni: no generated oids.ini found, nothing to sync"
	exit 0
fi

# Print the content of the {% if isRx %} block of the current target file.
existing_block() {
	local tag="$1"
	[ -f "$target" ] || return 0
	awk -v open="{% if ${tag} %}" '
		$0 == open { inside = 1; next }
		inside && $0 == "{% endif %}" { inside = 0; next }
		inside { print }
	' "$target"
}

# Print the block content for one version: generated file if present, else the existing block.
block_content() {
	local tag="$1" ini="$2"
	if [ -f "$ini" ]; then
		# Drop leading/trailing blank lines (Liquid tags render as blank lines); keep the rest untouched.
		awk 'NF { started = 1 } started' "$ini" | sed -e :a -e '/^\n*$/{$d;N;ba' -e '}'
	else
		existing_block "$tag"
	fi
}

tmp="$(mktemp "${target}.XXXXXX")"
trap 'rm -f "$tmp"' EXIT
{
	echo "{% if isR4 %}"
	block_content isR4 "$r4_ini"
	echo "{% endif %}"
	echo "{% if isR5 %}"
	block_content isR5 "$r5_ini"
	echo "{% endif %}"
} > "$tmp"

if [ -f "$target" ] && cmp -s "$tmp" "$target"; then
	echo "syncOidsIni: ig-src/oids.liquid.ini is up to date"
else
	cat "$tmp" > "$target"
	echo "syncOidsIni: updated ig-src/oids.liquid.ini (commit this file)"
fi
