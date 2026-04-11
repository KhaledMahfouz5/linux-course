#!/bin/bash

docker run --rm -v "$(pwd):/data" -u $(id -u):$(id -g) pandoc/extra \
  linux-course.md \
  -o linux-course.pdf \
  --template eisvogel \
  --syntax-highlighting idiomatic \
  --pdf-engine=xelatex \
  --number-sections \
  -V classoption=oneside \
  -V lang=en

## // Full Docs can be found at :
## https://github.com/Wandmalfarbe/pandoc-latex-template
