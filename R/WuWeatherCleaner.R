library(lubridate)

accuWeatherData = read.csv(file = "C:/Users/sayanigupta/Downloads/WuWeatherData.csv", header = T, sep = ",")

accuWeatherData[, "WD"] = sapply(accuWeatherData[, "WD"], as.character)

windDir = accuWeatherData$WD

for(i in 1:length(windDir)){
    if(windDir[i] == "E"){
        accuWeatherData[i, 9] = "1"
    }
    else if(windDir[i] == "ENE"){
        accuWeatherData[i, 9] = "2"
    }
    else if(windDir[i] == "ESE"){
        accuWeatherData[i, 9] = "3"
    }
    else if(windDir[i] == "N"){
        accuWeatherData[i, 9] = "4"
    }
    else if(windDir[i] == "NE"){
        accuWeatherData[i, 9] = "5"
    }
    else if(windDir[i] == "NNE"){
        accuWeatherData[i, 9] = "6"
    }
    else if(windDir[i] == "NNW"){
        accuWeatherData[i, 9] = "7"
    }
    else if(windDir[i] == "NW"){
        accuWeatherData[i, 9] = "8"
    }
    else if(windDir[i] == "S"){
        accuWeatherData[i, 9] = "9"
    }
    else if(windDir[i] == "SE"){
        accuWeatherData[i, 9] = "10"
    }
    else if(windDir[i] == "SSE"){
        accuWeatherData[i, 9] = "11"
    }
    else if(windDir[i] == "SSW"){
        accuWeatherData[i, 9] = "12"
    }
    else if(windDir[i] == "SW"){
        accuWeatherData[i, 9] = "13"
    }
    else if(windDir[i] == "W"){
        accuWeatherData[i, 9] = "14"
    }
    else if(windDir[i] == "WNW"){
        accuWeatherData[i, 9] = "15"
    }
    else if(windDir[i] == "0"){
        accuWeatherData[i,9] = "0"
    }
    else{
        accuWeatherData[i, 9] = "16"
    }
}

m = levels(accuWeatherData$Date)
ref = 96
row.num = length(m)*ref
df = data.frame(matrix(ncol = 45, nrow = row.num))
colnames(df) = c("Date", "Time", "Day", "Type of Day", "ToD", "Temp-Amritsar", "Temp-Batinda", "Temp-Jalandhar", "Temp-Ludhiana", "Temp-Patiala", "Temp-Sangrur", "Humidity-Amritsar", "Humidity-Batinda", "Humidity-Jalandhar", "Humidity-Ludhiana", "Humidity-Patiala", "Humidity-Sangrur", "CC-Amritsar", "CC-Batinda", "CC-Jalandhar", "CC-Ludhiana"    , "CC-Patiala", "CC-Sangrur", "WD-Amritsar", "Dummy-Amrit", "WD-Batinda", "Dummy-Bat", "WD-Jalandhar", "Dummy-Jal", "WD-Ludhiana", "Dummy-Lud", "WD-Patiala",     "Dummy-Pat", "WD-Sangrur", "Dummy-San", "Load", "", "", "Date", "Amritsar", "Batinda", "Jalandhar", "Ludhiana", "Patiala", "Sangrur")

time = c(rep(24, each = 4), rep(1:23, each = 4))

for(i in 1:ref*1){
    df[i,1] = m[1]
    df[i,2] = time[i]
    df[i,3] = wday(as.Date(m[1], "%Y-%m-%d"))
    if(wday(as.Date(m[1], "%Y-%m-%d")) != 7 | wday(as.Date(m[1], "%Y-%m-%d")) != 1){
        df[i,4] = 0
    }
    else{
        df[i,4] = 1
    }
    df[i,5] = i
}

