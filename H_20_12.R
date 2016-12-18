library(RStoolbox)
library(raster)
library(cluster)
library(rgdal)
library(e1071)
library(randomForest)

allbands  <- brick("F:/Uni/EAGLE/MB1/01_Data/02_Raster/RapidEye_Ammersee/re20110906_ortho_ls_prj_grto0509_sub.tif")
plotRGB(allbands, 3,2,1, stretch="lin")

t_data <- readOGR("F:/Uni/EAGLE/Program", "Train_data_2")
plot(t_data, add = T)

new_poly<- drawPoly()

new_crop <- crop(allbands, new_poly)
x11()
plotRGB(new_crop, 3,2,1, stretch = "lin")
savePlot(filename = "F:/Uni/EAGLE/MB1/01_Data/02_Raster/RapidEye_Ammersee/new_crop.tif")
plot(t_data, add = T, col = "red")

View(t_data)

aa <- superClass (new_crop, trainData = t_data, responseCol = "Name")

map <- predict(aa,new_crop)
x11()
plot(map)
map_new <- ggR(map, forceCat = TRUE, geom_raster = TRUE)+
  scale_fill_manual(values = c("green", "brown", "red", "blue"),
                    labels = c("Forest", "Meadow" , "Urban", "Water"))

map_new
