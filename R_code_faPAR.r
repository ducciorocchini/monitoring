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

#### regression model between faPAR and NDVI
erosion <- c(12, 14, 16, 24, 26, 40, 55, 67)
hm <- c(30, 100, 150, 200, 260, 340, 460, 600)

plot(erosion, hm, col="red", pch=19, xlab="erosion", ylab="heavy metals")

model1 <- lm(hm ~ erosion)
summary(model1)
abline(model1)

#### faPAR vs. NDVI model
library(raster)
library(rasterdiv)
library(sf) # to call st_* functions
# install.packages("sf")

setwd("~/lab/")
faPAR10 <- raster("faPAR10.tif")
plot(faPAR10)
plot(copNDVI)

copNDVI <- reclassify(copNDVI, cbind(253:255, NA), right=TRUE)

random.points <- function(raster,n)
{
lin <- rasterToContour(is.na(raster))
pol <- as(st_union(st_polygonize(st_as_sf(lin))), 'Spatial') # st_union to dissolve geometries
pts <- spsample(pol[1,], n, type = 'random')
}

pts <- random.points(faPAR10,1000)
copNDVIp <- extract(copNDVI, pts)
faPAR10p <- extract(faPAR10,pts)

# photosynthesis vs. biomass
model2 <- lm(faPAR10p ~ copNDVIp)
summary(model2)
plot(copNDVIp, faPAR10p, col="green", xlab="biomass", ylab="photosynthesis")
abline(model2, col="red")


