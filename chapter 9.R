library(tidyverse)


stocks <- tibble(
  year   = c(2015, 2015, 2016, 2016),
  half  = c(   1,    2,     1,    2),
  return = c(1.88, 0.59, 0.92, 0.17)
)
stocks
stocks %>% 
  spread(year, return) %>% 
  gather("year", "return", `2015`:`2016`)

a <- stocks %>% 
  spread(year, return)

a
a %>%
  gather("year", "return", 
         `2015`:`2016`, convert = T)
preg <- tribble(
  ~pregnant, ~male, ~female,
  "yes",     NA,    10,
  "no",      20,    12
)
preg
gather(preg, sex, count, male, female)
gather('male', 'female', 
       key = 'sex', value = 'count', 
       data = preg)

#Gather, Spread, Separate and Unite

tibble(x = c("a,b,c", "d,e,f,g", "h,i,j")) %>% 
  separate(x, c("one", "two", "three"), extra = "drop")

#Missing Data
stocks <- tibble(
  year   = c(2015, 2015, 2015, 2015, 2016, 2016, 2016),
  qtr    = c(   1,    2,    3,    4,    2,    3,    4),
  return = c(1.88, 0.59, 0.35,   NA, 0.92, 0.17, 2.66)
)
stocks

stocks %>%
  spread(year, return) %>%
  gather(year, return, `2015`:`2016`, na.rm=T)

stocks %>%
  complete(year,qtr)

treatment <- tribble(
  ~ person,           ~ treatment, ~response,
  "Derrick Whitmore", 1,           7,
  NA,                 2,           10,
  NA,                 3,           9,
  "Katherine Burke",  1,           4
)

treatment %>%
  fill(person)
