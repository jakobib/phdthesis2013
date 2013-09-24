HTML_ARGS=--css css/aboutdata.css

.SUFFIXES: .html .md

all: index.html patterns.html publications.html

%.html: %.md
	@pandoc $< -o $@ --smart -t html5 \
	  $(HTML_ARGS) \
		-V "author-meta=Jakob Voss" \
	 	-V "title-prefix=About Data" \
	 	-V "include-before=$(shell cat templates/header.html)" \
	  	-V "include-after=`cat templates/footer.html; date -r $< -Iminutes`</footer>"

.PHONY: patterns

patterns:
	@for MD in datapatterns2013/*.md; do \
		PATTERN=`basename $$MD .md`; \
		pandoc $$MD -t html5 --smart \
	  		--css ../css/aboutdata.css \
			-V "author-meta=Jakob Voss" \
			-V "title=$$PATTERN pattern" \
			-V "pagetitle=$$PATTERN pattern" \
			-V "include-before=$(shell cat templates/header.html | perl -pe 's{href=\"}{href=\"../}')" \
	  		-V "include-after=`cat templates/footer.html; date -r $$MD -Iminutes`</footer>" \
			| perl -pe 's{href="">([^<]+)<}{"href=\"".lc($$1).".html\">$$1<"}ge' \
		> patterns/$$PATTERN.html ; \
	done
