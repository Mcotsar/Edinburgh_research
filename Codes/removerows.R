##EXAMPLE HOW TO REMOVE ROWS WITH ARTIFICIAL DATA

fakecity=sample(c("A","B","C","D","E"),300,replace=T)
fakecode=sample(1:50,300,replace=T)
dataset=cbind.data.frame(city=fakecity,code=fakecode) #create a fake dataset with 2 column

countlinepercity=tapply(dataset$code,dataset$city,length)
length(count) #to count the number of site
toremove=countlinepercity[countlinepercity<60] #take the city less than 60 lines
badcities=names(toremove)
dataset=dataset[ !(dataset$city %in% badcities),] #remove from the full dataset the line of the cities we don't want
#now dataset doesn't countain any cities with less than 60 lines

##HOW TO REMOVE ROWS

foo = read.csv("alldatabridger.csv")
countdata = tapply(foo$code, foo$site, length)
length(count)
removedata= countdata[countdata<10] #take the site less than 10 rows
badcities=names(removedata)
dataset= foo[!(foo$site %in% badcities),]
#to keep in a new file
write.csv(file="newfile.csv",dataset)



