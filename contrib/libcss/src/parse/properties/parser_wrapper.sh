#!/usr/bin/sh

if [[ $# -lt 3 ]]; then
	echo "Requires at least three arguments (output directory, gen_parser binary location, properties.gen location)"
	exit 1
fi

while read PROP; do
	if [[ ! "$PROP" =~ '#' ]] && [[ $(expr length "$PROP") -ne 0 ]]; then
		IFS=':'
		P=($PROP)
		"$2" -o "$1/autogenerated_$P.c" "$PROP"
	fi
done < "$3"
