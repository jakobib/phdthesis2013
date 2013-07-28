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


# TODO: keep bookmarks, metadata, and XMP (and color profile?)
deposit: phdvoss-deposit.pdf

phdvoss-deposit.pdf: phdvoss.pdf
	@pdftk $< dump_data > dump.info
	./scripts/pdfcrop.sh $< # this fails to keep bookmarks and metadata
	@pdftk cropped-phdvoss.pdf update_info dump.info output $@ allow AllFeatures

.PHONY: clean patterns
