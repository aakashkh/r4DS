library(nycflights13)
library(tidyverse)
flights
str(flights)

#Fiter
filter(flights, month ==1, day ==1)
jan1 <-  filter(flights, month ==1, day ==1)
(jan1 <-  filter(flights, month ==1, day ==1))

near(sqrt(2)^2,2)

filter(flights, month ==11 | month ==12)
nov_dec <- filter(flights, month %in% c(11,12))
filter(flights, arr_delay <= 120, dep_delay <= 120)

df <- tibble(x = c(1, NA, 3))
filter(df, is.na(df) | x > 2)


arrange(flights, year,month,day)
arrange(flights,desc(arr_delay))
df <- tibble(x = c(5, 2, NA))
arrange(df, x)

arrange(flights,desc(is.na(dep_time)),dep_time)

select(flights, year, month, day)
?select

select(flights,time_hour, air_time, everything())
select(flights, contains("TIME"))
vars <- c("year", "month", "day", "dep_delay", "arr_delay")
select(flights, one_of(vars))

select(flights, time_hour, air_time, time_hour)
select(flights, contains("TIME", ignore.case = FALSE))


flights_sml <- select(flights,
                      year:day,
                      ends_with("delay"),
                      distance,air_time)

mutate(flights_sml,
       gain = arr_delay - dep_delay,
       speed = distance/air_time *60,
       hours = air_time / 60,
       gain_per_hours = gain/hours
       )

transmute(flights,
          gain = arr_delay - dep_delay,
          hours = air_time / 60,
          gain_per_hour = gain/hours)


transmute(flights,dep_time,
          hour = dep_time %/% 100,
          minute =  dep_time %% 100)



x = seq(1:10)
x
cumsum(x)
cumprod(x)
cummin(x)
cummax(x)

y <- c(1, 2, 2, NA, 3, 4)
y
desc(y)
rank(y)
min_rank(y)
min_rank(desc(y))

transmute(flights, air_time, arr_time, dep_time,
          time = arr_time - dep_time)

1:3 + 1:10

summarise(flights, delay = mean(dep_delay, na.rm = TRUE))

by_day <- group_by(flights, year, month, day)

summarise(by_day, delay = mean(dep_delay, na.rm = TRUE))

by_dest <- group_by(flights,dest)
delay <-summarise(by_dest, count=n(),   
                  dist = mean(distance, na.rm = TRUE),
                  delay = mean(arr_delay, na.rm = TRUE))
delay
delay <- filter(delay, count > 20, dest != "HNL")


ggplot(data = delay, mapping = aes(x = dist, y = delay)) +
  geom_point(aes(size = count), alpha = 1/3) +
  geom_smooth(se = FALSE)

delays <- flights %>% 
  group_by(dest) %>% 
  summarise(
    count = n(),
    dist = mean(distance, na.rm = TRUE),
    delay = mean(arr_delay, na.rm = TRUE)
  ) %>% 
  filter(count > 20, dest != "HNL")

flights %>%
  group_by(year, month) %>%
  summarise(mean = mean(dep_delay, na.rm = TRUE))
  

not_cancelled <- flights %>% 
  filter(!is.na(dep_delay), !is.na(arr_delay))

not_cancelled %>% 
  group_by(year, month) %>% 
  summarise(mean = mean(dep_delay))

delays <- not_cancelled %>%
  group_by(tailnum) %>%
  summarise(
    delay = mean(arr_delay)
  )

ggplot(delays, aes(x= delay)) + geom_freqpoly(binwidth = 10)

delays <- not_cancelled %>% 
  group_by(tailnum) %>% 
  summarise(
    delay = mean(arr_delay, na.rm = TRUE),
    n = n()
  )

ggplot(data = delays, mapping = aes(x = n, y = delay)) + 
  geom_point(alpha = 1/10)



delays %>% 
  filter(n > 25) %>% 
  ggplot(mapping = aes(x = n, y = delay)) + 
  geom_point(alpha = 1/10)

batting <- as_tibble(Lahman::Batting)
batters <- batting %>% 
  group_by(playerID) %>% 
  summarise(
    ba = sum(H, na.rm = TRUE) / sum(AB, na.rm = TRUE),
    ab = sum(AB, na.rm = TRUE)
  )

batters %>% 
  filter(ab > 100) %>% 
  ggplot(mapping = aes(x = ab, y = ba)) +
  geom_point() + 
  geom_smooth(se = FALSE)
#> `geom_smooth()` using method = 'gam'

# Use logical in count - 5.6.4 LAST POINT

not_cancelled %>%
  count(dest)

not_cancelled %>%
  group_by(tailnum) %>%
  summarise(destination = sum(distance))

not_cancelled %>% count(tailnum, wt = distance)


