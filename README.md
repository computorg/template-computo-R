
# Template for contribution to Computo for R users

[![build output](https://github.com/computorg/template-computo-Rmarkdown/workflows/build/badge.svg)](https://computorg.github.io/template-computo-R/)

Documentation and sample of a simple R-users submission for the Computo journal using our [Quarto-based](https://quarto.org) template. (_requires that Quarto is installed on your computer_).

Shows how to automatically setup and build the HTML and PDF outputs, ready to submit to our peer-review platform.

## Process overview

Submissions to Computo require both scientific content (typically equations, codes and figures) and a proof that this content is reproducible. This is achieved via [Quarto](https://quarto.org), which can be used on its own as a notebook system, but also to handle the standard notebook formats like ipynb or Rmarkdown. The current example is more focused on `R`-user. 

A Computo submission is thus a git(hub) repository like this one typically containing 

- the source of the notebook (a quarto .qmd file + a BibTeX + some statics files typically, _e.g._ figures)
- configuration files to setup the CI that builds the final notebook files in HTML and PDF (here, `renv.locks`, setup via the `renv` package). 

## Step-by-step procedure

### Step 0: setup a github repository

This can be simply achieved by using this repository as a template, via the "use this template" button on the top of this page.

**Note**: _You can rename the files at your convenience, but we suggest you to keep the name of the config files unchanged, unless you know what you are doing._

### Step 1. setup quarto on your system

TODO

### Step 2. write your contribution 

Write your notebook as usual, as demonstrated in the `template-computo-R.qmd` sample. More advanced features are examplified [in this page](https://computo.sfds.asso.fr/computo-quarto-extension/) or in our [remake fo the t-SNE paper](https://computo.sfds.asso.fr/published-paper-tsne/).

**Note**: _Make sure that you are able to build your manuscript as a regular notebook on your system before proceeding to the next step._

### Step 2: configure `renv`


### Step 3: proof reproducibility

It is now time to put everything together and check that your work is indeed reproducible! 

To this end, you need to rely on a github action, whose default is found here: [.github/workflows/build.yml](https://github.com/computorg/template-computo-R/blob/main/.github/workflows/build.yml)

This action will

- Check out repository for Github action on an Ubuntu machine
- Set up conda with the Python and R dependencies specified in `environment.yml`
- Render your Rmd file to HTML
- Deploy your HTML on a github page on the gh-page branch

### Step 4. submit

Once step 3 is successful, you should end up with an HTML version published as a gh-page. A PDF file can be obtained by clicking the "Export to PDF" button, which just calls the printing function of your browser (using Chrome should facilitate the rendering of your PDF). This PDF version can be submitted to the [Computo submission platform](https://computo.scholasticahq.com/):

<div id="scholastica-submission-button" style="margin-top: 10px; margin-bottom: 10px;"><a href="https://computo.scholasticahq.com/for-authors" style="outline: none; border: none;"><img style="outline: none; border: none;" src="https://s3.amazonaws.com/docs.scholastica/law-review-submission-button/submit_via_scholastica.png" alt="Submit to Computo"></a></div>
