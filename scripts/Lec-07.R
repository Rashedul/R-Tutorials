#install dplyr
install.packages("dplyr")

#load libraries
library(dplyr)
library(gapminder)

?dplyr

head(gapminder)

#extract column by 'select()'
select(gapminder, country)
select(gapminder, country, continent)
select(gapminder, -country)
select(gapminder, -country, -continent)

#get columns by partial matching of column names
select(gapminder, starts_with("c"))
select(gapminder, ends_with("p"))
select(gapminder, contains("co"))

#extract row by 'filter()'
temp = filter(gapminder, country != "Afghanistan")

temp2 = filter(gapminder, country %in% c("Afghanistan", "Australia"))

temp3 = filter(gapminder, year >= 1952, lifeExp >=40)

