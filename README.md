# Describing data patterns

This git repository contains the source code of my PhD thesis *Describing data
patterns*, submitted January 2013 at Humboldt University Berlin. The latest
version of the repository can be found at
<https://github.org/jakobib/phdthesis2013>.

The pattern language of data structuring (chapter 5) is contained in another
git repository that is included as git submodule from
<https://github.com/jakobib/datapatterns2013>.

## Document versions and variants

Multiple versions and variants of the thesis exists with different paper format
and minor changes. Each version should be buildable by checking out a tagged
revision from the git repository.

* The version originally submitted for review in January 2013. The document
  is printed in A4 paper format and tagged as `voss20130107` in the repository.

* The version submitted for deposit at Humboldt University document server
  <http://edoc.hu-berlin.de/>. The paper format is A5.

* A versions published as book at print-on-demand publisher CreateSpace with
  ISBN 1-4909-3186-4.

## Using this repository

To get the content of this repository, clone it including its submodules:

    git clone --recursive https://github.org/jakobib/phdthesis2013.git

The thesis is mainly written in LaTeX (with parts of chapter 5 written in
Pandoc Markdown). To build the document as PDF one requires at least LaTeX,
Pandoc, Perl, BibLaTeX with biber, Perl, GraphViz, and dot2tex.

Given the required packages, one should be able to create a PDF with:

    make patterns
    make new

## License

The content of this repository is licensed under CC-BY-SA: feel free to copy,
distribute, modify, merge, request changes etc, as long as the result is also
licensed under CC-BY-SA and attribution is explicitly given to Jakob Voß.

