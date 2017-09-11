#### CALCULATING JACCARD DISTANCE FROM BAETICA AREA #######

# working with Jaccard coefficient
library("vegan")

#load the data

mydata = csv.file("mydata.csv", header= T, sep=";")

#names(mydata) to see the name of the variables

#select Baetica area
mydata = subset(mydata, name %in% c("Baetica"))

#select Baetica area and type Dressel 20
mydata = subset(mydata, type %in% c("Dressel 20") & type %in% c("Dressel 20"))

