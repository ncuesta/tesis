#!/bin/bash
set -e

WORKDIR=/latex
TARGET="$@"
[ -z "$TARGET" ] && TARGET=all

cd $WORKDIR
make $TARGET
#makeglossaries main
#bibtex main
#pdflatex -shell-escape main.tex
