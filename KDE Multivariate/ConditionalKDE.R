# Set the parameters
alpha <- 5

# Generate a random sample of X values
n <- 1000
x <- rexp(n, rate = alpha)

# Generate a random sample of Y values for each X value
y <- rep(0, n)
for (i in 1:n) {
  y[i] <- rgamma(1, shape = alpha, rate = 1 / (x[i] + alpha))
}
# Combine X and Y into a dataset
xy <- cbind(x,y)
# Compute the joint pdf using the kdensity2d function
pdf <- kde2d(xy[,1], xy[,2])

# Plot the joint pdf
image(pdf$x, pdf$y, pdf$z, col = heat.colors(50))
contour(pdf$x, pdf$y, pdf$z, add = TRUE)
persp(x=pdf$x,,y=pdf$y,z=pdf$z, box=FALSE)


# Actual 
x_actual <- dexp(x, rate = alpha)


y_actual <- rep(0, n)

for (i in 1:n) {
  y_actual[i] <- dgamma(y[i],shape = alpha, rate = 1 / (x_actual[i] + alpha))
}

joint_pdf <- x_actual* y_actual

plot(density(joint_pdf))
# MSE
mean((joint_pdf- pdf)^2)
# Error :
pdf$x
pdf$y
