library(dplyr)
library(gapminder)

#
sum(3,2) %>% mean() %>% log()

#check header
gapminder %>% head()

#use pipe for gapminder data
gapminder %>% 
    select(country, pop) %>% 
    filter(country == "Bangladesh")

#use of mutate() function
gapminder %>% 
    mutate(TotalGDP = pop*gdpPercap) 

#use of arrange() function
gapminder %>% 
    mutate(TotalGDP = pop*gdpPercap) %>%
    arrange(TotalGDP) %>%
    arrange(desc(TotalGDP))

 
