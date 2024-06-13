
# Computo template for R users

[![build and publish](https://github.com/computorg/template-computo-R/actions/workflows/build.yml/badge.svg)](https://github.com/computorg/template-computo-R/actions/workflows/build.yml)

Documentation and sample of a simple `R`-based submission for the [Computo journal](https://computorg.github.io), using our Quarto-based template and `renv` for handling dependencies.

It shows how to automatically setup and build the HTML and PDF outputs, ready to submit to our peer-review platform.

:warning: **All important information about writing and preparing an article to be submitted to Computo, and related technicalities** are detailed [in the template manuscript](https://computo.sfds.asso.fr/template-computo-R). :warning:

More information about submission and **guidelines for authors** can be found on the [dedicated page](https://computo.sfds.asso.fr/submit/).

## Process overview

Submissions to [Computo](https://computorg.github.io) require both scientific content (typically equations, codes and figures, data) and a proof that this content is reproducible. This is achieved by means of i) a notebook system, ii) a virtual environment fixing the dependencies and iii) continuous integration (plus, if needed, an external website to store large data files such a [Zenodo](https://zenodo.org/) or [OSF](https://osf.io/) ). 

A Computo submission is thus a git(hub) repository like this one containing 

- the source files of the notebook (a quarto `.qmd` file + a BibTeX `.bib` file + some statics files, _e.g._ figures or small `.csv` data tables)
- configuration files to set up the dependencies in a virtual environment
- configuration files to set up the continuous integration rendering the final documents

In this template, we focus on `R` users and detail a solution based on

- The `knitr` kernel of Quarto for rendering the document,
- The `renv` package for setting the virtual environment,
- Github actions for handling the continuous integration.

## Step-by-step procedure

### Step 0: setup a git repository

Use this repository as a template via the **"use this template"** button on the top of this page.

**Note**: _You can use Gitlab for submitting for Computo. We hope giving more support in the future._

### Step 1. setup Quarto and Computo extension on your system

You need [quarto](https://quarto.org/) installed on your computer, as well as the [Computo extension](https://github.com/computorg/computo-quarto-extension) to prepare your document. 
The latter can be installed as follows:

```.bash
quarto add computorg/computo-quarto-extension
```

### Step 2. write your contribution 

Write your notebook as usual, [as demonstrated in the `template-computo-R.qmd` sample](https://computorg.github.io/template-computo-R/).

**Note**: _Make sure that you are able to build your manuscript as a standard notebook on your system before proceeding to the next step._

To build your document (both in PDF and HTML by default), you can run the command `quarto render`, e.g. for the template:

```.bash
quarto render template-computo-R.qmd # will render both to html and PDF
```

### Step 3: setup dependencies with `renv`

Use the [`renv` package manager](https://rstudio.github.io/renv/articles/renv.html) to setup a reproducible environment handling your `R` dependencies.

See [this page](https://computo.sfds.asso.fr/template-computo-R/#handle-r-dependencies-with-renv) for more details about `R` dependency setup.

### Step 4: proof reproducibility

Put everything together and check that your work is indeed reproducible. To this end, you need to rely on a github action, whose default is pre-configured and found here: [.github/workflows/build.yml](https://github.com/computorg/template-computo-R/blob/main/.github/workflows/build.yml)

This action will

1. Check out repository on the ubuntu-latest machine
2. Install quarto and dependencies, including the Computo extension for Quarto
3. Install R and dependencies with `renv`, using your `renv.lock` file
4. Render your .qmd file and Publish the results on a gh-page (both HTML and PDF)

**Note**: _Gitlab CI can be used to obtained similar results._

### Step 5. submit

Once step 4 is successful, you should end up with an HTML version published as a gh-page, as well as a PDF version (see "Other format" at the end of the table of content of the rendered HTML). This PDF version can be submitted to the [OpenReview platform](https://openreview.net/group?id=Computo).
