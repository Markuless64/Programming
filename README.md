# Programming

# indexingcommands
# eagle course
x <- matrix(c(7,4,8,7,5,4,4,6,7), nrow = 3)
x
x[3,1]
x[,2]
x <- raster(x)
plot(x)

number_1 <- rnorm(80, mean = 0, sd=1)
number_1
mat_1 <- matrix(number_1, nrow = 20, ncol = 4)
mat_1df_1 <- data.frame(mat_1)
names(df_1) <- c("var1","var2","var3","var4")
head(df_1)
x11()
plot(df_1)
df_1[1,1]
#vector indexing
x <- seq(1,100, by=2.5)
x <- length(x)
x
x[length(x)-1]
idx <- c(1,4,6)
x[idx]
x> 20(x <=10) | (x>30)
x[x<10|x>30]x2 <- numeric(length(x))x2x2[x<=30] <- 1x2x2[(x>30)&(x<70)] <- 2x2[x>70]<- 3x2#alternative approachx2 <- recode(x, "0:30=1; 30:70=2; else=3")x2sum(x2)sum(x)cumsum(x)rev(x)sort(x, decreasing = TRUE)sample(x,10)#dataframetest <- data.frame(A = c(1,2,3), B=c("plot1", "Plot2", "plot3"))testtest$B#a more complex data framedf <- data.frame(                 plot="location_name1",                  measure1 = runif (100)*1000,                  measure2 = round(runif(100)*100),                  value =rnorm(100,2,1),                  ID = rep (LETTERS,100)                 )dfdf_2 <- data.frame(plot="location_name2",                    measure1 = runif (50)*1000,                   measure2 =round(runif(50)*10),                   value =rnorm (100,3,2),                    ID= rep (LETTERS,50)                   )c <- cbind(df,df_2)summary(c)str(c)head(c)c[,c("plot","measure1")]c[50:55,c("plot","measure1")]c[c$value>3.0,]c[c$value > 3.2 | c$measure1 > 950,]c$new_col <- c$measure1 * c$measure2summary(c)kkhjkhfkjf 
