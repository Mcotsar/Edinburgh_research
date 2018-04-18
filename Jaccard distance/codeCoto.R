####Calculating BAETICA DATA#####

library(stats)
foo = read.csv("bae.csv")
library(dplyr, warn.conflicts = FALSE)
#install.packages('dplyr', dependencies = TRUE) to install dependencies included
#install.packages('/home/mcotsar/Downloads/dplyr_0.7.4.tar.gz', repos=NULL, type='source') to install from exterior
library(reshape2)
#baeMatrix = acast(foo, id ~ site, value.var= "code")
#baeMatrix = acast(foo, site ~ site, value.var="code")
baeMatrix = acast(foo, site ~ code)
library(vegan)
baeDistance = vegdist(baeMatrix, method="horn")
#baeDistance = vegdist(baeMatrix, method= "horn", na.rm= TRUE) na.rm when data is missing. Read ?vedist
baeDistance
hclust(baeDistance)
#use summary to see the results
plot(hclust(baeDistance))

##plot matrix

library(reshape)
library(ggplot2)
roo <- melt(as.matrix(baeDistance))
ggplot(roo, aes(x=X1, y=X2, fill=value, label=round(value, 2))) + geom_raster() + geom_text() #always use X1, X2

#print the results
pdf('resultadosnew.pdf', width=15, height=8)    
plot(hclust(baeDistance))
dev.off()

#print the matrix
pdf('resultadosmatrix.pdf', width=35, height=10) 
ggplot(roo, aes(x=X1, y=X2, fill=value, label=round(value, 2))) + geom_raster() + geom_text()
dev.off()

#para contar de que datos se disponen

count(mydata$site) 
names(mydata) #para saber el nombre de los valores (columnas)

#check by different region: Hispalis, Corduba and Astigi. Download the baezone.csv
myData= subset(foo, region %in% c("Hispalis")) 


###plot de puntitos para hacer frequencia


library(ggplot2)

ggplot(stamp, aes(y = region, x = code)) + geom_point()

#library plyr (no confuse with dplyr)
count(stamp$code)

sasa = count(stamp$code)
idiot = sasa$freq

matrix 

#list of all the sites to make a matrix
sites=sort(unique(foo$site))
#to add the regions
sites = unique(foo[,c("site","region")])

#to order the lsi tof sites with the regions
sites = sites[order(sites$site),]


foo=as.matrix(table(unique(stamp[,c("site","code")])))
write.csv(foo,"matrixfoo.csv")

how to make a matrix

sites$foo = rowSums(matrix)

ggplot(sites, aes(y=reorder(region, foo, FUN=sum), x=foo, fill=region)) + geom_jitter(col="grey50", alpha=0.5, shape=21, height=0.2, width=0.3, size=3) + scale_colour_manual(values=myPalette) + theme_bw() + theme(legend.position="None") + xlab("number of code stamps") + ylab("region")

















