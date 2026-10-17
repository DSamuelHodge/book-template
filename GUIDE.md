# Writer's guide

How to actually use this starter, from first day to final proof. For installation and build commands, see `README.md`.

---

## 1. First day (about 30 minutes)

1. **Build once.** Run `make`. If `book.pdf` appears, your toolchain works.
2. **Fill in `notes/book-bible.md`.** Thesis, reader, promise, voice. Paste 2-3 of your best paragraphs as voice samples. This is the single most valuable file for the AI.
3. **Sketch `notes/outline.md`.** One line per chapter, stating the chapter's *job* (what the reader should have gained by the end). Rough is fine.
4. **Set title and author** in `main.tex`.
5. **Delete the example content** when ready: the two files in `chapters/` and their `\input` lines in `main.tex`, `figures/src/growth.py`, and `data/sample.csv`. Keep them until you've copied the patterns you like.
6. **Commit.** `git init && git add -A && git commit -m "Start book"`.

---

## 2. The daily loop

| Phase | What you do | Cursor setting |
|---|---|---|
| **Draft** | Write in one chapter file. Don't polish. Leave `\todo{}` and `\citeneeded` instead of stopping. | Snooze Tab (status bar), close the chat panel |
| **Edit** | Reread in the PDF, mark problems, fix with Cmd/Ctrl+K or ask Chat for critique | Tab on, Chat open |
| **Typeset** | Figures, tables, cross-references, overfull boxes, consistency passes | Agent mode |
| **Wrap up** | Add a line to `notes/log.md`, then commit | |

Rule of thumb: **never draft and edit in the same sitting** if you can avoid it. The AI makes polishing seductive, and polishing too early kills momentum.

---

## 3. Common tasks

### Add a chapter
1. Create `chapters/03-your-title.tex` starting with `\chapter{Your Title}\label{ch:your-title}`.
2. Add `\input{chapters/03-your-title}` to `main.tex`.
3. Add a line to `notes/outline.md`.

### Add a citation
1. Add the entry to `bib/refs.bib` (or let Zotero auto-export it).
2. Write a short note in `notes/research/<bibkey>.md` using `_template.md`.
3. Cite with `\autocite{key}` (inline) or `\sidecite{key}` (full reference in the margin).
4. Not sure of the source yet? Write `\citeneeded` and move on. Search for it later.

### Add a figure
Pick by what you're making:

| Need | Use | Where |
|---|---|---|
| Concept diagram, flow, schematic | TikZ | Inline in the chapter (see chapter 2 example) |
| Simple chart | pgfplots reading `data/*.csv` | Inline in the chapter |
| Complex or statistical chart | Python script | `figures/src/name.py`, output to `figures/out/name.pdf` |
| Graph/network layout | Graphviz | `figures/src/name.dot` |
| Quick flowchart | Mermaid | `figures/src/name.mmd` |

Size: `marginfigure` (small), `figure` (text width), `figure*` (full width). Always add a `\caption` that stands alone and a `\label{fig:...}`.

### Add a term
Add it to `notes/glossary.md`, introduce it once with `\defn{term}`, and use `\term{term}` afterwards.

### Use margin notes well
- `\sidenote{}`: numbered aside (use instead of footnotes)
- `\marginnote{}`: unnumbered aside
- `\sidecite{key}`: numbered full reference

---

## 4. Working with Cursor's AI

### Which feature for which job
- **Tab:** LaTeX boilerplate, tables, TikZ coordinates, citation keys. Snooze it while drafting prose.
- **Cmd/Ctrl+K:** local fixes to a selected passage ("cut 20%", "make this transition smoother").
- **Chat:** thinking partner. Critique, objections, outline questions. No edits.
- **Agent:** multi-file or build-related work. Scope it to one task and read the diff.

### Prompts that work
Always `@`-mention the files you want it to read.

**Critique (no rewriting)**
- "Read @chapters/03-x.tex and @notes/outline.md. Does this chapter deliver its job? List gaps. Don't edit."
- "Where would a skeptical reader push back? Quote the sentence for each."
- "Which claims here need evidence?"

**Local edits (Cmd/Ctrl+K)**
- "Tighten without changing my voice."
- "Give 3 alternative openings under 50 words."

**Consistency (Agent)**
- "Check @chapters/ against @notes/glossary.md. List inconsistent terms with file and line. Don't change anything yet."
- "Find every `\ref` or `\autocite` that doesn't resolve in the last build log @build/main.log."

**Research (from your notes only)**
- "Using only @notes/research/, what do my sources say about X? Cite by bib key."

**Figures**
- "Write TikZ for a diagram with these nodes... using the `box` and `flow` styles."
- Compile, screenshot the result, paste it into chat: "Move the label left, widen the gap between B and C."

### Guardrails
- The rules in `.cursor/rules/` already tell the AI to preserve your prose and never invent citations. If it misbehaves, reinforce in the prompt.
- **Verify every fact and quote** you'd be embarrassed to get wrong. Models fabricate plausible references.
- **Review every diff.** Reject anything that smooths your voice into generic prose.
- **One task per chat.** Start fresh when the topic changes.
- **Unpublished manuscript?** Check Cursor's privacy mode before pasting large chunks.

---

## 5. Version control habits

- Commit at the end of each session: `git commit -am "Draft ch3 section 2"`.
- Use a branch for risky restructures: `git switch -c restructure-part2`.
- If an AI edit goes wrong: `git diff` to inspect, `git restore <file>` to undo.
- Tag milestones: `git tag draft-1`, `git tag beta-readers`.

---

## 6. Weekly rhythm (suggested)

1. Read one finished chapter **in the PDF**, not the source. List issues in `notes/ideas.md` or on paper.
2. Fix them in an edit session.
3. Run `make words` and update `notes/log.md`.
4. Ask Chat to triage `notes/ideas.md` against the outline.
5. Run a consistency check (glossary, notation, recurring examples).

---

## 7. Before sharing or printing

- [ ] `grep -rn "todo\|citeneeded" chapters/` returns nothing
- [ ] `build/main.log` has no undefined references or citations
- [ ] No overfull boxes you care about (`grep Overfull build/main.log`)
- [ ] Every figure and table is referenced in the text and has a standalone caption
- [ ] Glossary terms are consistent
- [ ] Bibliography entries are complete (check DOIs and page numbers yourself)
- [ ] Reread the whole PDF once, start to finish
- [ ] Commit and tag the release

---

## 8. Troubleshooting

| Symptom | Fix |
|---|---|
| `File 'tufte-book.cls' not found` | Install TeX Live's `tufte-latex` package |
| Citations show as `(?)` or bibliography empty | Run `make` again; if still broken, run `biber build/main` then `make`. Check the key exists in `refs.bib` |
| Figure shows "Run make figures" | Run `make figures`; confirm Python and matplotlib are installed |
| Margin notes collide or float oddly | Move the `\sidenote` or figure to a neighbouring paragraph. Tufte margins are tight |
| Build fails on save in Cursor | Open the LaTeX Workshop output panel, or run `make` in a terminal for a readable error |
| Weird stale output | `make clean && make` |
| Fonts missing in matplotlib figures | Edit `font.serif` in `figures/src/style.mplstyle` to a font you have |