# Weibull-Pareto Composite Cumulative Distribution Function
# pWPC: Computes the CDF of a Weibull-Pareto Composite distribution.

pWPC <- function(theta, beta, x) {
    """
    Compute the cumulative distribution function (CDF) of a Weibull-Pareto Composite distribution.

    Parameters:
    - theta (numeric): Scale parameter of the distribution.
    - beta (numeric): Shape parameter of the distribution.
    - x (numeric or numeric vector): Values at which to calculate the CDF.

    Returns:
    - numeric or numeric vector: CDF values corresponding to the input 'x'.
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
    F <- numeric(n)
    
    k <- 2.857334826
    a <- (k + 1) / (2 * k + 1)
    b <- (k + 1) / k
    
    for (i in 1:n) {
        if (x[i] <= theta) {
            F[i] <- a * (1 - exp(b * (x[i] / theta)^(beta * k))
        } else if (x[i] > theta) {
            F[i] <- 1 - a * (theta / x[i]^beta)
        }
    }
    
    return(F)
}
