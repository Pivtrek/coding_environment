#!/bin/bash

set -x

svn export -q https://repo.cs.pwr.edu.pl/info/SP/l1/a/

tree a

cat l1-test.sh

./l1-test.sh > out

cat out 
