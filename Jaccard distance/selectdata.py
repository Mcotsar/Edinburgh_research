#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Tue Oct 10 13:53:04 2017

@author: mcotsar
"""

file=open('baeticatest.csv','r') #open the csv
allSite={} #this is the dicionary where you stor efor each site number of time it appears
output = open('fuckyeah.csv', 'w')

##a first loop you count for each site number of time it appears in the file       
for line in file:
    row=line.split(",") #here is jsut to split if the csv is spearated with "," or ";"
    site=row[4] #here you have to select the row where is the name of the site 
    if site in allSite:
    #if allSite.has_key(site): doesnt work in this version on Python
     allSite[site] = allSite[site]+1
    else:
        allSite[site]=1            
file=open('baeticatest.csv','r')

##a second loop where you print only the line with a site that apears more than 4 time
for line in file:
	row=line.split(",")
	site=row[4] 	#here you have to select the row where is the name of the site
	if allSite[site] >= 10 :
		output.write(line)
print("finish")
