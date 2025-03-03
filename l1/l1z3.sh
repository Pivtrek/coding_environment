#!/bin/bash

#wczytanie argumentu(ścieżki katalogu)
directory=("$1")

#deklaracja tablicy
declare -a directories

#zapisanie scieżek do wszystkich plików tekstowych
directories=($(find -type f -path "*$directory*"))

#deklaracja zmiennej do przechowania wszystkich slow z pliku
words=""

#wypisanie slow do pliku ale z bialymi znakami itd,
for file in "${directories[@]}"; do
	
	word=$(cat "$file" | tr -s '[:space:]' '\n' | sort | uniq)
	#word=$(cat "$file" | tr ' ' '\n' | grep -v '^$'| tr -d ' '| uniq -u |tr '[:space:]' '\n' )
	words="$words $word"
	
done

echo "$words" | tr -s '[:space:]' '\n' | sort | uniq -c


