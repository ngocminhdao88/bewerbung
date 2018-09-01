LATEXMK=/home/minh/opt/texlive/bin/x86_64-linux/latexmk

.PHONY: all clean view debug

TEX_FILES=$(wildcard *.tex)
PDF_FILES=$(sort $(addprefix ./output/, $(TEX_FILES:.tex=.pdf)))

# rule for create the main file using latexmk and pdflatex
all: $(TEX_FILES)
	$(LATEXMK) -pdf -synctex=1 -outdir=./output $(TEX_FILES)

join: $(PDF_FILES)
	gs -dBATCH -dNOPAUSE -q -sDEVICE=pdfwrite -dAutoRotatePages=/None -sOutputFile=./output/dao_unterlagen.pdf  $(PDF_FILES)

# clean all the file
clean:
	$(LATEXMK) -C
	rm ./output/*
