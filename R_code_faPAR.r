# R_code_faPAR.r
# How to look at chemical cycling from satellites!

# levelplot(copNDVI)
# 
# setwd("~/Downloads")
# 
# faPAR <- raster("~/Downloads/c_gls_FAPAR300-RT0_202004200000_GLOBE_PROBAV_V1.0.1.nc")
# 
# plot(faPAR)
# 
# faPAR10 <- aggregate(faPAR, fact=10)

# install.packages("raster")

library(raster)
library(rasterVis)
library(rasterdiv)


plot(copNDVI)
copNDVI <- reclassify(copNDVI, cbind(253:255, NA))

levelplot(copNDVI)

setwd("~/lab/")
# setwd("/Users/utente/lab") #mac
# setwd("C:/lab/") # windows

faPAR10 <- raster("faPAR10.tif")

levelplot(faPAR10) 

pdf("copNDVI.pdf")
levelplot(copNDVI)
dev.off()

pdf("faPAR.pdf")
levelplot(faPAR10)
dev.off()

############### day 2
library(raster)
library(rasterdiv)
library(rasterVis)

setwd("~/lab/")
# setwd("/Users/utente/lab") #mac
# setwd("C:/lab/") # windows

load("faPAR.RData")

# the original faPAR from Copernicus is 2GB
# let's see how much spae is needed for an 8-bit set 

writeRaster(copNDVI, "copNDVI.tif")
# 5.3MB

# faPAR: levelplot this set
levelplot(faPAR10)


