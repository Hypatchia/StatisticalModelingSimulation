
import numpy as np
def DTMC_StateProba(t, P, pi_0):
    """
    Calculate the state probabilities of a Discrete-Time Markov Chain (DTMC) after 't' time steps.

    Parameters:
    t (int): The number of time steps to simulate.
    P (numpy.ndarray): The transition matrix of the DTMC.
    pi_0 (numpy.ndarray): The initial state probability vector.

    Returns:
    numpy.ndarray: An array containing state probabilities at each time step.
    """
    # pi_t is equal to pi_0 multiplied by the t step transition matrix
    nth_P = P
    # Create an array that will contain state probabilities and initialize it to pi_0.
    pi_t = [pi_0]
    # Loop t times to calculate the state probabilities at each time step.
    for i in range(t):
        # Calculate the state probabilities at the next time step.
        pi_t.append(np.matmul(pi_0, nth_P))
        # Update the transition matrix to the next power.
        nth_P = np.matmul(nth_P, P)
    # Return the state probabilities.
    return np.array(pi_t)
