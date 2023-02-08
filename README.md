
# Template for contribution to Computo for R users

[![build output](https://github.com/computorg/template-computo-R/workflows/build/badge.svg)](https://computorg.github.io/template-computo-R/)

Documentation and sample of a simple `R`-based submission for the [Computo journal](https://computorg.github.io), using our Quarto-based template and `renv` for handling dependencies.

Shows how to automatically setup and build the HTML and PDF outputs, ready to submit to our peer-review platform.

Additional details can be found [in the template manuscript](https://computo.sfds.asso.fr/template-computo-R). 

  ## Process overview

Submissions to [Computo](https://computorg.github.io) require both scientific content (typically equations, codes and figures, data) and a proof that this content is reproducible. This is achieved by means of [Quarto](https://quarto.org), a virtual environment fixing your dependencies and continuous integration (CI) (plus, if required, a external website such a [Zenodo](https://zenodo.org/) or [OSF](https://osf.io/) storing your large data files). 

A Computo submission is thus a git(hub) repository like this one typically containing 

- the sources of the notebook (a quarto .qmd file + a BibTeX + some statics files, _e.g._ figures or small data tables)
- configuration files to setup dependencies in a virtual environment
- configuration files to setup the CI that render the final HTML and PDF documents

In this template, we focus on `R` users and detail a solution based on

- The `knitr` kernel of Quarto for rendering the document,
- The `renv` package for setting the virtual environment,
- github action for handling the continuous integration.

## Step-by-step procedure

### Step 0: setup a git repository

Use this repository as a template via the "use this template" button on the top of this page.

**Note**: _You can use Gitlab for submitting for Computo. We hope giving more support for this in the future._

### Step 1. setup Quarto and Computo extension on your system

You need [quarto](https://quarto.org/) installed on your computer, as well as the [Computo extension](https://github.com/computorg/computo-quarto-extension) to prepare your document. 
The latter can be installed as follows:

```.bash
quarto add computorg/computo-quarto-extension
```

### Step 2. write your contribution 

Write your notebook as usual, [as demonstrated in the `template-computo-R.qmd` sample](https://computorg.github.io/template-computo-R/).

**Note**: _Make sure that you are able to build your manuscript as a standalone notebook on your system before proceeding to the next step._

### Step 3: setup dependencies with `renv`

Use the [`renv` package manager](https://rstudio.github.io/renv/articles/renv.html) to setup an reproducible environment handling your `R` dependencies.

### Step 4: proof reproducibility

Put everything together and check that your work is indeed reproducible. To this end, you need to rely on a github action, whose default is pre-configured and found here: [.github/workflows/build_n_publish.yml](https://github.com/computorg/template-computo-R/blob/main/.github/workflows/build_n_publish.yml)

This action will

1. Check out repository on the ubuntu-latest machine
2. Install quarto and dependencies, including the Computo extension for Quarto
3. Install a recent version of R
4. Install R Dependencies with `renv`, suing your `renv.lock` file
5. Render your .qmd file and Publish the results on a gh-page (both HTML and PDF)

**Note**: _Gitlab CI can be used to obtained similar results._

### Step 5. submit

Once step 4 is successful, you should end up with an HTML version published as a gh-page, as well as a PDF version (see "Other format" at the end of the table of content of the rendered HTML). This PDF version can be submitted to the [Computo submission platform](https://computo.scholasticahq.com/):

<div id="scholastica-submission-button" style="margin-top: 10px; margin-bottom: 10px;"><a href="https://computo.scholasticahq.com/for-authors" style="outline: none; border: none;"><img style="outline: none; border: none;" src="https://s3.amazonaws.com/docs.scholastica/law-review-submission-button/submit_via_scholastica.png" alt="Submit to Computo"></a></div>