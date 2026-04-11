#!/bin/bash

docker run --rm -v "$(pwd):/data" -u $(id -u):$(id -g) pandoc/extra \
  linux-course.md \
  -o linux-course.pdf \
  --template eisvogel \
  --syntax-highlighting idiomatic \
  --pdf-engine=xelatex \
  --number-sections \
  -V documentclass=book \
  -V classoption=oneside \
  -V top-level-division=chapter \
  -V lang=en \
  -V mainfont="DejaVu Sans" \
  -V monofont="DejaVu Sans Mono"

## // Full Docs can be found at :
## https://github.com/Wandmalfarbe/pandoc-latex-template
