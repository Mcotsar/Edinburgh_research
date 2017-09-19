###Code to calculate hieralchical clustering#####

library('stats')
library('graphics')
library('ggplot2')
library('ggdendro') #to create dendrograms
library('ggtree')

#install manually sudo apt-get install r-cran-ggplot2

jac1= read.table("jaccardDist.txt")
HC = hclust(dist(jac1), method='complete')
plot(HC, main= "dendrograma de mierder")

#with ggdendro
#ggdendrogram(HT)

#keep the results
svg('resultados.svg'), width=15, height=8)    
plot(HC)
dev.off()



