fname = PlanTesis

texFiles = ./secciones/*.tex \



$(fname).pdf: $(fname).tex $(texFiles)



%.pdf:

	pdflatex -interaction nonstopmode $< > /dev/null || (cat $(fname).log && false)

	rm *.pdf

	pdflatex -interaction nonstopmode $< > /dev/null || (cat $(fname).log && false)

	echo "$(fname).pdf generated"



clean:

	rm -f *.aux *.log *.toc *.backup *.out *.lof *.lot *.zip *.bbl *.blg *.nlo *~ secciones/*aux  secciones/*.bak



cleanall: clean

	rm -f *.pdf



open: $(fname).pdf

	okular $(fname).pdf &

package: $(fname).pdf 
	(find . -name "*.tex" && find . -name "makefile" && find ./imagenes -name "*" && find ./secciones -name "*.pdf") | zip $(fname).zip -@ \
