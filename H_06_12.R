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

allbands  <- brick("F:/Uni/EAGLE/MB1/01_Data/02_Raster/RapidEye_Ammersee/re20110906_ortho_ls_prj_grto0509_sub.tif")

a <- readOGR("F:/Uni","All")

aa <- superClass (allbands, trainData = a,
                  nSamples = 1000, responseCol = "Name", 
                  predType = "raw")

map <- predict(aa,allbands)
x11()
plot(map)
map_new <- ggR(map, forceCat = TRUE, geom_raster = TRUE)+
  scale_fill_manual(values = c("green", "brown", "red", "blue"),
                    labels = c("Forest", "Meadow" , "Urban", "Water"))

map_new

val <- superClass (allbands, trainData = a,trainPartition = 0.7, responseCol = "Name")

a[[Name]]
