?plot

head(cars)

#plot 
plot(cars)

#change axis
plot(cars$dist, cars$speed)

#change color
plot(cars$dist, cars$speed, col = "blue")

#add title
plot(cars$dist, cars$speed, col = "blue", main = "my first plot")

#add x and y label
plot(cars$dist, cars$speed, col = "blue", main = "my first plot", xlab = "distance", ylab = "car speed")

#types of plot
plot(cars$speed, cars$dist)

plot(cars$speed, cars$dist, "l")

plot(cars$speed, cars$dist, "h")


