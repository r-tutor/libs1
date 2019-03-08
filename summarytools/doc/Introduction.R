## ----setup, include=FALSE------------------------------------------------
library(knitr)
opts_chunk$set(comment = NA, prompt = FALSE, cache = FALSE, results = 'asis')
library(summarytools)
st_options(plain.ascii = FALSE,
           style = "rmarkdown",
           footnote = NA,
           subtitle.emphasis = FALSE)
if (dir.exists("./img")) {
  unlink("./img", recursive = TRUE)
}

## ---- echo=FALSE---------------------------------------------------------
st_css()

## ------------------------------------------------------------------------
library(summarytools)
freq(iris$Species, plain.ascii = FALSE, style = "rmarkdown")

## ------------------------------------------------------------------------
freq(iris$Species, report.nas = FALSE, headings = FALSE)

## ---- eval=FALSE---------------------------------------------------------
#  freq(tobacco[ ,c("gender", "age.gr", "smoker")])

## ------------------------------------------------------------------------
print(ctable(tobacco$smoker, tobacco$diseased, prop = "r"), method = "render")

## ------------------------------------------------------------------------
with(tobacco, 
     print(ctable(smoker, diseased, prop = 'n', totals = FALSE),
           headings = FALSE, method = "render"))

## ------------------------------------------------------------------------
descr(iris, style = "rmarkdown")

## ------------------------------------------------------------------------
descr(iris, stats = "common", transpose = TRUE, headings = FALSE)

## ---- eval=FALSE---------------------------------------------------------
#  library(summarytools)
#  view(dfSummary(iris))

## ---- eval=FALSE---------------------------------------------------------
#  dfSummary(tobacco, plain.ascii = FALSE, style = "grid",
#            graph.magnif = 0.75, valid.col = FALSE, tmp.img.dir = "/tmp")

## ------------------------------------------------------------------------
(iris_stats_by_species <- stby(data = iris, 
                               INDICES = iris$Species, 
                               FUN = descr, stats = c("mean", "sd", "min", "med", "max"), 
                               transpose = TRUE))

## ---- eval=FALSE---------------------------------------------------------
#  view(iris_stats_by_species)
#  # or
#  print(iris_stats_by_species, method = "viewer")

## ------------------------------------------------------------------------
data(tobacco)
with(tobacco, stby(BMI, age.gr, descr, 
                   stats = c("mean", "sd", "min", "med", "max")))

## ---- echo=FALSE---------------------------------------------------------
BMI_by_age <- with(tobacco, 
                   stby(BMI, age.gr, descr, transpose = TRUE,
                        stats = c("mean", "sd", "min", "med", "max")))
print(BMI_by_age, headings = FALSE)

## ---- eval=FALSE---------------------------------------------------------
#  stby(list(x = tobacco$smoker, y = tobacco$diseased), tobacco$gender, ctable)
#  # or equivalently
#  with(tobacco, stby(list(x = smoker, y = diseased), gender, ctable))

## ---- eval=FALSE, tidy=FALSE---------------------------------------------
#      knitr::opts_chunk$set(echo = TRUE, results = 'asis')

## ------------------------------------------------------------------------
print(dfSummary(tobacco, valid.col = FALSE, graph.magnif = 0.75), 
      max.tbl.height = 300, method = "render")

## ---- eval=FALSE---------------------------------------------------------
#  view(iris_stats_by_species, file = "~/iris_stats_by_species.html")

## ---- eval=FALSE---------------------------------------------------------
#  st_options()                      # display all global options values
#  st_options('round.digits')        # display the value of a specific option
#  st_options(style = 'rmarkdown')   # change one or several options' values
#  st_options(footnote = NA)         # Turn off the footnote on all outputs.
#                                    # This option was used prior to generating
#                                    # the present document.

## ------------------------------------------------------------------------
(age_stats <- freq(tobacco$age.gr)) 
print(age_stats, report.nas = FALSE, totals = FALSE, display.type = FALSE,
      Variable.label = "Age Group")

## ---- eval=FALSE---------------------------------------------------------
#  view(dfSummary(tobacco), custom.css = 'path/to/custom.css',
#       table.classes = 'tiny-text')

## ---- eval=FALSE---------------------------------------------------------
#  print(dfSummary(somedata, graph.magnif = 0.8),
#        method = 'render',
#        headings = FALSE,
#        bootstrap.css = FALSE)

## ------------------------------------------------------------------------
st_options(lang = "fr")

## ------------------------------------------------------------------------
freq(iris$Species)

## ---- eval = FALSE-------------------------------------------------------
#  Sys.setlocale("LC_CTYPE", "russian")
#  st_options(lang = 'ru')

## ---- results='hide'-----------------------------------------------------
Sys.setlocale("LC_CTYPE", "")
st_options(lang = "en")

