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
	word=$(cat "$file")
	words="$words $word"
done

#usuniecie bialych znakow, wypisanie wyrazow linia po linii, posortowanie i zliczenie 
echo -e "$words" | tr ' ' '\n' | grep -v '^$' | sort | uniq -c
