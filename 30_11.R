install.packages("RStoolbox")
library(RStoolbox)
install.packages("raster")
library(raster)
install.packages("cluster")
library(cluster)
install.packages("rgdal")
library(rgdal)
install.packages("e1071")
library(e1071)
install.packages("randomForest")
library(randomForest)

allbands  <- brick("E:/Uni/EAGLE/MB1/01_Data/02_Raster/RapidEye_Ammersee/re20110906_ortho_ls_prj_grto0509_sub.tif")

a <- readOGR("E:/Uni","All")

aa <- superClass (allbands, trainData = a,
                  nSamples = 1000, responseCol = "Id", 
                  predType = "raw")

map <- predict(aa,allbands)
x11()
plotRGB (allbands, 3,2,1, stretch ="lin")
x11()
plot