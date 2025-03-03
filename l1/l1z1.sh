#!/bin/bash

#wczytanie argumentu(ścieżki katalogu do tablicy)
directory=("$1")

function files_in_catalog {
	find -type f -path "*$directory*" -printf "%f\n"
}

files_in_catalog
