#create data frame

df = data.frame(col1 = 1:4, col2 = 4:7, col3 = 7:10)

class(df)

#creat matrix
mat = matrix(1:10, nrow = 5, ncol = 2)

class(mat)

#one dimensional data
onedim = df$col1
onedim

class(onedim)

char = as.character(onedim)
class(char)

fac = as.factor(onedim)
class(fac)
