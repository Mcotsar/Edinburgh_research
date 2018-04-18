
library(stats)
library(dplyr, warn.conflicts = FALSE)
library(reshape2)
library(vegan)
library(reshape)
library(ggplot2)
library(dendextend)

foo = read.csv("baezone.csv")
#matrix
baeMatrix = acast(foo, site ~ code)
library(vegan)
baeDistance = vegdist(baeMatrix, method="horn")
hclust(baeDistance)
plot(hclust(baeDistance))


model = hclust(baeDistance)
pepedend = as.dendrogram(model)

regioncolors = c("red","blue","yellow")

 all_workshop_label=labels(pepedend)
 #all_workshop_label=labels(pepedend)

all_regions = c()
color_regions=c("olivedrab","steelblue4","tomato")
for (leaf in 1:length(all_workshop_label)){
print(leaf)
reg=unique(foo$region[ foo$site == all_workshop_label[leaf]])
all_regions=c(all_regions,reg)
print(reg)

}

labels_colors(pepedend,cex=1.5) = color_regions[all_regions]

par(mar=c(15,2,1,1))
plot(pepedend)


#to keep it 

pdf('dendro.pdf', width= 15, height=5)
#define the margen
par(mar=c(12,2,1,1))
plot(pepedend)
dev.off()
