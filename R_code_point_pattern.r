# Point Pattern Analysis: Density map

 

install.packages("spatstat")
library(spatstat)

 

attach(covid)
covids <- ppp(lon, lat, c(-180,180), c(-90,90))

# if you do not use attach(covid):
# covids <- ppp(covid$lon, covid$lat, c(-180,180), c(-90,90))

d <- density(covids)

plot(d)
points(covids)
