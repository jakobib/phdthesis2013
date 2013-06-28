MAIN=phdvoss

clean: # remove build artifacts
	@rm -f *.aux *.out *.bcf *.bbl *.blg *.log *.lot *.toc *.dvi *.lof

patterns:
	cd datapatterns; make tex; cd ..
	@echo "Manual adjustment needed!"

new: clean
	pdflatex $(MAIN)
	biber    $(MAIN)
	pdflatex $(MAIN)

.PHONY: clean patterns
