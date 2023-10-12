import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import seaborn as sns
import scipy.stats as stats

# Binomial Distribution Simulation:
def binomial_simulation(n, p, size):
    """
    Simulate random samples from the binomial distribution.

    The binomial distribution models the number of successful trials in 'n' independent
    experiments, each with a probability of success 'p'. It is characterized by the
    probability mass function (PMF).

    Parameters:
    - n (int): The number of independent trials.
    - p (float): The probability of success in each trial.
    - size (int): The number of random samples to generate.

    Returns:
    - np.array: An array of random samples from the binomial distribution.
    """
    samples = []
    for j in range(size):
        count_success = 0
        for i in range(n):
            U = np.random.uniform(0, 1)
            if U <= p:
                count_success += 1
        samples.append(count_success)

    # Plot a histogram of the generated samples
    plt.hist(samples, bins=n+1, range=(0, n+1), density=True)
    plt.title('Binomial Distribution')
    plt.xlabel('Number of Successes')
    plt.ylabel('Probability')
    plt.show()
    
    return np.array(samples)

# Poisson Distribution Simulation:
def poisson_simulation(lam, size):
    """
    Simulate random samples from the Poisson distribution.

    The Poisson distribution models the number of events occurring in a fixed interval of
    time or space, with a known average rate 'lam'. It is characterized by the probability
    mass function (PMF).

    Parameters:
    - lam (float): The average rate of events in the interval.
    - size (int): The number of random samples to generate.

    Returns:
    - np.array: An array of random samples from the Poisson distribution.
    """
    samples = []
    S = 0
    i = 1
    X = 0
    while i <= size and S <= 1:
        U = np.random.uniform(0, 1)
        S = S + (-np.log(U)) / lam
        if S > 1:
            X = X + i
        i = i + 1
        samples.append(X)

    # Plot a histogram of the generated samples
    plt.hist(samples, bins=max(samples)+1, range=(0, max(samples)+1), density=True)
    plt.title('Poisson Distribution')
    plt.xlabel('Number of Events')
    plt.ylabel('Probability')
    plt.show()
    
    return np.array(samples)

# Geometric Distribution Simulation:
def geometric_simulation(p, size):
    """
    Simulate random samples from the geometric distribution.

    The geometric distribution models the number of trials needed to achieve the first
    success in a series of Bernoulli trials, each with probability of success 'p'.

    Parameters:
    - p (float): The probability of success in each trial.
    - size (int): The number of random samples to generate.

    Returns:
    - int: The number of trials needed to achieve the first success.
    """
    i = 1
    U = np.random.uniform(0, 1)
    while i <= size and U > p:
        U = np.random.uniform(0, 1)
        i = i + 1

    return i
