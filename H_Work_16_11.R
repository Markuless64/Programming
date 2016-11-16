install.packages("raster")

z <- runif(100, min=0, max = 1)

zz <- raster(nrows=10, ncols=10, vals=z)

plot(zz)

seg1 <- z[z<0.25]
seg1 <- t(seg1)
seg2 <- z[z>0.25 & z<0.5]
seg2 <- t(seg2)
seg3 <- z[z>0.5 & z<0.75]
seg3 <- t(seg3)
seg4 <- z[z>0.75]
seg4 <- t(seg4)

a <- matrix(seg1, nrow = 3)
a <- raster(a)
plot(a)
b <- matrix(seg2, nrow = 3)
b <- raster(b)
plot(b)
c <- matrix(seg3, nrow = 3)
c <- raster(c)
plot(c)
d <- matrix(seg4, nrow = 3)
d <- raster(d)
plot(d)


stack(a,b,c,d)
plot(a)
plot(b, add=TRUE)
