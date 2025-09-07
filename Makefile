build:
	latexmk -pdf main

open: build
	open main.pdf

fresh:
	latexmk -C && latexmk -pdf main

clean:
	latexmk -C
