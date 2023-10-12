import numpy
import math

def simulation_gbm(drift, volatility, initial_value, n, time_difference):
    """
    Simulate the Geometric Brownian Motion (GBM) model.

    Parameters:
    - drift (float): Drift rate of the GBM.
    - volatility (float): Volatility (standard deviation) of the GBM.
    - initial_value (float): Initial value of the GBM.
    - n (int): Number of time steps.
    - time_difference (float): Time difference between steps.

    Returns:
    - numpy.ndarray: An array containing simulated GBM trajectories.
    """
    # Simulate N random variables following the standard normal distribution (0,1).
    N = numpy.random.standard_normal((n, n))
    
    # Standardization: Center and scale the data.
    N -= N.mean()
    N /= N.std()

    # Initialize an array to store the GBM trajectories.
    S = numpy.zeros((n, n))
    S[0] = initial_value

    for i in range(1, n):
        # Calculate the next step in the GBM model.
        S[i] = S[i - 1] * numpy.exp((drift - (volatility ** 2) / 2) * time_difference + volatility * math.sqrt(time_difference) * N[i])

    return S
