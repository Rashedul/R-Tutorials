library(tidyverse)
library(gapminder)

head(gapminder)

#boxplot
ggplot(gapminder, aes(continent, lifeExp)) +
    geom_boxplot()

#violin
ggplot(gapminder, aes(continent, lifeExp, fill = continent)) +
    geom_violin(draw_quantiles = c(.25, .5, .75)) 

#jitter
ggplot(gapminder, aes(continent, lifeExp)) +
    geom_jitter(alpha = .2) +
    geom_violin(draw_quantiles = c(.25, .5, .75)) 

#
gapminder$continent = factor(gapminder$continent, levels = c("Oceania", "Europe", "Americas", "Asia", "Africa"))

#jitter
ggplot(gapminder, aes(continent, lifeExp)) +
    geom_jitter(alpha = .2) +
    geom_violin(draw_quantiles = c(.25, .5, .75)) 

#FORCATS
