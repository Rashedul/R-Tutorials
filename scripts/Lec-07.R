#install dplyr
install.packages("dplyr")

#load libraries
library(dplyr)
library(gapminder)

?dplyr

head(gapminder)

#extract column by 'select()'
select(gapminder, country, continent)

select(gapminder, starts_with("c"))
select(gapminder, ends_with("p"))
select(gapminder, contains("c"))

select(gapminder, -(country:lifeExp))

#extract row by 'filter()'
temp = filter(gapminder, country != "Afghanistan")
filter(gapminder, country != "Afghanistan")

#filter Afghanistan and Australia
temp2 = filter(gapminder, country %in% c("Afghanistan", "Australia"))

#filter countries with 'stan' in their names
temp3 = filter(gapminder, !grepl("stan", country))

filter(gapminder, year == 1952, gdpPercap >=800)







