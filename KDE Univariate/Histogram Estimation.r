# Generate a random sample from a normal distribution
x <- rnorm(100)

# Define the number of bins
bins <- 20

# Define the bin edges
bin_edges <- seq(min(x), max(x), length.out = bins + 1)

# Determine the bin indices for each value in x
bin_indices <- findInterval(x, bin_edges)

# Calculate the bin counts
bin_counts <- tapply(x, bin_indices, length)

# Calculate the bin widths
bin_widths <- diff(bin_edges)

# Calculate the histogram estimate ŝ(x)
s_hat <- function(x) {
  bin <- findInterval(x, bin_edges)
  (1/length(x)) * bin_counts[bin] / bin_widths[bin]
}