for(i in (ref+1):(ref*2)){
    df[i,1] = m[2]
    df[i,2] = time[i-ref]
    df[i,3] = wday(as.Date(m[2], "%Y-%m-%d"))
    if(wday(as.Date(m[2], "%Y-%m-%d")) != 7 | wday(as.Date(m[2], "%Y-%m-%d")) != 1){
        df[i,4] = 0
    }
    else{
        df[i,4] = 1
    }
    df[i,5] = i-ref
}

for(i in (ref*2+1):(ref*3)){
    df[i,1] = m[3]
    df[i,2] = time[i-ref*2]
    df[i,3] = wday(as.Date(m[3], "%Y-%m-%d"))
    if(wday(as.Date(m[3], "%Y-%m-%d")) != 7 | wday(as.Date(m[3], "%Y-%m-%d")) != 1){
        df[i,4] = 0
    }
    else{
        df[i,4] = 1
    }
    df[i,5] = i-ref*2
}

for(i in (ref*3+1):(ref*4)){
    df[i,1] = m[4]
    df[i,2] = time[i-ref*3]
    df[i,3] = wday(as.Date(m[4], "%Y-%m-%d"))
    if(wday(as.Date(m[4], "%Y-%m-%d")) != 7 | wday(as.Date(m[4], "%Y-%m-%d")) != 1){
        df[i,4] = 0
    }
    else{
        df[i,4] = 1
    }
    df[i,5] = i-ref*3
}


# Amritsar
amritsar1 = accuWeatherData[accuWeatherData$City == "amritsar" & as.Date(accuWeatherData$Date, format = "%Y-%m-%d") == as.Date(m[1], format="%Y-%m-%d"), ]
amritsar2 = accuWeatherData[accuWeatherData$City == "amritsar" & as.Date(accuWeatherData$Date, format = "%Y-%m-%d") == as.Date(m[2], format="%Y-%m-%d"), ]
amritsar3 = accuWeatherData[accuWeatherData$City == "amritsar" & as.Date(accuWeatherData$Date, format = "%Y-%m-%d") == as.Date(m[3], format="%Y-%m-%d"), ]
amritsar4 = accuWeatherData[accuWeatherData$City == "amritsar" & as.Date(accuWeatherData$Date, format = "%Y-%m-%d") == as.Date(m[4], format="%Y-%m-%d"), ]


# Bhatinda
bhatinda1 = accuWeatherData[accuWeatherData$City == "bhatinda" & as.Date(accuWeatherData$Date, format = "%Y-%m-%d") == as.Date(m[1], format="%Y-%m-%d"), ]
bhatinda2 = accuWeatherData[accuWeatherData$City == "bhatinda" & as.Date(accuWeatherData$Date, format = "%Y-%m-%d") == as.Date(m[2], format="%Y-%m-%d"), ]
bhatinda3 = accuWeatherData[accuWeatherData$City == "bhatinda" & as.Date(accuWeatherData$Date, format = "%Y-%m-%d") == as.Date(m[3], format="%Y-%m-%d"), ]
bhatinda4 = accuWeatherData[accuWeatherData$City == "bhatinda" & as.Date(accuWeatherData$Date, format = "%Y-%m-%d") == as.Date(m[4], format="%Y-%m-%d"), ]

# Jalandhar
jalandhar1 = accuWeatherData[accuWeatherData$City == "jalandhar" & as.Date(accuWeatherData$Date, format = "%Y-%m-%d") == as.Date(m[1], format="%Y-%m-%d"), ]
jalandhar2 = accuWeatherData[accuWeatherData$City == "jalandhar" & as.Date(accuWeatherData$Date, format = "%Y-%m-%d") == as.Date(m[2], format="%Y-%m-%d"), ]
jalandhar3 = accuWeatherData[accuWeatherData$City == "jalandhar" & as.Date(accuWeatherData$Date, format = "%Y-%m-%d") == as.Date(m[3], format="%Y-%m-%d"), ]
jalandhar4 = accuWeatherData[accuWeatherData$City == "jalandhar" & as.Date(accuWeatherData$Date, format = "%Y-%m-%d") == as.Date(m[4], format="%Y-%m-%d"), ]

