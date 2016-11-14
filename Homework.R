
# -------- cut() tool --------
# Generating 10 random numbers
c <- rnorm(10)
# the new created numbers are now ordered to the defined area -2:1
# the new area has three groups
table(cut(c, breaks = -2:1))
# now you can see how often a number of the data c 
# appears in which group



# -------- sort() tool --------
# also very helpful is the rank() tool
sort(c)
# sorts the data c from the lowest number to the highest number
sort(c, decreasing = TRUE)
# now it?s the other way round



# -------- order() tool --------
order(c)
# shows us on which position is the lowest number
# from the lowest to the highest
order(c, decreasing = TRUE)



# -------- quantile() tool --------
b <- seq(0,354,  by = 1)
# creats a data b from 0 to 200 in 1 point steps
# => overall 201 values
quantile(b, probs = seq(0, 1, 0.25))
# now you order the data b in 4 even data areas
# this definition is "caused" by probs = seq(0, 1, 0.25)
# if you change this
quantile(b, probs = seq(0, 1, 0.1))
# now you order the data b in 10 even data areas
