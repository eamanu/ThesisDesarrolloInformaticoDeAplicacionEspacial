SHELL=/bin/sh
THESIS=Scheletor

.SUFFIXES:
.SUFFIXES: .bib .pdf .tex
.PHONY: clean

run: $(THESIS).pdf

$(THESIS).pdf: biblio.bib $(THESIS).tex
	pdflatex $(THESIS).tex
	bibtex $(THESIS).aux
	pdflatex $(THESIS).tex -draftmode
	pdflatex $(THESIS).tex


$(THESIS).bbl: $(THESIS).aux
	bibtex $(THESIS).aux

$(THESIS).aux: $(THESIS).bib
	pdflatex $(THESIS).tex -draftmode
	pdflatex $(THESIS).tex -draftmode

clean:

	rm -f *.aux *.log *.toc *.backup *.out *.lof *.lot *.zip *.bbl *.blg *.nlo *~ secciones/*aux  secciones/*.bak *.bak bibliografia/*.bak

cleanall: clean

	rm -f *.pdf

open: $(THESIS).pdf

	evince $(THESIS).pdf &

package: $(THESIS).pdf 
	(find . -name "*.tex" && find . -name "makefile" && find . -name "maiedoc.sty" && find . -name "*.bib" && find . -name "*.bst" && find ./imagenes -name "*" && find ./secciones -name "*.pdf") | zip $(THESIS).zip -@ \
