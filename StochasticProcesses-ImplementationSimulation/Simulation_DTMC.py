import numpy as np
from StateProbability import DTMC_StateProba

def simulation_DTMC(Steps, closing_price, initial_state_probability, transition_matrix):
    """
    Simulate a Discrete-Time Markov Chain (DTMC) for a given number of steps.

    Parameters:
    Steps (int): The number of time steps to simulate.
    closing_price (float): The initial closing price.
    initial_state_probability (numpy.ndarray): The initial state probability vector.
    transition_matrix (numpy.ndarray): The transition matrix of the DTMC.

    Returns:
    numpy.ndarray: An array containing simulated closing prices at each time step.
    """
    closing_prices = [closing_price]
    for i in range(1, Steps + 1):
        # Simulate a Uniform random variable at each time step
        U = np.random.rand(0, 1)
        pi_t = DTMC_StateProba(i, transition_matrix, initial_state_probability)
        # Choose the percentage delta of change in closing price upon increase or decrease
        delta = np.random.rand() * 2
        if pi_t[i][0] >= U:
            closing_price_t = closing_price * (100 + delta) / 100
        else:
            closing_price_t = closing_price * (100 - delta) / 100
        closing_prices.append(closing_price_t)
    return np.array(closing_prices)
