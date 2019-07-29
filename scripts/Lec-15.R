install.packages("tidyverse")
library(tidyverse)
library(gapminder)

head(gapminder)

#bar
ggplot(gapminder, aes(continent)) +
    geom_bar()

#use of pipe in ggplot
gapminder %>%
    filter(year == 1952) %>%
    ggplot(aes(continent)) +
    geom_bar()

#plot population
head(gapminder)
gapminder %>%
    filter(year == 1952) %>% 
    ggplot(aes(continent, pop)) +
    geom_bar(stat = "identity")
#
gapminder %>%
    filter(year == 1952) %>% 
    ggplot(aes(continent, pop)) +
    geom_col()

#stacked bar

