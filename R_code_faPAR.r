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




