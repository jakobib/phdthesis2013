ARGS=-V "author-meta=Jakob Voß"\
	 -V "title-prefix=About Data"\
	 -V "include-before=$(shell cat templates/header.html)"\
	 -V "include-after=$(shell cat templates/footer.html)"\

HTML_ARGS=--css css/aboutdata.css

.SUFFIXES: .html .md

all: index.html publications.html

%.html: %.md
	@pandoc $< -o $@ --smart -t html5 $(HTML_ARGS) $(ARGS)
