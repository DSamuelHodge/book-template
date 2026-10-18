# Book Project Instructions

This is a Tufte-style LaTeX book. Before writing or editing, consult `notes/book-bible.md` for the thesis, intended reader, promise, and voice; consult `notes/outline.md`, `notes/glossary.md`, and `notes/research/` when relevant.

## Voice and authorship

- The author writes the prose. Never write or rewrite a paragraph unless explicitly asked.
- When asked to edit, make the smallest change that works and preserve the author's sentence rhythm.
- Match the voice samples in `notes/book-bible.md`. Avoid filler openers such as "In today's world," stacked hedges, and tidy "In conclusion" endings.
- For review or critique requests, provide a list of issues only. Do not edit files.

## LaTeX structure and style

- Keep one chapter per file in `chapters/`, included from `main.tex` with `\input`.
- Keep prose as paragraphs with soft-wrapped lines. One sentence per line is fine if that matches the surrounding text.
- Use macros from `preamble/macros.tex`: `\term{}`, `\defn{}`, `\sidecite{}`, and `\todo{}`. Add new macros there, not inline.
- Prefer `\sidenote` or `\marginnote` over footnotes. Start chapters and major sections with `\newthought{}`.
- Do not add packages in chapter files. Add them to `preamble/packages.tex`.
- Use `~` before `\ref` and citation commands, and between numbers and units. Use `---` for em dashes and `--` for ranges.
- Leave `% TODO` and `\todo{}` markers in place.
- Follow terminology in `notes/glossary.md`.

## Citations and research

- Cite with `\autocite{key}` or `\sidecite{key}`. Only use keys present in `bib/refs.bib`.
- If a source is missing, write `\citeneeded`. Never invent a reference, DOI, page number, or quotation.
- Manuscript facts should trace to `notes/research/*.md` or `bib/refs.bib`.
- When asked about sources, answer only from `notes/research/` and say when those notes do not cover the question.

## Figures

- Make diagrams with TikZ, using the `box` and `flow` styles from `preamble/style.tex`.
- Make data charts with pgfplots and the `book plot` style reading `data/*.csv`, or use a Python script in `figures/src/` with the shared `figures/src/style.mplstyle`; scripts write PDFs to `figures/out/`.
- Every figure needs a standalone `\caption` and a `\label{fig:...}`. Refer to it as `Figure~\ref{...}`.
- Use `marginfigure` for small figures, `figure` for text-width figures, and `figure*` for full-width figures.

## Build and validation

- Run `make` to generate figures and build the PDF.
- After edits, check `build/main.log` for undefined references, undefined citations, and overfull boxes.