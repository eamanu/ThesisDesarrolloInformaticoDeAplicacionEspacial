#!/bin/sh

make cleanall
pdflatex Scheletor.tex
bibtex Scheletor.aux
bibtex Scheletor.aux
pdflatex Scheletor.tex
pdflatex Scheletor.tex
pdflatex Scheletor.tex
