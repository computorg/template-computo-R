# Not sourced by anything: this file exists purely so that `renv`'s static
# dependency scanner (`renv::dependencies()`, used by `renv::snapshot()`)
# records packages the Computo extension needs at render time but that
# nothing in this project's own code ever references.
#
# renv skips gitignored paths when scanning for dependencies, and the
# extension (_extensions/) is always gitignored here (it's fetched fresh by
# `quarto add` in CI), so a reference placed inside the extension itself is
# never seen by *this* project's renv::snapshot() - it has to live in a
# tracked file instead.
#
# svglite: set as the HTML `knitr` chunk device (`dev: svglite` in the
# Computo extension) to render R plots with native SVG transparency
# support. Without this explicit reference, renv::snapshot() silently
# drops svglite, renv::restore() succeeds, and rendering only fails later,
# as soon as a plot needs to be drawn ("there is no package called
# 'svglite'").
library(svglite)
