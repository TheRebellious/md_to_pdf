PDF_MARGIN ?= 0.5in
PDF_ENGINE ?= xelatex
MD_FILE ?= $(firstword $(wildcard *.md))
PDF_FILE ?= $(basename $(MD_FILE)).pdf

PDF_OPTIONS = \
	-V geometry:margin="$(PDF_MARGIN)" \
	-V table-use-row-colors=true \
	-V colorlinks=true \
	-H header.tex

.PHONY: pdf
pdf:
	@test -n "$(MD_FILE)" || { echo "No Markdown input found; set MD_FILE=path/to/file.md" >&2; exit 1; }
	@test -f "$(MD_FILE)" || { echo "Markdown file not found: $(MD_FILE)" >&2; exit 1; }
	pandoc "$(MD_FILE)" \
		--resource-path="$(dir $(MD_FILE)):." \
		--pdf-engine=$(PDF_ENGINE) \
		--variable=mainfont:"Arial" \
		--variable=fontsize:11pt \
		--variable=linestretch:1.15 \
		--variable=table-of-contents:false \
		$(PDF_OPTIONS) \
		-o "$(PDF_FILE)"
