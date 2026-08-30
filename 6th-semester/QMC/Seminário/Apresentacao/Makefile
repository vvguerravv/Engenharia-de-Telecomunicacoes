# make        gera o PDF e limpa os intermediários
# make clean  só limpa
# make purge  limpa e apaga o PDF
# make zip    empacota os fontes para subir no Overleaf

MAIN = apresentacao
AUX  = aux log nav out snm toc vrb bbl blg fls fdb_latexmk
ZIP  = $(MAIN)-overleaf.zip

all: $(MAIN).pdf

$(MAIN).pdf: $(MAIN).tex preambulo/*.tex topicos/*/*.tex referencias/referencias.tex
	pdflatex -interaction=nonstopmode $(MAIN).tex
	pdflatex -interaction=nonstopmode $(MAIN).tex
	@$(MAKE) --no-print-directory clean

clean:
	@rm -f $(foreach e,$(AUX),$(MAIN).$(e))

purge: clean
	@rm -f $(MAIN).pdf $(ZIP)

zip:
	@rm -f $(ZIP)
	@zip -q -r $(ZIP) $(MAIN).tex preambulo topicos referencias figuras \
		README.md ROTEIRO.md
	@echo "Gerado $(ZIP)"

.PHONY: all clean purge zip
