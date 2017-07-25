## ------------------------------------------------------------------------
library(tokenizers)
options(max.print = 25)

james <- paste0(
  "The question thus becomes a verbal one\n",
  "again; and our knowledge of all these early stages of thought and feeling\n",
  "is in any case so conjectural and imperfect that farther discussion would\n",
  "not be worth while.\n",
  "\n",
  "Religion, therefore, as I now ask you arbitrarily to take it, shall mean\n",
  "for us _the feelings, acts, and experiences of individual men in their\n",
  "solitude, so far as they apprehend themselves to stand in relation to\n",
  "whatever they may consider the divine_. Since the relation may be either\n",
  "moral, physical, or ritual, it is evident that out of religion in the\n",
  "sense in which we take it, theologies, philosophies, and ecclesiastical\n",
  "organizations may secondarily grow.\n"
)

## ------------------------------------------------------------------------
tokenize_characters(james)[[1]] 

## ------------------------------------------------------------------------
tokenize_character_shingles(james, strip_non_alphanum = FALSE)[[1]][1:20]

## ------------------------------------------------------------------------
tokenize_words(james)

## ------------------------------------------------------------------------
tokenize_word_stems(james)

## ------------------------------------------------------------------------
tokenize_words(james, stopwords = stopwords())

## ------------------------------------------------------------------------
tokenize_sentences(james) 
tokenize_paragraphs(james)

## ------------------------------------------------------------------------
tokenize_ngrams(james, n = 5, n_min = 2)
tokenize_skip_ngrams(james, n = 5, k = 2)

## ------------------------------------------------------------------------
tokenize_lines(james)
tokenize_regex(james, pattern = "[,.;]")

