import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns
import scipy.stats as stats

# Exponential Distribution Simulation:
def exponential_simulation(lam, size):
    """
    Simulate random samples from the exponential distribution.

    Parameters:
    - lam (float): The rate parameter of the exponential distribution.
    - size (int): The number of random samples to generate.

    Returns:
    - np.array: An array of random samples from the exponential distribution.
    """
    samples = []
    for i in range(size):
        U = np.random.uniform(0, 1)
        X = -(np.log(U)) / lam
        samples.append(X)
    
    # Plot a histogram of the generated samples
    plt.hist(samples, bins=30, density=True)
    plt.title('Exponential Distribution')
    plt.xlabel('Value')
    plt.ylabel('Probability')
    plt.show()
    
    return np.array(samples)

# Gamma Distribution Simulation:
def gamma_simulation(lam, size):
    """
    Simulate random samples from the gamma distribution.

    Parameters:
    - lam (float): The rate parameter of the gamma distribution.
    - size (int): The number of random samples to generate.

    Returns:
    - float: The sum of random samples from the gamma distribution.
    """
    sum_samples = 0
    for i in range(size):
        U = np.random.uniform(0, 1)
        X = -(np.log(U)) / lam
        sum_samples += X

    return sum_samples
