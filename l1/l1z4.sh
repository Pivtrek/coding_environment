#!/bin/bash

#wczytanie argumentu(ścieżki katalogu)
directory=("$1")

unique_words=($(find "$directory" -type f -exec cat {} + | tr -s '[:space:]' '\n' | grep -v '^$' | sort | uniq))

for word in "${unique_words[@]}"; do
	echo "$word":
	grep -R -w -n "$word" "$directory"
done