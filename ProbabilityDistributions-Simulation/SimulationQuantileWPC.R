# Simulation of Weibull-Pareto Composite Inverse Function
# rWPC: Generates random samples from a Weibull-Pareto Composite distribution.

rWPC <- function(n, theta, beta) {
    """
    Simulate random samples from a Weibull-Pareto Composite distribution.

    Parameters:
    - n (integer): The number of random samples to generate.
    - theta (numeric): Scale parameter of the distribution.
    - beta (numeric): Shape parameter of the distribution.

    Returns:
    - numeric: An array of random samples from the Weibull-Pareto Composite distribution.
    """
    # Check if 'n' is a positive integer greater than 1
    if (!is.integer(n) || n <= 1) {
        stop("The 'n' parameter should be a positive integer greater than 1")
    }
    
    # Generate 'n' random uniform values between 0 and 1
    vec <- runif(n)
    
    # Initialize an empty vector to store the generated samples
    x <- numeric(n)
    
    # Generate samples using the inverse function qWPC
    for (i in 1:n) {
        x[i] <- qWPC(vec[i], theta, beta)
    }
    
    # Return the generated samples
    return(x)
}
