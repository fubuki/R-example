library(ggplot2)

x <- seq(from=0, to=6, length.out=100) # Define the density domains
ylim <- c(0, 0.6)
par(mfrow=c(2,2)) # Create a 2x2 plotting area
plot(x, dunif(x,min=2,max=4), main="Uniform", type='l', ylim=ylim)
plot(x, dnorm(x,mean=3,sd=1), main="Normal", type='l', ylim=ylim) 
plot(x, dgamma(x,shape=2,rate=1), main="Gamma", type='l', ylim=ylim)
