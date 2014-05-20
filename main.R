library(ggplot2)
data <-read.csv("C:/us-cities.csv",sep=",")

plot(mtcars$wt,mtcars$mpg);


v1 <- c(1,2,3);
v2 <- c(4,5,6);
c(v1,v2);

Sys.Date()

x <-combn(1:5,3)
y <-rnorm(1, mean=100, sd=15)

print(x)
print(y)
