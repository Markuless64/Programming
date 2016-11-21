install.packages("raster")

z <- runif(100, min=-1, max = 1)

zz <- raster(nrows=10, ncols=10, vals=z)

zz[zz<0.25] <- 1
zz[zz>0.25 & zz<0.5] <- 2
zz[zz>0.5 & zz<0.75] <- 3
zz[zz>0.75 & zz<1.0] <- 4

plot(zz)