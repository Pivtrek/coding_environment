#!/bin/bash

#wczytanie numeru rewizji i url svn 
revision="$1"
svn_url="$2"

# Tymczasowy katalog na pobrane pliki
mkdir -p temp 

# Pobranie plików z poddrzewa do tymczasowego katalogu
svn export --force --quiet -r "$revision" "$svn_url" temp

#deklaracja tablicy
declare -a directories

#zapisanie scieżek do wszystkich plików tekstowych
directories=($(find temp -type f))

#deklaracja zmiennej do przechowania wszystkich slow z pliku
words=""

#wypisanie slow do pliku ale z bialymi znakami itd,
for file in "${directories[@]}"; do
	
	word=$(cat "$file" | tr -s '[:space:]' '\n' | sort | uniq)
	#word=$(cat "$file" | tr ' ' '\n' | grep -v '^$'| tr -d ' '| uniq -u |tr '[:space:]' '\n' )
	words="$words $word"
	
done

echo "$words" | tr -s '[:space:]' '\n' | sort | uniq -c

rm -r temp