library(ggplot2)

x <- seq(from=0, to=6, length.out=100) # Define the density domains
ylim <- c(0, 0.6)
par(mfrow=c(2,2)) # Create a 2x2 plotting area
plot(x, dunif(x,min=2,max=4), main="Uniform", type='l', ylim=ylim)
plot(x, dnorm(x,mean=3,sd=1), main="Normal", type='l', ylim=ylim) 
plot(x, dgamma(x,shape=2,rate=1), main="Gamma", type='l', ylim=ylim)

x <- seq(from=-3, to=+3, length.out=100)
y <- dnorm(x)
plot(x, y, main="Standard Normal Distribution", type='l', ylab="Density", xlab="Quantile")
abline(h=0)

region.x <- x[1 <= x & x <= 2]
region.y <- y[1 <= x & x <= 2]

polygon(region.x, region.y, density=-1, col="red")




