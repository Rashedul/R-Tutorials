#install.packages("ggplot2")
library(ggplot2)

#
head(mpg)

ggplot(mpg, aes(displ, hwy, color = class)) +
    geom_point()

#
ggplot(mpg, aes(displ, cty, color = trans)) +
    geom_point()
#

#
df = data.frame(col1 = 1:3, col2 = c(1,4,2))

ggplot(df, aes(col2, col1)) +
    geom_point(size = 5, shape = 21, stroke = 3) +
    geom_line(size = 2, color = "red")

#
    
    
