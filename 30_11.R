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
allbands <- raster("E:/Uni/EAGLE/MB1/01_Data/02_Raster/RapidEye_Ammersee/re20110906_ortho_ls_prj_grto0509_sub.tif")

a <- readOGR("E:/Uni/EAGLE/Program/Qgis","Water1")
b <- readOGR("E:/Uni/EAGLE/Program/Qgis","Meadow1")
c <- readOGR("E:/Uni/EAGLE/Program/Qgis","Urban1")
d <- readOGR("E:/Uni/EAGLE/Program/Qgis","Forest1")

bb <- superClass()
aa <- superClass (allbands, trainData = a,
                  nSamples = 1000, responseCol = "Water", 
                  predType = "raw", kfold = 5, tuneLength = 3,
                  overwrite = TRUE)
map <- predict(aa,allbands)
x11()
plotRGB (allbands, 3,2,1, stretch ="lin")
x11()
plot(map)

