NDVI <- function (NIR,red){
  (NIR-red)/(NIR+red)
}

SAVI <- function (NIR,red){
  (NIR-red)/(NIR+red+0.5)*(1+0.5)
}

allbands  <- brick("F:/Uni/EAGLE/MB1/01_Data/02_Raster/RapidEye_Ammersee/re20110906_ortho_ls_prj_grto0509_sub.tif")

Rapid_NDVI <- NDVI (allbands[[5]],allbands[[3]])
ndvi <- overlay(allbands[[5]],allbands[[3]],fun = function(NIR,red){(NIR-red)/(NIR+red)})
ndvi <- overlay(allbands[[5]],allbands[[3]],fun = NDVI)

plot(ndvi)

savi <- overlay(allbands[[5]],allbands[[3]],fun = function(NIR,red){(NIR-red)/(NIR+red+0.5)*(1+0.5)}, filename="savi.tif", format="GTiff")
savi <- overlay(allbands[[5]],allbands[[3]],fun = function(NIR,red){(NIR-red)/(NIR+red+0.5)*(1+0.5)}, filename="savi.tif", format="GTiff")

plot(savi)


# -----------------------------------------------------------

library(RStoolbox)

red = allbands[[3]]
nir = allbands[[5]]

allbands <- as.data.frame(allbands)
data(allbands)
b <- spectralIndices(allbands, red = "re20110906_ortho_ls_prj_grto0509_sub.3", nir = "re20110906_ortho_ls_prj_grto0509_sub.5", indices = "NDVI")

plot(b)

b_na <- b

b_na[b_na < 0] <- NA

function1 <- function(x){x[x<0]<- NA; return(x)}

calc(b_na, fun = function1)

overlay(b_na, fun = function1)

unsuperClass(allbands, nSamples = 10000, nClasses = 5, clusterMap = TRUE)
