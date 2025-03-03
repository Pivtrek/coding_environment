#!/bin/bash

#wczytanie argumentu(ścieżki katalogu)
directory=("$1")

#deklaracja tablicy
declare -a directories

#zapisanie scieżek do wszystkich plików tekstowych
directories=($(find -type f -path "*$directory*"))

for file in "${directories[@]}"; do
	tr 'a' 'A' < "$file" > temp.txt && mv temp.txt "$file"
done