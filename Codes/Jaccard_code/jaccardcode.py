#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Tue Sep 12 17:04:06 2017

@author: mcotsar
"""

import csv, numpy

stampFile = open('baetica.csv', "r")
#other option to open file '~/Documents/Edinburgh_research/data.csv'
stamps = csv.reader(stampFile, delimiter = ",")

'''
other option
csvfile=csv.reader(stampFile)
for col in csvfile:
      print ( col[1] )
'''

#for row in stamps:
 #   print (row)
    
#header

stamps.__next__()

listSites = list()
listStamps = list()

for stamp in stamps:
    site = stamp[4]
    code = stamp[5]
    if site not in listSites:
        listSites.append(site)
        listStamps.append(list())

    siteIndex = listSites.index(site)
    stampsInSite = listStamps[siteIndex]
    if code not in stampsInSite:
       stampsInSite.append(code)
       
print("num sites:",len(listSites))

jaccard = numpy.zeros([len(listSites),len(listSites)])


nameSites = open("sites.csv", "w")
nameSites.write("id,name\n")
print(listSites)
for i in range(len(listSites)):
    print(i,"site:",listSites[i])
    nameSites.write(str(i)+","+listSites[i]+"\n")
nameSites.close()

for i in range(len(listSites)):
    for j in range(len(listSites)):
        if i == j:
          continue       
    
        codesA = listStamps[i]
        codesB = listStamps[j]
        
        both = 0
        one = 0
        
        for code in codesA:
            if code in codesB:
                both += 1
            else:
                one += 1
                
        for code in codesB:
            if code not in codesA:
               one += 1
               
        distance = one/(one+both)                
        jaccard[i,j] = distance

numpy.savetxt("jaccardDist.txt", jaccard, fmt='%.3f')
    
    
    
    
    
    
    
    
