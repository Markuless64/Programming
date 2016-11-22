install.packages("raster")
library(raster)

z <- runif(100, min=0, max = 1)

z1 <- raster(nrows=10, ncols=10, vals=z)

b <- runif(100, min=0, max = 1)

z2 <- raster(nrows=10, ncols=10, vals=b)

x11()
plot(z1)
x11()
plot(z2)