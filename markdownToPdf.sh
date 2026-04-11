docker run --rm -v "$(pwd):/data" -u $(id -u):$(id -g) pandoc/extra linux-course.md -o linux-course.pdf --template eisvogel --syntax-highlighting idiomatic

## // Full Docs can be found at :
## https://github.com/Wandmalfarbe/pandoc-latex-template
