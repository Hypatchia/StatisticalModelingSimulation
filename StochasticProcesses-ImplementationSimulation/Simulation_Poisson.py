import numpy as np
def poisson_simulation(size, lam, timespan):
    """
    Simulate a Poisson process for a given time span.

    Parameters:
    size (int): The maximum number of events to simulate.
    lam (float): The Poisson process rate parameter.
    timespan (float): The time span for which the process is simulated.

    Returns:
    numpy.ndarray: An array containing the event occurrence times.
    numpy.ndarray: An array containing the event counts at each occurrence time.
    """
    i = 0
    t = 0
    s = [0]
    counter = [i]
    for j in range(1, size + 1):
        U_1 = np.random.uniform(0, 1)
        t = t - (np.log(U_1) / lam)
        s.append(t)
        if t > timespan:
            break
        else:
            U_2 = np.random.uniform(0, 1)
            i = i + np.floor(11 * U_2) + 10
        counter.append(i)

    return np.array(s), np.array(counter)
