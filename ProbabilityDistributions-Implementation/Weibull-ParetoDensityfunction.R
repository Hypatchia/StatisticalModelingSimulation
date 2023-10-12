# Weibull-Pareto Composite Probability Density Function
# dWPC: Computes the PDF of a Weibull-Pareto Composite distribution.

dWPC <- function(theta, beta, x) {
    """
    Compute the probability density function (PDF) of a Weibull-Pareto Composite distribution.

    Parameters:
    - theta (numeric): Scale parameter of the distribution.
    - beta (numeric): Shape parameter of the distribution.
    - x (numeric or numeric vector): Values at which to calculate the PDF.

    Returns:
    - numeric or numeric vector: PDF values corresponding to the input 'x'.
    """
    # Check if 'theta' and 'beta' are non-negative
    if (theta < 0 || beta < 0) {
        stop("Both 'theta' and 'beta' should be non-negative.")
    }
    
    # Check if 'x' is non-negative
    if (any(x < 0)) {
        stop("'x' should be non-negative.")
    }
    
    n <- length(x)
    f <- numeric(n)
    
    k <- 2.857334826
    a <- (k + 1)^2 / (2 * k + 1)
    b <- (k + 1) / k
    c <- (k + 1) / (2 * k + 1)
    
    for (i in 1:n) {
        if (x[i] <= theta) {
            f[i] <- (beta * a / x[i]) * ((x[i] / theta)^(beta * k)) * (1 - exp(-b * (x[i] / theta)^(beta * k)))
        } else if (x[i] > theta) {
            f[i] <- c * (beta / x[i]) * (theta / x[i])^beta
        }
    }
    
    return(f)
}