# Ludhiana
ludhiana1 = accuWeatherData[accuWeatherData$City == "ludhiana" & as.Date(accuWeatherData$Date, format = "%Y-%m-%d") == as.Date(m[1], format="%Y-%m-%d"), ]
ludhiana2 = accuWeatherData[accuWeatherData$City == "ludhiana" & as.Date(accuWeatherData$Date, format = "%Y-%m-%d") == as.Date(m[2], format="%Y-%m-%d"), ]
ludhiana3 = accuWeatherData[accuWeatherData$City == "ludhiana" & as.Date(accuWeatherData$Date, format = "%Y-%m-%d") == as.Date(m[3], format="%Y-%m-%d"), ]
ludhiana4 = accuWeatherData[accuWeatherData$City == "ludhiana" & as.Date(accuWeatherData$Date, format = "%Y-%m-%d") == as.Date(m[4], format="%Y-%m-%d"), ]

# Patiala
patiala1 = accuWeatherData[accuWeatherData$City == "patiala" & as.Date(accuWeatherData$Date, format = "%Y-%m-%d") == as.Date(m[1], format="%Y-%m-%d"), ]
patiala2 = accuWeatherData[accuWeatherData$City == "patiala" & as.Date(accuWeatherData$Date, format = "%Y-%m-%d") == as.Date(m[2], format="%Y-%m-%d"), ]
patiala3 = accuWeatherData[accuWeatherData$City == "patiala" & as.Date(accuWeatherData$Date, format = "%Y-%m-%d") == as.Date(m[3], format="%Y-%m-%d"), ]
patiala4 = accuWeatherData[accuWeatherData$City == "patiala" & as.Date(accuWeatherData$Date, format = "%Y-%m-%d") == as.Date(m[4], format="%Y-%m-%d"), ]

# Sangrur
sangrur1 = accuWeatherData[accuWeatherData$City == "sangrur" & as.Date(accuWeatherData$Date, format = "%Y-%m-%d") == as.Date(m[1], format="%Y-%m-%d"), ]
sangrur2 = accuWeatherData[accuWeatherData$City == "sangrur" & as.Date(accuWeatherData$Date, format = "%Y-%m-%d") == as.Date(m[2], format="%Y-%m-%d"), ]
sangrur3 = accuWeatherData[accuWeatherData$City == "sangrur" & as.Date(accuWeatherData$Date, format = "%Y-%m-%d") == as.Date(m[3], format="%Y-%m-%d"), ]
sangrur4 = accuWeatherData[accuWeatherData$City == "sangrur" & as.Date(accuWeatherData$Date, format = "%Y-%m-%d") == as.Date(m[4], format="%Y-%m-%d"), ]


for(i in 1:ref*1){
    df[i, 6]  = amritsar1$Temparature[i]
    df[i, 7]  = bhatinda1$Temparature[i]
    df[i, 8]  = jalandhar1$Temparature[i]
    df[i, 9]  = ludhiana1$Temparature[i]
    df[i, 10] = patiala1$Temparature[i]
    df[i, 11] = sangrur1$Temparature[i]
    
    df[i, 12] = amritsar1$Humidity[i]
    df[i, 13] = bhatinda1$Humidity[i]
    df[i, 14] = jalandhar1$Humidity[i]
    df[i, 15] = ludhiana1$Humidity[i]
    df[i, 16] = patiala1$Humidity[i]
    df[i, 17] = sangrur1$Humidity[i]
    
    df[i, 18] = amritsar1$Cloud.Cover[i]
    df[i, 19] = bhatinda1$Cloud.Cover[i]
    df[i, 20] = jalandhar1$Cloud.Cover[i]
    df[i, 21] = ludhiana1$Cloud.Cover[i]
    df[i, 22] = patiala1$Cloud.Cover[i]
    df[i, 23] = sangrur1$Cloud.Cover[i]
    
    df[i, 24] = amritsar1$WS[i]
    df[i, 25] = amritsar1$WD[i]
    
    df[i, 26] = bhatinda1$WS[i]
    df[i, 27] = bhatinda1$WD[i]
    
    df[i, 28] = jalandhar1$WS[i]
    df[i, 29] = jalandhar1$WD[i]
    
    df[i, 30] = ludhiana1$WS[i]
    df[i, 31] = ludhiana1$WD[i]
    
    df[i, 32] = patiala1$WS[i]
    df[i, 33] = patiala1$WD[i]
    
    df[i, 34] = sangrur1$WS[i]
    df[i, 35] = sangrur1$WD[i]
}

