build:
	latexmk -pdf main

fresh:
	latexmk -C && latexmk -pdf main

clean:
	latexmk -C
