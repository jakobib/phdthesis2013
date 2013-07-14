MAIN=phdvoss

clean: # remove build artifacts
	@rm -f *.aux *.out *.bcf *.bbl *.blg *.log *.lot *.toc *.dvi *.lof \
		*.run.xml

patterns:
	cd datapatterns; make tex; cd ..
	@echo "Manual adjustment needed!"

new: clean
	pdflatex $(MAIN)
	biber    $(MAIN)
	pdflatex $(MAIN)


deposit: phdvoss-deposit.pdf

phdvoss-deposit.pdf: phdvoss.pdf
	@echo Disable all security settings
	@pdftk $< output $@ allow AllFeatures

.PHONY: clean patterns
