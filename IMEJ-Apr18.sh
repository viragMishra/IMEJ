#!/bin/bash
#
# Compile IMEJ-Apr18.pdf
#
pdflatex IMEJ-Apr18.tex
bibtex IMEJ-Apr18
pdflatex IMEJ-Apr18.tex
pdflatex IMEJ-Apr18.tex