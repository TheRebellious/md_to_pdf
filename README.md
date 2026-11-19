# Markdown to PDF

Convert a Markdown document into a styled PDF with Pandoc and XeLaTeX. The Makefile provides the PDF settings and includes `header.tex` for table and page styling. This repository can be used on its own or as a submodule by `doc_to_pdf`.

## Requirements

- Pandoc
- GNU Make
- XeLaTeX from a TeX Live installation
- Arial as the main text font
- DejaVu Sans Mono as the default monospace font

The TeX installation must include the packages loaded by `header.tex`, including `booktabs`, `longtable`, `array`, `tabularx`, `colortbl`, `xcolor`, `etoolbox`, and `enumitem`.

## Usage

Convert a Markdown file with the wrapper:

```bash
./convert_md_to_pdf.sh /path/to/document.md
```

The PDF is written to the current working directory using the input file's base name. For example, `document.md` produces `document.pdf`.

You can also call Make directly:

```bash
make pdf MD_FILE=/path/to/document.md PDF_FILE=/path/to/output.pdf
```

The Makefile defaults to the first Markdown file in its directory. Set `MD_FILE` explicitly when running it from another project.

## Options

The Makefile accepts these variables:

| Variable | Default | Purpose |
| --- | --- | --- |
| `MD_FILE` | First `*.md` in this directory | Input Markdown file |
| `PDF_FILE` | Input name with `.pdf` extension | Output PDF file |
| `PDF_ENGINE` | `xelatex` | Pandoc PDF engine |
| `PDF_MARGIN` | `0.5in` | Page margin |
| `PDF_MONOFONT` | `DejaVu Sans Mono` | Font used for code and other monospaced text |

For example:

```bash
make pdf MD_FILE=document.md PDF_FILE=output.pdf PDF_MARGIN=0.75in
```

The main text uses Arial at 11pt with 1.15 line spacing. If Arial is unavailable, edit the Makefile's `mainfont` setting to use an installed font. You can override `PDF_MONOFONT` with another installed monospace font.

## Repository files

- `convert_md_to_pdf.sh` is the command-line wrapper.
- `Makefile` runs Pandoc with the configured PDF options.
- `header.tex` defines LaTeX table and document styling.
