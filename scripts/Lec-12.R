#install pheatmap
#install.packages("pheatmap")
library(pheatmap)

#make a dataframe/matrix
head(mtcars)
class(mtcars)

df = scale(mtcars)

pheatmap(df, 
         border_color = "red",
         cluster_rows = T,
         cutree_rows = 3,
         show_rownames = T,
         fontsize = 8,
         display_numbers = T)

#
pheatmap(mtcars, scale = "column")

#


