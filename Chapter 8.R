library(tidyverse)
read_csv("a,b,c
1,2,3
         4,5,6")

read_csv("The first line of metadata
  The second line of metadata
         x,y,z
         1,2,3", skip =2)

read_csv("# A comment I want to skip
  x,y,z
  1,2,3", comment = "#")

read_csv("1,2,3\n4,5,6", col_names = FALSE)

read_csv("1,2,3\n4,5,6", col_names = c("x", "y", "z"))
read_csv("a,b,c\n1,2,.", na = ".")
x <- "x,y\n1,'a,b'"
read_delim(x, ",", quote = "'")
read_csv("a,b\n1,2,3\n4,5,6")
a <- parse_logical(c("T","F","NA"))
str(a)
parse_integer(c("1", "231", ".", "456"), na = ".")

charToRaw("Aakash")
date_names_langs()

?locale

challenge <- read_csv(readr_example("challenge.csv"))
problems(challenge)

challenge <- read_csv(
  readr_example("challenge.csv"), 
  col_types = cols(
    x = col_integer(),
    y = col_character()
  )
)

challenge <- read_csv(
  readr_example("challenge.csv"), 
  col_types = cols(
    x = col_double(),
    y = col_character()
  )
)

tail(challenge)
head(challenge)
head(challenge,40)

challenge <- read_csv(
  readr_example("challenge.csv"), 
  col_types = cols(
    x = col_double(),
    y = col_date()
  )
)
tail(challenge)
challenge2 <- read_csv(readr_example("challenge.csv"), 
                       guess_max = 1001)
write_rds(challenge, "challenge.rds")
read_rds("challenge.rds")

