#URL: "https://github.com/Markuless64/Programming"

install.packages("raster")
library(raster)

z <- runif(100000000, min=0, max = 1)

zz <- raster(nrows=10000, ncols=10000, vals=z)

plot(zz)

zz[zz<0.25] <- 1
zz[zz>0.25 & zz<0.5] <- 2
zz[zz>0.5 & zz<0.75] <- 3
zz[zz>0.75 & zz<1.0] <- 4

plot(zz)