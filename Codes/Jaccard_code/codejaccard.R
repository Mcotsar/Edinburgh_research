#### CALCULATING JACCARD DISTANCE FROM BAETICA AREA #######

# working with Jaccard coefficient
library("vegan")

#load the data

mydata = read.csv("data.csv", header= T, sep=";")

#names(mydata) to see the name of the variables

#select Baetica area
mydata = subset(mydata, name %in% c("Baetica"))

#select Baetica area and type Dressel 20
mydata = subset(mydata, name %in% c("Baetica") & type %in% c("Dressel 20"))

