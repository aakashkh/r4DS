library(tidyverse)
library(nycflights13)
airlines
airports
planes
weather

planes %>%
  count(tailnum) %>%
  filter(n>1)


weather %>% 
  count(year, month, day, hour, origin) %>% 
  filter(n > 1)


flights %>% 
  count(year, month, day, flight) %>% 
  filter(n > 1)

flights %>% 
  count(year, month, day, tailnum) %>% 
  filter(n > 1) %>% 
  arrange(desc(n))

flights %>% 
  arrange(year, month, day, sched_dep_time, carrier, flight) %>%
  mutate(flight_id = row_number()) %>%
  glimpse()

flights2 <- flights %>% 
  select(year:day, hour, origin, dest, tailnum, carrier)
flights2


flights2 %>%
  select(-origin, -dest) %>% 
  left_join(airlines, by = "carrier")
  
flights2 %>%
  select(-origin, -dest) %>% 
  mutate(name = airlines$name[match(carrier, airlines$carrier)])


#Details of Joins
x <- tribble(
  ~key, ~val_x,
  1, "x1",
  2, "x2",
  3, "x3"
)
y <- tribble(
  ~key, ~val_y,
  1, "y1",
  2, "y2",
  4, "y3"
)
x;y

x %>%
  inner_join(y, by="key")

x <- tribble(
  ~key, ~val_x,
  1, "x1",
  2, "x2",
  2, "x3",
  1, "x4"
)
y <- tribble(
  ~key, ~val_y,
  1, "y1",
  2, "y2"
)

y %>%
  left_join(x,"key")

x <- tribble(
  ~key, ~val_x,
  1, "x1",
  2, "x2",
  2, "x3",
  3, "x4"
)
y <- tribble(
  ~key, ~val_y,
  1, "y1",
  2, "y2",
  2, "y3",
  3, "y4"
)

y%>%
  left_join(x, "key")
