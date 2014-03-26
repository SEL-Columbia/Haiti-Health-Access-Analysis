Analysis of Health Access in Haiti
----

See the pdf or html files for a walk-through of some ways of thinking about spatial analysis in Haiti.

If you want to reproduce the presentation, you want to follow the following steps:

 * Run `make download` in the command line -- This will download the population and health facilities data into the `data/` folder.
 * Install `R` and all the packages needed (`slidify`, `knitr`, and anything that is mentioned within a `require` inside the `Rmd` file.
 * Run `make` -- this will compile the Rmd file into the html / pdf files.

To change things, change the Rmd file, which is written in [R markdown](http://www.rstudio.com/ide/docs/authoring/using_markdown). I recommend using [Rstudio](http://www.rstudio.com/) which also has a "Knit HTML" button to do the same thing that `make` does.

