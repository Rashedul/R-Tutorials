library(tidyverse)
library(gapminder)

#facet
ggplot(gapminder, aes(lifeExp, gdpPercap)) +
    geom_point() + 
    facet_grid(continent~.)

#facet_wrap()

#coordinate flip
ggplot(gapminder, aes(continent, lifeExp)) +
    geom_boxplot() +
    coord_flip()

#theme
ggplot(gapminder, aes(continent, lifeExp, fill = continent)) +
    geom_boxplot() +
    theme_bw()


