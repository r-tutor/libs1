## ----setup, include=FALSE-----------------------------------------------------
library(knitr)
opts_chunk$set(comment = NA, prompt = FALSE, cache = FALSE, results = 'asis')
library(kableExtra)
library(summarytools)
library(magrittr)
st_options(plain.ascii = FALSE,
           style = "rmarkdown",
           footnote = NA,
           subtitle.emphasis = FALSE,
           lang = "en")

## ---- echo=FALSE--------------------------------------------------------------
st_css()

## ---- results='asis', echo=FALSE----------------------------------------------
txt <- data.frame(
  Function = 
    c('<a href="#freq">freq()</a>',
      '<a href="#ctable">ctable()</a>',
      '<a href="#descr">descr()</a>',
      '<a href="#dfsummary">dfSummary()</a>&nbsp;&nbsp;'),
  Description = 
    c("**Frequency Tables** featuring counts, proportions, as well as missing data information",
      paste("**Cross-Tabulations** (joint frequencies) between pairs of discrete/categorical variables,",
            "featuring marginal sums as well as row, column or total proportions"),
      paste("**Descriptive (Univariate) Statistics** for numerical data, featuring common measures of",
            "central tendency and dispersion"),
      paste("Extensive **Data Frame Summaries** featuring type-specific information for all variables",
            "in a data frame: univariate statistics and/or frequency distributions, bar charts or",
            "histograms, as well as missing data counts and proportions. Very useful to quickly",
            "detect anomalies and identify trends at a glance"))
)

kable(txt, format = "html", escape = FALSE, align = c('l', 'l')) %>%
  kable_styling(full_width = FALSE, position = "left") %>%
  column_spec(1, bold = TRUE, monospace = TRUE, border_right = TRUE) %>%
  column_spec(2, width = "28em")

## -----------------------------------------------------------------------------
freq(iris$Species, plain.ascii = FALSE, style = "rmarkdown")

## -----------------------------------------------------------------------------
freq(iris$Species, report.nas = FALSE, headings = FALSE)

## -----------------------------------------------------------------------------
freq(iris$Species, report.nas = FALSE, totals = FALSE, 
     cumul = FALSE, headings = FALSE)

## ---- eval=FALSE--------------------------------------------------------------
#  freq(tobacco)

## -----------------------------------------------------------------------------
freq(tobacco$disease, order = "freq", rows = 1:5)

## ---- eval=FALSE--------------------------------------------------------------
#  view(freq(tobacco), collapse = TRUE)

## -----------------------------------------------------------------------------
print(ctable(x = tobacco$smoker, y = tobacco$diseased, prop = "r"),
      method = "render")

## -----------------------------------------------------------------------------
with(tobacco, 
     print(ctable(x = smoker, y = diseased, prop = 'n',
                  totals = FALSE, headings = FALSE),
           method = "render"))

## -----------------------------------------------------------------------------
library(magrittr)
tobacco %$%  # Acts like with(tobacco, ...)
  ctable(smoker, diseased,
         chisq = TRUE, OR = TRUE, RR = TRUE,
         headings = FALSE) %>%
  print(method = "render")

## -----------------------------------------------------------------------------
descr(iris)

## -----------------------------------------------------------------------------
descr(iris, stats = c("mean", "sd"), transpose = TRUE, headings = FALSE)

## ---- eval=FALSE--------------------------------------------------------------
#  view(dfSummary(iris))

## ---- eval=FALSE--------------------------------------------------------------
#  dfSummary(tobacco, plain.ascii = FALSE, style = "grid",
#            graph.magnif = 0.75, valid.col = FALSE, tmp.img.dir = "/tmp")

## ---- eval=FALSE--------------------------------------------------------------
#  dfs <- dfSummary(iris)
#  dfs$Variable <- NULL # This deletes the "Variable" column

## -----------------------------------------------------------------------------
(iris_stats_by_species <- stby(data = iris, 
                               INDICES = iris$Species, 
                               FUN = descr, stats = "common", transpose = TRUE))

## -----------------------------------------------------------------------------
with(tobacco, stby(data = BMI, INDICES = age.gr, 
                   FUN = descr, stats = c("mean", "sd", "min", "med", "max")))

## ---- eval=FALSE--------------------------------------------------------------
#  stby(list(x = tobacco$smoker, y = tobacco$diseased),
#       INDICES = tobacco$gender, FUN = ctable)
#  
#  # or equivalently
#  with(tobacco,
#       stby(list(x = smoker, y = diseased),
#            INDICES = gender, FUN = ctable))

## ---- eval=FALSE--------------------------------------------------------------
#  library(dplyr)
#  tobacco$gender %<>% forcats::fct_explicit_na()
#  tobacco %>% group_by(gender) %>% descr(stats = "fivenum")

## ---- echo=FALSE--------------------------------------------------------------
suppressPackageStartupMessages(library(dplyr))
library(magrittr)
tobacco$gender %<>% forcats::fct_explicit_na()
tobacco %>% group_by(gender) %>% descr(stats = "fivenum")

## ---- results='markup'--------------------------------------------------------
library(magrittr)
iris %>% descr(stats = "common") %>% tb()
iris$Species %>% freq(cumul = FALSE, report.nas = FALSE) %>% tb()

## ---- results='markup'--------------------------------------------------------
grouped_descr <- stby(data = exams, INDICES = exams$gender, 
                      FUN = descr, stats = "common")
grouped_descr %>% tb()

## ---- results='markup'--------------------------------------------------------
grouped_descr %>% tb(order = 2)

## ---- results='markup'--------------------------------------------------------
grouped_descr %>% tb(order = 3)

## ---- results='asis'----------------------------------------------------------
library(kableExtra)
library(magrittr)
stby(iris, iris$Species, descr, stats = "fivenum") %>%
  tb(order = 3) %>%
  kable(format = "html", digits = 2) %>%
  collapse_rows(columns = 1, valign = "top")

## ---- eval=FALSE--------------------------------------------------------------
#  view(iris_stats_by_species, file = "~/iris_stats_by_species.html")
#  view(iris_stats_by_species, file = "~/iris_stats_by_species.md")

## ---- eval=FALSE--------------------------------------------------------------
#  st_options()                      # Display all global options values
#  st_options('round.digits')        # Display the value of a specific option
#  st_options(style = 'rmarkdown',   # Set the value of one or several options
#             footnote = NA)         # Turn off the footnote for all html output

## -----------------------------------------------------------------------------
(age_stats <- freq(tobacco$age.gr)) 
print(age_stats, report.nas = FALSE, totals = FALSE, display.type = FALSE,
      Variable.label = "Age Group")

## ---- eval=FALSE--------------------------------------------------------------
#  print(dfSummary(tobacco), custom.css = 'path/to/custom.css',
#        table.classes = 'tiny-text', file = "tiny-tobacco-dfSummary.html")

## ---- eval=FALSE--------------------------------------------------------------
#  print(dfSummary(somedata, varnumbers = FALSE, valid.col = FALSE,
#                  graph.magnif = 0.8),
#        method = 'render',
#        headings = FALSE,
#        bootstrap.css = FALSE)

## -----------------------------------------------------------------------------
st_options(lang = "fr")

## -----------------------------------------------------------------------------
freq(iris$Species)

## ---- eval = FALSE------------------------------------------------------------
#  Sys.setlocale("LC_CTYPE", "russian")
#  st_options(lang = 'ru')

## ---- eval=FALSE--------------------------------------------------------------
#  Sys.setlocale("LC_CTYPE", "")
#  st_options(lang = "en")

## ---- eval=FALSE--------------------------------------------------------------
#  define_keywords(freq = "N")

