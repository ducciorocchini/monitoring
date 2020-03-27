### Multipanel in R: the second lecture of monitoring Ecosystems

install.packages("sp")
install.packages("GGally") # this is used for the function ggpairs()

library(sp) # require(sp) will also do the job
library(GGally)

data(meuse) # there is a dataset available named meuse

attach(meuse)

# Exercise: see the names of the variables and plot cadmium versus zinc
# There are two ways to se the names of the variables:
names(meuse)
head(meuse)
plot(cadmium,zinc,pch=15,col="red",cex=2)

# Exercise: make all the possible paiwis plots of the dataset
# plot(x,cadmium)
# plot(x,zinc)
# plot....
# plot is not a good idea!
pairs(meuse)

# in case you receive the error "the sizze is too large" reshape with the mouse the graph window and relaunch the code

pairs(~ cadmium + copper + lead + zinc, data=meuse)

pairs(meuse[,3:6])

# Exercise: prettify this graph
pairs(meuse[,3:6], col="red", pch=18, cex=1.5)

# GGally package will prettify the graph
ggpairs(meuse[,3:6])




