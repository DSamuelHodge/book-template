PY_FIGS  := $(patsubst figures/src/%.py,figures/out/%.pdf,$(wildcard figures/src/*.py))
DOT_FIGS := $(patsubst figures/src/%.dot,figures/out/%.pdf,$(wildcard figures/src/*.dot))
MMD_FIGS := $(patsubst figures/src/%.mmd,figures/out/%.pdf,$(wildcard figures/src/*.mmd))

.PHONY: all pdf figures watch clean words
all: figures pdf

pdf:
	latexmk main.tex
	cp build/main.pdf book.pdf

figures: $(PY_FIGS) $(DOT_FIGS) $(MMD_FIGS)

figures/out/%.pdf: figures/src/%.py figures/src/style.mplstyle $(wildcard data/*.csv)
	mkdir -p figures/out
	python3 $<

figures/out/%.pdf: figures/src/%.dot
	mkdir -p figures/out
	dot -Tpdf $< -o $@

figures/out/%.pdf: figures/src/%.mmd
	mkdir -p figures/out
	mmdc -i $< -o $@

watch: figures
	latexmk -pvc main.tex

words:
	texcount -inc -brief -sum main.tex

clean:
	latexmk -C
	rm -rf build book.pdf
