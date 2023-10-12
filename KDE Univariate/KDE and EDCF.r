# Define the Gaussian kernel function
gaussian_kernel <- function(x, center, bandwidth) {
  return(exp(-0.5 * ((x - center) / bandwidth)^2) / sqrt(2 * pi * bandwidth^2))
}

# Define the kernel density estimator
kernel_density_estimator <- function(data, bandwidth) {
  n <- length(data)
  x_min <- min(data)
  x_max <- max(data)
  
  #x <- seq(x_min, x_max, length.out =length(data))
  y <- numeric(length(x))
  for (i in 1:n) {
    y <- y + gaussian_kernel(x, data[i], bandwidth)
  }
  y <- y / n
  return(list(x = x, y = y))
}



# Generate example data
data <- seq(0,2,0.01)

# Estimate density
result <- kernel_density_estimator(data, 0.5)

# Plot the result
plot(result$x, result$y, type = "l")

