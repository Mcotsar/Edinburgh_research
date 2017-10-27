
foo <- read.csv("animals.csv")
foo
library(dplyr)
library(reshape2)    
animalsMatrix <- acast(animals, id~species, value.var="values")
library(vegan)
zooDistance <- vegdist(animalsMatrix, method="horn")
zooDistance
hclust(zooDistance)
plot(hclust(zooDistance))


####USE WITH BAETICA DATA#####

foo = read.csv("bae.csv")
library(dplyr)
#install.packages('dplyr', dependencies = TRUE) to install dependencies included
#install.packages('/home/mcotsar/Downloads/dplyr_0.7.4.tar.gz', repos=NULL, type='source') to install from exterior
library(reshape2)
baeMatrix = acast(foo, id ~ site, value.var= "code")
library(vegan)
baeDistance = vegdist(baeMatrix, method="horn")
baeDistance
hclust(baeDistance)
plot(hclust(baeDistance))
