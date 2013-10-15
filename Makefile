MAIN=phdvoss

clean: # remove build artifacts and temporary files
	@rm -f *.aux *.out *.bcf *.bbl *.blg *.log *.lot *.toc *.dvi *.lof \
		*.run.xml
	@rm -f *.tmp

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

summary: summary.pdf

summary.pdf: summary.tex summary.tmp
	@xelatex summary
	@biber summary
	@xelatex summary

summary.tmp: summary.md
	@pandoc $< -t latex --smart | sed -E 's/^\\(sub)?section/\\\1section*/' > $@

.PHONY: clean patterns
