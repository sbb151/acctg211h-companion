# ACCTG 211H Companion

A modular online textbook for ACCTG 211H — *Honors Financial and Managerial Accounting for Decision Making* at the Smeal College of Business, Penn State.

## What this is

The Companion replaces a commercial textbook for ACCTG 211H. It treats accounting as the institutional response to specific information-economics problems (adverse selection, signaling, moral hazard, decentralization) and develops the relevant mechanics at the points where students encounter the questions those mechanics are designed to answer.

The book is organized into four arcs, mirroring the course structure:

- **Arc I — The Information Problem** (Chs. 1–5)
- **Arc II — Markets and Measurement** (Chs. 6–10)
- **Arc III — Contracting and Internal Information** (Chs. 11–13)
- **Arc IV — Synthesis** (Ch. 14)

Plus three appendices on the financial statement effects template (FSET), Python + WRDS in Colab quickstart, and a debits-and-credits cheat sheet.

## Building the book

The book is written in [Quarto](https://quarto.org). To build:

```bash
# Install Quarto (one time): https://quarto.org/docs/get-started/

# Render the full book to HTML
quarto render

# Or render to PDF
quarto render --to pdf

# Live preview while writing
quarto preview
```

## Repository structure

```
companion/
  _quarto.yml              # site configuration
  index.qmd                # course overview
  preface.qmd              # how to use this book
  references.qmd           # auto-generated bibliography page
  references.bib           # BibTeX file
  arc1-information/        # Arc I chapters
  arc2-markets/            # Arc II chapters
  arc3-internal/           # Arc III chapters
  arc4-synthesis/          # Arc IV chapters
  appendices/              # Appendices
  _book/                   # built output (gitignored)
  _freeze/                 # cache of executed code (gitignored)
```

## Authoring conventions

Each chapter follows the template in `preface.qmd`:

1. Opening question (the economic puzzle)
2. Stylized model
3. Institutional response
4. Mechanics
5. Empirical evidence
6. Discussion questions
7. Problems
8. Lab (where applicable)
9. Further reading

Use `[@citekey]` for parenthetical citations and `@citekey` for in-text citations. All references go in `references.bib`.

For numbered/labeled equations, use `{#eq-label}`. For figures and tables, use `{#fig-label}` and `{#tbl-label}`.

## License

Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International (CC BY-NC-SA 4.0). See `LICENSE`.

## Citation

If you use this material in your own teaching, please cite:

> Bonsall, Samuel B., IV. *ACCTG 211H Companion: An Information-Economics Introduction to Financial and Managerial Accounting.* Smeal College of Business, Penn State, 2027. https://acctg211h.psu.edu/
