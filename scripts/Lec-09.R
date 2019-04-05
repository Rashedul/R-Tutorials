library(dplyr)
library(gapminder)

#use of summary() function
head(gapminder)

gapminder %>%
    summarise(minimum = min(pop),
              average = mean(pop),
              maximum = max(pop),
              total = n())

##use of group_ function
gapminder %>% 
    group_by(continent) %>%
    summarise(minimum = min(pop),
              average = mean(pop),
              maximum = max(pop),
              total = n())

gapminder %>% 
    group_by(continent, country) %>%
    summarise(minimum = min(pop),
              average = mean(pop),
              maximum = max(pop),
              total = n())