for(i in (ref+1):(ref*2)){
    df[i, 6]  = amritsar2$Temparature[i-ref]
    df[i, 7]  = bhatinda2$Temparature[i-ref]
    df[i, 8]  = jalandhar2$Temparature[i-ref]
    df[i, 9]  = ludhiana2$Temparature[i-ref]
    df[i, 10] = patiala2$Temparature[i-ref]
    df[i, 11] = sangrur2$Temparature[i-ref]
    
    df[i, 12] = amritsar2$Humidity[i-ref]
    df[i, 13] = bhatinda2$Humidity[i-ref]
    df[i, 14] = jalandhar2$Humidity[i-ref]
    df[i, 15] = ludhiana2$Humidity[i-ref]
    df[i, 16] = patiala2$Humidity[i-ref]
    df[i, 17] = sangrur2$Humidity[i-ref]
    
    df[i, 18] = amritsar2$Cloud.Cover[i-ref]
    df[i, 19] = bhatinda2$Cloud.Cover[i-ref]
    df[i, 20] = jalandhar2$Cloud.Cover[i-ref]
    df[i, 21] = ludhiana2$Cloud.Cover[i-ref]
    df[i, 22] = patiala2$Cloud.Cover[i-ref]
    df[i, 23] = sangrur2$Cloud.Cover[i-ref]
    
    df[i, 24] = amritsar2$WS[i-ref]
    df[i, 25] = amritsar2$WD[i-ref]
    
    df[i, 26] = bhatinda2$WS[i-ref]
    df[i, 27] = bhatinda2$WD[i-ref]
    
    df[i, 28] = jalandhar2$WS[i-ref]
    df[i, 29] = jalandhar2$WD[i-ref]
    
    df[i, 30] = ludhiana2$WS[i-ref]
    df[i, 31] = ludhiana2$WD[i-ref]
    
    df[i, 32] = patiala2$WS[i-ref]
    df[i, 33] = patiala2$WD[i-ref]
    
    df[i, 34] = sangrur2$WS[i-ref]
    df[i, 35] = sangrur2$WD[i-ref]
}

for(i in (ref*2+1):(ref*3)){
    df[i, 6]  = amritsar2$Temparature[i-ref*2]
    df[i, 7]  = bhatinda2$Temparature[i-ref*2]
    df[i, 8]  = jalandhar2$Temparature[i-ref*2]
    df[i, 9]  = ludhiana2$Temparature[i-ref*2]
    df[i, 10] = patiala2$Temparature[i-ref*2]
    df[i, 11] = sangrur2$Temparature[i-ref*2]
    
    df[i, 12] = amritsar2$Humidity[i-ref*2]
    df[i, 13] = bhatinda2$Humidity[i-ref*2]
    df[i, 14] = jalandhar2$Humidity[i-ref*2]
    df[i, 15] = ludhiana2$Humidity[i-ref*2]
    df[i, 16] = patiala2$Humidity[i-ref*2]
    df[i, 17] = sangrur2$Humidity[i-ref*2]
    
    df[i, 18] = amritsar2$Cloud.Cover[i-ref*2]
    df[i, 19] = bhatinda2$Cloud.Cover[i-ref*2]
    df[i, 20] = jalandhar2$Cloud.Cover[i-ref*2]
    df[i, 21] = ludhiana2$Cloud.Cover[i-ref*2]
    df[i, 22] = patiala2$Cloud.Cover[i-ref*2]
    df[i, 23] = sangrur2$Cloud.Cover[i-ref*2]
    
    df[i, 24] = amritsar2$WS[i-ref*2]
    df[i, 25] = amritsar2$WD[i-ref*2]
    
    df[i, 26] = bhatinda2$WS[i-ref*2]
    df[i, 27] = bhatinda2$WD[i-ref*2]
    
    df[i, 28] = jalandhar2$WS[i-ref*2]
    df[i, 29] = jalandhar2$WD[i-ref*2]
    
    df[i, 30] = ludhiana2$WS[i-ref*2]
    df[i, 31] = ludhiana2$WD[i-ref*2]
    
    df[i, 32] = patiala2$WS[i-ref*2]
    df[i, 33] = patiala2$WD[i-ref*2]
    
    df[i, 34] = sangrur2$WS[i-ref*2]
    df[i, 35] = sangrur2$WD[i-ref*2]
}

