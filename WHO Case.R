library(tidyverse)
who <- tidyr::who
str(who)
summary(who)

who_unpivot <- who %>% 
  gather(new_sp_m014:newrel_f65, key = "key", value = "cases", na.rm = TRUE)
str(who_unpivot)
summary(who_unpivot)

who_unpivot %>%
  count(key)

#Replaced Strings
who2 <- who_unpivot %>% 
  mutate(key = stringr::str_replace(key, "newrel", "new_rel"))
who2

head(who2)


who3 <- who2 %>% 
  separate(key, c("new", "type", "sexage"), sep = "_")
who3

who3 %>% 
  count(new)

who4 <- who3 %>% 
  select(-new, -iso2, -iso3)

whocleaner <- who4 %>% 
  separate(sexage, c("sex", "age"), sep = 1)
whocleaner


whocleaner %>%
  group_by(country, year, sex) %>%
  filter(year > 1995) %>%
  summarise(cases = sum(cases)) %>%
  unite(country_sex, country, sex, remove = FALSE) %>%
  ggplot(aes(x = year, y = cases, group = country_sex, colour = sex)) +
  geom_line()


whocleaner %>%
  group_by(country, year, sex) %>%
  filter(year > 1995) %>%
  summarise(cases = sum(cases)) 




whocleaner %>%
  group_by(country, year, sex) %>%
  filter(year > 1995) %>%
  summarise(cases = sum(cases)) %>%
  unite(country_sex, country, sex, remove = FALSE)





whocleaner %>%
  group_by(country, year, sex) %>%
  filter(year > 2011) %>%
  summarise(cases = sum(cases)) %>%
  unite(country_sex, country, sex, remove = FALSE) %>%
  ggplot(aes(x = country, y = cases, colour = sex)) +
  geom_line()
