# R_code_interpolation.r

# Steps for interpolation:
# step 1: explain to spatstat that you have coordinates: function ppp
# step 2: explain to spatstat that you have ecological data: function marks
# step 3: make the spatial map: function Smooth

setwd("~/lab/")
# setwd("/Users/utente/lab") #mac
# setwd("C:/lab/") # windows

# install.packages("spatstat")
library(spatstat)

# Beech forests

inp <- read.table("dati_plot55_LAST3.csv", sep=";", head=T)
head(inp)

attach(inp)
# plot(inp$X, inp$Y)
plot(X,Y)

summary(inp)

inppp <- ppp(x=X, y=Y, c(716000,718000),c(4859000,4861000))
marks(inppp) <- Canopy.cov

canopy <- Smooth(inppp)
plot(canopy)
points(inppp, col="green")

marks(inppp) <- cop.lich.mean
lichs <- Smooth(inppp)
plot(lichs)
points(inppp)

par(mfrow=c(1,3))
plot(canopy)
points(inppp)
plot(lichs)
points(inppp)
plot(Canopy.cov, cop.lich.mean, col="red", pch=19, cex=2)

# Psammophilous vegetation

inp.psam <- read.table("dati_psammofile.csv", sep=";", head=T)
attach(inp.psam)

head(inp.psam)
plot(E,N)
inp.psam.ppp <- ppp(x=E,y=N,c(356450,372240),c(5059800,5064150))
marks(inp.psam.ppp) <- C_org

C <- Smooth(inp.psam.ppp)
plot(C)
points(inp.psam.ppp)



