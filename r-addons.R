## ====================================================
## R packages needed not available via mini-conda
## ====================================================

## ____________________________________________________
## Setting-up the source repository
local({
  r <- getOption("repos")
  r["CRAN"] <- "https://cloud.r-project.org"
  options(repos = r)
})
## ____________________________________________________

## ____________________________________________________
## R package needed for generating the PDF file
install.packages("pagedown")
## ____________________________________________________

## ____________________________________________________
## Additional R packages needed by the user
## remotes::install_github("")
## ____________________________________________________
