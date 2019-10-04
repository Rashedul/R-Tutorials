#
library(ggplot2)
library(dplyr)
library(dendextend)

x = read.table("~/Downloads/Leukemia_Carcinoma.tsv",header = T, fill = T)

#cluster without cell line
x2 = x[,3:8]
cl = na.omit(x2)
hc <- hclust(as.dist(1-cor(cl[,1:ncol(cl)], method="spearman")), method="complete")
hc <- hclust(as.dist(1-cor(cl[,1:ncol(cl)], method="pearson")), method="complete")

#par(mar=c(6,3,1,1))
#par(oma=c(10,2,0,0) )
d <- as.dendrogram(hc)
d <- d %>% color_branches(k=2) %>% 
    set("branches_lwd", 2) %>% 
    set("labels_col", c("black")) %>%
    set("leaves_pch", 19) %>%
    set("leaves_cex", 1) %>% 
    set("leaves_col", "black") 
plot(d, horiz  = F)

##
pca <- prcomp(t(cl))

library("factoextra")

fviz_eig(pca, addlabels = TRUE, ylim = c(0, 50))
fviz_pca_ind(pca)


