#!/bin/sh

make cleanall
pdflatex Scheletor.tex
bibtex Scheletor.aux
pdflatex Scheletor.tex
pdflatex Scheletor.tex

