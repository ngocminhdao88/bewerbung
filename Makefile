LATEXMK=/home/minh/opt/texlive/bin/x86_64-linux/latexmk

.PHONY: all clean view debug

TEX_FILES=*.tex

# rule for create the main file using latexmk and pdflatex
all:
	$(LATEXMK) -pdf -synctex=1 -outdir=./output $(TEX_FILES)

# clean all the file
clean:
	$(LATEXMK) -C
	rm ./output/*
