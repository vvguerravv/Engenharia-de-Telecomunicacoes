# make        gera o PDF e limpa os intermediários
# make clean  só limpa
# make purge  limpa e apaga o PDF

MAIN = apresentacao
AUX  = aux log nav out snm toc vrb bbl blg fls fdb_latexmk

all: $(MAIN).pdf

$(MAIN).pdf: $(MAIN).tex preambulo/*.tex topicos/*/*.tex referencias/referencias.tex
	pdflatex -interaction=nonstopmode $(MAIN).tex
	pdflatex -interaction=nonstopmode $(MAIN).tex
	@$(MAKE) --no-print-directory clean

clean:
	@rm -f $(foreach e,$(AUX),$(MAIN).$(e))

purge: clean
	@rm -f $(MAIN).pdf

.PHONY: all clean purge
