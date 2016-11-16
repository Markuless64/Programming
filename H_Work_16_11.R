install.packages("raster")

z <- runif(100, min=0, max = 1)

b <- raster(nrows=10, ncols=10, vals=z)

plot(b)
z <- data.frame(z)

seg1 <- z[,1]<0.251
seg1 <- raster(vals=seg1)

table(z$z)

b <- quantile(b, probs = seq(0,1, 0.25))
aa <- raster(quantile(z, probs = seq(0,1, 0.25)))

plot(a)

a <- data.frame(a)
