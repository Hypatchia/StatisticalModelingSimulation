import pandas as pd 
import numpy as np 
import matplotlib.pyplot as plt 
import seaborn as sns
import scipy.stats as stats

# Exponential Distribution :
def exponential_simulation(lam,size):
    l=[]
    for i in range(size):
        U= np.random.uniform(0,1)
        X= -(np.log(U))/lam
        l.append(X)
    plt.hist(l)
    return np.array(l)



# Gamma Distribution
def gamma_simulation(lam,size):
    S=0
    for i in range(size):
        U=np.random.uniform(0,1)
        X=(-np.log(U))/lam
        S=S+X
    return S