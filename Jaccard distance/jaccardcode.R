###Code to calculate hieralchical clustering#####

library('stats')
library('graphics')
library('ggplot2')
library('ggdendro') #to create dendrograms
library('ape') #to create different types of dendrograms based on https://rstudio-pubs-static.s3.amazonaws.com/1876_df0bf890dd54461f98719b461d987c3d.html
#library('ggtree')


jac1= read.table("jaccardDist.txt")

# load site names
nameSites <- read.csv("sites.csv")
rownames(jac1) <- nameSites$name
colnames(jac1) <- nameSites$name


#install manually sudo apt-get install r-cran-ggplot2

HC = hclust(dist(jac1), method='complete')
plot(HC, main= "dendrograma de mierder")

#with ggdendro
#ggdendrogram(HT)

#keep the results
svg('resultados.svg', width=15, height=8)    
plot(HC)
dev.off()

#create circular dendrogram with "fan"

plot(as.phylo(HC), type = "fan")

#you can change it by "radial", etc.

# plots

library(reshape)
foo <- melt(as.matrix(jac1))
ggplot(foo, aes(x=X1, y=X2, fill=value, label=round(value, 2))) + geom_raster() + geom_text()

#count how many sites we have
jur <- read.csv("baeticadata.csv", sep=";")
jur
str(jur)
library(plyr)
count(jur$site)










