AUX_DIR = tmp
OUT_DIR = pdf
MAIN = main
OUT = tesis.pdf

TEX = lualatex -output-directory $(AUX_DIR) -interaction nonstopmode -shell-escape -file-line-error-style
BIB = bibtex
GLS = makeglossaries

.PHONY: all bib gls dist clean shell

all: $(OUT) dist

$(OUT): clean $(MAIN).pdf

$(MAIN).pdf: $(MAIN).tex
	$(TEX) $<
	$(MAKE) gls
	$(MAKE) bib
	$(TEX) $<
	$(TEX) $<

gls:
	ln -s $(AUX_DIR)/$(MAIN).xdy
	$(GLS) $(AUX_DIR)/$(MAIN)

bib:
	$(BIB) $(AUX_DIR)/$(MAIN)

dist:
	mv $(AUX_DIR)/$(MAIN).pdf $(OUT_DIR)/$(OUT)
	$(MAKE) clean

clean:
	rm -rfv $(AUX_DIR)/* _minted-main $(MAIN).xdy

pyg-lexers:
	pygmentize -L lexers

pyg-styles:
	pygmentize -L styles

shell:
	/bin/bash
