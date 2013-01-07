MAIN=phdvoss

clean: # remove build artifacts
	@rm -f *.aux *.out *.bcf *.bbl *.blg *.log *.lot *.toc *.dvi *.lof

new: clean
	cd datapatterns; make tex; cd ..
	pdflatex $(MAIN)
	biber    $(MAIN)
	pdflatex $(MAIN)

.PHONY: clean
