# Inverse CDF of Weibull-Pareto Composite Function (Quantile)
# qWPC: Computes the quantile of a Weibull-Pareto Composite distribution.

qWPC <- function(theta, beta, p) {
    """
    Compute the quantile of a Weibull-Pareto Composite distribution.

    Parameters:
    - theta (numeric): Scale parameter of the distribution.
    - beta (numeric): Shape parameter of the distribution.
    - p (numeric): Probability value between 0 and 1.

    Returns:
    - numeric: The quantile value for the given parameters.
    """
    # Check if 'theta' and 'beta' are non-negative
    if (theta < 0 || beta < 0) {
        stop("Both 'theta' and 'beta' should be non-negative.")
    }
    
    # Check if 'p' is within the valid range [0, 1]
    if (p < 0 || p > 1) {
        stop("'p' should be between 0 and 1.")
    }
    
    # Define parameters used in the quantile calculation
    k <- 2.857334826
    b <- (2 * k + 1) / (k + 1)
    a <- k / (k + 1)
    u <- k / (2 * k + 1)
    
    # Calculate the quantile value based on the given probability 'p'
    if (p <= u) {
        q <- theta * ((-a * log(1 - (b * p)))^(1 / (beta * k)))
    } else if (p > u) {
        q <- theta * (b * (1 - p))^(-1 / beta)
    }
    
    return(q)
}
