## ----message = FALSE, fig.align='center', fig.showtext=TRUE--------------
library(showtext)
## Loading Google fonts (http://www.google.com/fonts)
font.add.google("Gochi Hand", "gochi")
font.add.google("Schoolbell", "bell")

## Automatically use showtext to render text
showtext.auto()

set.seed(123)
## Manually open a graphics device if you run this code in RStudio
## x11()
hist(rnorm(1000), breaks = 30, col = "steelblue", border = "white",
     main = "", xlab = "", ylab = "")
title("Histogram of Normal Random Numbers", family = "bell", cex.main = 2)
title(ylab = "Frequency", family = "gochi", cex.lab = 2)
text(2, 70, "N = 1000", family = "bell", cex = 2.5)

## ----echo=FALSE, fig.align='center', fig.showtext=TRUE-------------------
showtext.end()

set.seed(123)
hist(rnorm(1000), breaks = 30, col = "steelblue", border = "white",
     main = "Histogram of Normal Random Numbers", xlab = "", ylab = "Frequency")

showtext.begin()
text(2, 70, "N = 1000", family = "bell", cex = 2.5)
showtext.end()

showtext.begin()

