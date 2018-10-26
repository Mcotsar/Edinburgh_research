#!/usr/bin/python3

import re

# this script removes everything except for lat, long and code. The code only has alphabetic characters and all of them are finally transformed to uppercase.

sep = ';'
stamps = open("allUK.csv", "r")
output = open("cleanedStamps2.csv", "w")
output.write("id"+sep+"lat"+sep+"long"+sep+"type"+sep+"site"+sep+"code\n")

listIds = list()
listStamps = dict()    
listTypes = list()
listSites = list()



for stamp in stamps:
    stampParsed = stamp.split(',')
    idStamp = stampParsed[1]
    latStamp = stampParsed[5]
    longStamp = stampParsed[6]
    typeStamp = stampParsed[2]
    siteStamp = stampParsed[3]

    code = None
    # if family
    if len(stampParsed)==9:
        code = stampParsed[8]
    # else pick the base code        
    else:
        code = stampParsed[7]
    # transform to upper
    code = code.upper()
    # remove everything except for A-Z
    codeCleaned = re.sub(r'[^A-Z]+', '', code)
    # remove empty codes
    print("id",idStamp,"code cleaned ",codeCleaned)
    if not codeCleaned:
        continue

    if idStamp in listIds:
        previousCodes = listStamps[idStamp]
        if codeCleaned in previousCodes:
            continue
    
    # Attention! Only Dressel 20
#    if typeStamp != "Dressel 20":
#        continue


    listIds.append(idStamp)
    
    if not idStamp in listStamps:
        listStamps[idStamp] = list()

    listStamps[idStamp].append(codeCleaned)

    listTypes.append(typeStamp)
    listSites.append(siteStamp)
    output.write(idStamp+sep+latStamp+sep+longStamp+sep+typeStamp+sep+siteStamp+sep+codeCleaned+'\n')

stamps.close()
output.close()


