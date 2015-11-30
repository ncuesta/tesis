AUX_DIR = tmp
OUT_DIR = pdf
MAIN = main
OUT = tesis.pdf

TEX = pdflatex -output-directory $(AUX_DIR) -interaction nonstopmode -shell-escape
BIB = bibtex
GLS = makeglossaries

.PHONY: all bib gls dist clean

all: $(OUT) dist

$(OUT): $(MAIN).pdf

$(MAIN).pdf: $(MAIN).tex
	$(TEX) $<
	$(MAKE) gls
	$(MAKE) bib
	$(TEX) $<

gls:
	$(GLS) $(AUX_DIR)/$(MAIN)

bib:
	$(BIB) $(AUX_DIR)/$(MAIN)

dist:
	mv $(AUX_DIR)/$(MAIN).pdf $(OUT_DIR)/$(OUT)
	$(MAKE) clean

clean:
	rm -rfv $(AUX_DIR)/* _minted-main
