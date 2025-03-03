#!/bin/bash

for x in './l1z'{{1..4},6,5,2}'.sh ./a';
do
	echo $'\n### ' ${x} $'###\n';
	${x} ; # uruchomienie ${x}
done