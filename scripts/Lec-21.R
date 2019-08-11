library(gapminder)

head(gapminder)

write.table(gapminder, "~/Downloads/my_gapminder.txt", quote = FALSE, row.names = F, sep = "|")

#
x = read.table("~/Downloads/my_gapminder.txt", sep = "|", header = T)
colnames(x)

#
#install.packages("gdata")
library(gdata)

xl = read.xls("~/Downloads/example-file.xlsx")

#
#