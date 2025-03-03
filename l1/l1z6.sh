#!/bin/bash

#wczytanie argumentu(ścieżki katalogu)
directory=("$1")

unique_words=($(find "$directory" -type f -exec cat {} + | tr -s '[:space:]' '\n' | grep -v '^$' | sort | uniq))

for word in "${unique_words[@]}"; do
	
	regular_expression="(\\b($word)\\b).*\\b\\1\\b"
	if results=$(grep -R -w -n -E "$regular_expression" "$directory"); then
        echo "$word":
		echo "$results"  
    fi
done

