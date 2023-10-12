library(ggplot2)
library(tidyverse)
library(mvtnorm)
library(MASS)
library(mnormt)

set.seed(1)
# Generate some x and y data 
size =100
m=3
x <- rnorm(size,mean =56,sd=4)
y <- rnorm(size,mean =56,sd=17)
# Create dataframe

xy <- cbind(x,y)
# Estimate the joint density using kde2d
pdf <- kde2d(xy[,1],xy[,2])
plot(pdf$z)
# Plot the estimated density
image(pdf, xlab = "x", ylab = "y")
contour(pdf, add = TRUE)
image(pdf$x, pdf$y, pdf$z, col = heat.colors(50))
contour(pdf, add = TRUE)

#3d

persp(x=pdf$x,,y=pdf$y,z=pdf$z, box=FALSE)

# Actual Data :
x_actual <- dnorm(x,mean =56,sd=4)
y_actual <- dnorm(y,mean =56,sd=17)

# Joint PDF
joint_pdf <- x_actual * y_actual

# Reshape the PDF to a matrix and plot it as a heatmap


plot(density(joint_pdf), type = "p", main = "Joint Distribution of X and Y", xlab = "X", ylab = "Y")


# MSE
# unable to calculate mse bcz of the ouputs of pdf.
mean((joint_pdf-pdf)^2)
# Error :
pdf$x
pdf$y

