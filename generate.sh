#!/bin/bash

if [[ $# -ne 2 ]]; then
    echo "Please provide two parameters: template file <input.md> and output file <output.pdf>"
    exit 1
fi

template_file=$1
output_file=$2

pandoc "$template_file" \
-o "$output_file" \
--from markdown+yaml_metadata_block+raw_html \
--template eisvogel \
--table-of-contents \
--toc-depth 6 \
--number-sections \
--top-level-division=chapter \
--highlight-style tango \
--resource-path=.:src
