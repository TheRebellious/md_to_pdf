#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
if [[ $# -ne 1 ]]; then
    printf 'Usage: %s path/to/document.md\n' "${0##*/}" >&2
    exit 2
fi

INPUT_PATH="$(cd -- "$(dirname -- "$1")" && pwd)/$(basename -- "$1")"
if [[ ! -f "$INPUT_PATH" ]]; then
    printf 'Document not found: %s\n' "$INPUT_PATH" >&2
    exit 1
fi

MD_NAME="$(basename -- "$INPUT_PATH")"
MD_STEM="${MD_NAME%.*}"
OUTPUT_PATH="$(pwd)/$MD_STEM.pdf"

make -C "$SCRIPT_DIR" pdf \
    MD_FILE="$INPUT_PATH" \
    PDF_FILE="$OUTPUT_PATH"

printf 'Created %s\n' "$OUTPUT_PATH"
