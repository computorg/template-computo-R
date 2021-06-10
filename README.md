
# Template for a Computo submission based on Rmarkdown

[![build output](https://github.com/computorg/template-computo-Rmarkdown/workflows/build/badge.svg)](https://computorg.github.io/template-computo-Rmarkdown/)
<!--[![Binder](https://binder.pangeo.io/badge_logo.svg)](https://mybinder.org/v2/gh/computorg/template-computo-Rmarkdown/main?urlpath=rstudio)-->

Documentation and sample of an Rmarkdown-based submission for the Computo journal.

Show how to setup and automatically build the following outputs, ready to submit to our Peer-review platform: 

- [HTML output](https://computorg.github.io/template-computo-Rmarkdown/)
- [PDF output](https://computorg.github.io/template-computo-Rmarkdown/article.pdf)

## Process overview

Submissions to Computo require both scientific content (typically equations, codes and figures) and a proof that this content is reproducible. This is achieved via the standard notebook systems available for R, Python and Julia (Jupyter notebook and Rmarkdown), coupled with the binder building system. 

A Computo submission is thus a git(hub) repository like this one typically containing 

- the source of the notebook (a .Rmd file + a BibTeX + some statics files typically in `figs/`)
- configuration files for the binder environment to build the final notebook files, HTML and PDF (`environment.yml`, `r-addons.R` and optionnaly `apt.txt`). 

## Step-by-step procedure

### Step 0: setup a github repository

Clone/copy this repo to use it as a starter for your own contributions.

**Note**: _You can rename the .Rmd and .bib files at your convenience, but we suggest you to keep the name of the config files unchanged, unless you know what you are doing._

Typical git manipulations involves the following commands (change `my_github_account` and `my_article_for_computo`): by doing so, you will keep changes from the computo template if need (optional)

``` bash
git clone https://github.com/computorg/template-computo-Rmarkdown.git
git remote rm origin
git remote add origin https://github.com/my_github_account/my_article_for_computo.git
git remote add upstream https://github.com/computorg/template-computo-Rmarkdown
```

### Step 1. write your contribution 

Write your notebook as usual, as demonstrated in the `template-computo-Rmarkdown.Rmd` sample.

**Note**: _Make sure that you are able to build your manuscript as a regular notebook on your system before proceeding to the next step._

### Step 2: configure your binder environement

#### a. Setup Conda: `environment.yml`

The file `environment.yml` tells binder how to set-up the machine that will be use to build your notebook, with a conda environement. It must be setup to have all the dependencies required to run you notebook (R, Python or system). 

The default uses conda-forge and includes a couple of popular R packages, with a recent version of `R`:

``` yaml
name: computorbuild
channels:
  - conda-forge
dependencies:
  - r-base=4.1.0
  - r-codetools
  - r-remotes
  - r-reticulate
  - r-rmarkdown
  - r-tidyverse
  - r-plotly
```

The available feedstocks (Python modules and R packages) for conda-forge are listed here: [https://conda-forge.org/feedstock-outputs/index.html](https://conda-forge.org/feedstock-outputs/index.html).

#### b. Additional R packages: `r-addons.R`

If you need R dependencies _which are not available on any conda channel_, you can install them from source. In particular, you can install any R packages available on CRAN, on github or BioConductor. 

The file `r-addons.R` includes the commands performing these installations, which will be executed from the `R` instance of your binder. The default only installs the `pagedown` package from CRAN, which is required to generate the PDF file from the HTML output of your notebook. You can install any R packages that you need here, but be aware that it will slow down the whole process (the conda solution is the fastest as it contains precompiled versions).

```r
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
```

### Step 3: proof reproducibility

It is now time to put everything together and check that your work is indeed reproducible! 

To this end, you need to rely on a github action, whose default is found here: [.github/workflows/build.yml](https://github.com/computorg/template-computo-Rmarkdown/blob/main/.github/workflows/build.yml)

This action will

- Check out repository for Github action on a Mac OS machine
- Set up conda with the Python and R dependencies specified in `environment.yml`
- Render your Rmd file to HTML and PDF files
- Deploy your HTML on a github page on the gh-page branch

Note that, by default, your action is triggered only if you push a commit which includes the string `[build]` in its message (yes, we try to lower the footprint...).

### Step 4. submit

Once step 3 is successful, you should end up with an HTML version published as a gh-page and a corresponding PDF build via pagedown. The PDF file is named by default `article.pdf` is available at the root of your published gh-page (for this tempalte for instance, it is available at [https://computorg.github.io/template-computo-Rmarkdown/article.pdf](https://computorg.github.io/template-computo-Rmarkdown/article.pdf) since [https://computorg.github.io/template-computo-Rmarkdown/](https://computorg.github.io/template-computo-Rmarkdown/) is the URL of the gh-page associated with the current repo).

The PDF version can be submitted to the [Computo submission platform](https://computo.scholasticahq.com/):

<div id="scholastica-submission-button" style="margin-top: 10px; margin-bottom: 10px;"><a href="https://computo.scholasticahq.com/for-authors" style="outline: none; border: none;"><img style="outline: none; border: none;" src="https://s3.amazonaws.com/docs.scholastica/law-review-submission-button/submit_via_scholastica.png" alt="Submit to Computo"></a></div>
