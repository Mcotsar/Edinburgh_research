#foo read.csv

reps <- count(foo, vars=c("V5","V6"))
reps$freq <- NULL
jur <- count(reps, vars=c("V6"))

library(ggplot2)
ggplot(jur, aes(x=freq)) + geom_histogram()

codes <- subset(jur, freq>1)
aaa <- subset(foo, V6 %in% codes$V6)
write.table(aaa, "filtered.csv", row.names=F, sep=",", quote=F)

