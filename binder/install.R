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
## Additional R packages needed for generating Computo article
install.packages("pagedown")
remotes::install_github("computorg/computor")
## ____________________________________________________

## ____________________________________________________
## Additional R packages needed by the user
remotes::install_github("pneuvial/sanssouci@develop")
## ____________________________________________________