for(i in (ref*3+1):(ref*4)){
    df[i, 6]  = amritsar2$Temparature[i-ref*3]
    df[i, 7]  = bhatinda2$Temparature[i-ref*3]
    df[i, 8]  = jalandhar2$Temparature[i-ref*3]
    df[i, 9]  = ludhiana2$Temparature[i-ref*3]
    df[i, 10] = patiala2$Temparature[i-ref*3]
    df[i, 11] = sangrur2$Temparature[i-ref*3]
    
    df[i, 12] = amritsar2$Humidity[i-ref*3]
    df[i, 13] = bhatinda2$Humidity[i-ref*3]
    df[i, 14] = jalandhar2$Humidity[i-ref*3]
    df[i, 15] = ludhiana2$Humidity[i-ref*3]
    df[i, 16] = patiala2$Humidity[i-ref*3]
    df[i, 17] = sangrur2$Humidity[i-ref*3]
    
    df[i, 18] = amritsar2$Cloud.Cover[i-ref*3]
    df[i, 19] = bhatinda2$Cloud.Cover[i-ref*3]
    df[i, 20] = jalandhar2$Cloud.Cover[i-ref*3]
    df[i, 21] = ludhiana2$Cloud.Cover[i-ref*3]
    df[i, 22] = patiala2$Cloud.Cover[i-ref*3]
    df[i, 23] = sangrur2$Cloud.Cover[i-ref*3]
    
    df[i, 24] = amritsar2$WS[i-ref*3]
    df[i, 25] = amritsar2$WD[i-ref*3]
    
    df[i, 26] = bhatinda2$WS[i-ref*3]
    df[i, 27] = bhatinda2$WD[i-ref*3]
    
    df[i, 28] = jalandhar2$WS[i-ref*3]
    df[i, 29] = jalandhar2$WD[i-ref*3]
    
    df[i, 30] = ludhiana2$WS[i-ref*3]
    df[i, 31] = ludhiana2$WD[i-ref*3]
    
    df[i, 32] = patiala2$WS[i-ref*3]
    df[i, 33] = patiala2$WD[i-ref*3]
    
    df[i, 34] = sangrur2$WS[i-ref*3]
    df[i, 35] = sangrur2$WD[i-ref*3]
}

for(j in 37:45){
    for(i in 1:row.num){
        df[i,j] = ""
    }
}

df[1,39] = ""
df[1,40] = ""
df[1,41] = ""
df[1,42] = ""
df[1,43] = ""
df[1,44] = ""
df[1,45] = ""

windDirection = c("", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "")
value = c("", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", "")

df[1:length(windDirection),37] = windDirection
df[1:length(value), 38] = value

#names(dataSet) = names(df)

#finalOutput = rbind(dataSet, df)
setwd("D:/")
write.csv(df, file="WuDataset.csv", row.names=F)
