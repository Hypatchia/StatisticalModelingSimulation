library(MASS)

# Set the mean vector and covariance matrix
mu <- c(0, 1)
sigma <- matrix(c(1, 0.5, 0.5, 2), nrow = 2)
sigma <-  matrix(c(145, 77, 77, 56), nrow = 2)
mu <- c(33,15)
               
# Generate random values of x and y
n <- 1000
xy <- mvrnorm(n, mu, sigma)

# Compute the joint pdf using the density function
pdf <- kde2d(xy[,1], xy[,2], n = 50)

# Plot the joint pdf
image(pdf$x, pdf$y, pdf$z, col = heat.colors(50))
contour(pdf$x, pdf$y, pdf$z, add = TRUE)


persp(x=pdf$x,,y=pdf$y,z=pdf$z, box=FALSE)


# Actual
# Vrai valeurs de xy 
xy_actual <- dmvnorm(xy, mean =mu , sigma = sigma,log = FALSE)


plot(density(xy_actual), type = "p", main = "Joint Distribution of X and Y", xlab = "X", ylab = "Y")

#MSE

mean((xy_actual- xy)^2)

