install.packages("raster")
library(raster)

# ---------------------------------------------------------

a <- sqrt(2)

if(a*a != 2)
{
  print("R is great!")
}

# ---------------------------------------------------------

j <- 0
while (j < 1)
{
  j <- j + 0.1:
  print(j)
}

# ---------------------------------------------------------

myfunction <- function(x, y){
  z<-x+y
  return(z)
}

myfunction(4,9)

# ---------------------------------------------------------

z <- runif(100, min=0, max = 1)
blue <- raster(nrows=10, ncols=10, vals=z)

b <- runif(100, min=0, max = 1)
green <- raster(nrows=10, ncols=10, vals=b)

c <- runif(100, min=0, max = 1)
red <- raster(nrows=10, ncols=10, vals=c)

a <- runif(100, min=0, max = 1)
NIR <- raster(nrows=10, ncols=10, vals=a)



NDVI <- function (NIR,red){
  (NIR-red)/(NIR+red)
}

g <- NDVI(NIR,red)

plot(g)

# ---------------------------------------------------------
install.packages("cluster")
library(cluster)

g <- as.data.frame(g)
clust <- kmeans(g, 9)

clust1 <- clust$cluster
clust2 <- raster(nrows=10, ncols=10, vals=clust1)

plot(clust2)

# ---------------------------------------------------------

raster()
brick()
stack()

band3 <- raster("F:/Uni/EAGLE/MB1/01_Data/02_Raster/Landsat-5_Ammersee/LT51930272003195MTI01/LT51930272003195MTI01_B3.TIF")
plot(band3)

allbands  <- brick("F:/Uni/EAGLE/MB1/01_Data/02_Raster/RapidEye_Ammersee/re20110906_ortho_ls_prj_grto0509_sub.tif")
plotRGB (allbands, 3,2,1)

plotRGB (allbands, 3,2,1, stretch ="lin")



new <- NDVI (allbands[[5]],allbands[[3]])
plot(new)

allbands <- as.data.frame(allbands)
clust <- kmeans(allbands, 10000)

 