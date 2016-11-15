x1 <- rbinom(10, size=1, prob=0.5)
x2 <- factor(x1, labels = c("man", "woman"))
summary(x2)
levels(x2)
as.character(x)

library(car)
recode(x2, "'woman'='woman'; 'man' = 'guy'")

ifelse(x2=="man","guy", "woman")


#raster
library(raster)
r1 <- raster(nrow=100, ncols=100)
r1

r1[] <- df$measure1[1:1000]
r1
plot(r1)


r2 <- raster(nrow=100, ncols=100)
r2[] <- df$measure2[1:1000]
r2
plot(r2)


r12 <- stack(r1, r2)
plot(r12)
r12[[1]]
r12$new <- r12[[1]]*r12[[2]]^2
plot(r12$layer.1)

v <- raster(nrow=b, ncols=c)
v <- df$measure1[1:1000]
plot(v)
v
b <- rnorm(5000)
c <- runif(5000)

rbinom(30, 1:3, prob = 0.5)


df12 <- r12[]
head(df12)
