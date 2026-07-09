# Not sourced by anything: this file exists purely so that `renv`'s static
# dependency scanner (`renv::dependencies()`, used by `renv::snapshot()`)
# records packages the Computo extension needs at render time but that
# nothing in this project's own code ever references.
#
# svglite: set as the HTML `knitr` chunk device (`dev: svglite` in the
# Computo extension) to render R plots with native SVG transparency
# support.
library(svglite)
