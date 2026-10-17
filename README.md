# Book starter (tufte-book + Cursor)

## Requirements
TeX Live/MacTeX (with `tufte-latex`, `biber`, `pgfplots`), `latexmk`, Python 3 + matplotlib.
Optional: `graphviz` (`.dot`), `@mermaid-js/mermaid-cli` (`.mmd`), `texcount`.

## Use
    make            # figures + PDF  (output: book.pdf)
    make watch      # rebuild on change
    make words      # word count
    make clean

In VSCode or Cursor: install **LaTeX Workshop**, open `main.tex`, save to build; PDF opens in a tab.
Rules for the AI live in `.cursor/rules/`. Fill in `notes/book-bible.md` first.

## Workflow
Draft with Tab snoozed (status bar) and no chat open. Edit with Cmd/Ctrl+K and Chat.
Use Agent for multi-file consistency passes. Commit after every session.
