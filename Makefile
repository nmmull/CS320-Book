build:
	latexmk -pdf main
open: build
	open main.pdf
fresh:
	latexmk -C && latexmk -pdf main
draft:
	pdflatex draft.tex
draftopen: draft
	open draft.pdf
clean:
	latexmk -C
