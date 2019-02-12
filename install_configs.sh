#!/usr/bin/env bash

# Installs configuration files

destdir="tmp"
configs_file="configs.csv"


while IFS=, read -r dest file; do
	case "$dest" in
		"") echo "$file" goes in root ;;
		".config") echo "$file" goes in "$dest" ;;
	esac
done < $configs_file
