install.packages("dismo")
library(dismo)
install.packages("rgdal")
library(rgdal)
install.packages("maps")
library(maps)
install.packages("mapdata")
library(mapdata)
install.packages("sp")
library(sp)

#Creating very easy & quick a map
x11()
map("worldHires", "Germany", col = "red", fill=F)
map("worldHires", "Austria",col = "blue",add = T, fill=T)
map("worldHires", "France",col = "Green",add = T, fill=F)
map("worldHires", "Belgium",col = "black",add = T, fill=T)
map("worldHires", "Luxembourg",col = "grey",add = T, fill=T)

savePlot(filename = "Europe", type = c("jpg"))


#you can also generate some Google Earth maps very easy
#package dismo
mymap <- gmap("Germany")  # choose whatever country
plot(mymap)

#zoom in map
mymap <- gmap("Germany", exp = 0.4)
plot(mymap)

#zoom out map
mymap <- gmap("Germany", exp = 3)
plot(mymap)



# generate satellite picture
mymap <- gmap("Germany", type = "satellite")
plot(mymap)



allbands  <- brick("F:/Uni/EAGLE/MB1/01_Data/02_Raster/RapidEye_Ammersee/re20110906_ortho_ls_prj_grto0509_sub.tif")
plotRGB(allbands, 3,2,1, stretch="lin")

b <- shapefile("F:/Uni/All.shp")
a <- readOGR("F:/Uni","All")

summary(a)
summary(b)


#drawing polygon
#only possible in the lower right side
new_poly <- drawPoly()
summary(new_poly)
proj4string(new_poly) <- CRS("+proj=utm +zone=32 +datum=WGS84 +units=m +no_defs +ellps=WGS84 +towgs84=0,0,0")
summary(new_poly)

new_poly1 <- drawPoly()
proj4string(new_poly1) <- CRS("+proj=utm +zone=32 +datum=WGS84 +units=m +no_defs +ellps=WGS84 +towgs84=0,0,0")


#clip function
c <- crop(allbands, new_poly)
d <- crop(allbands, new_poly1)

plotRGB(c, 3,2,1, stretch="lin")
plotRGB(d, 3,2,1, stretch="lin")

#merge function
e <- merge(c, d)
plotRGB (e, 3,2,1, stretch="lin")

#buffer function
f <- buffer(new_poly, width=500)
plot(f)