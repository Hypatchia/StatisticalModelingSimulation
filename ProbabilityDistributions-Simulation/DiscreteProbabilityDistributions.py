import pandas as pd 
import numpy as np 
import matplotlib.pyplot as plt 
import seaborn as sns
import scipy.stats as stats


#Binomial Distribution
def binomial_simulation(n,p,size):
    l=[]
    for j in range(size):
        cpt=0
        for i in range(n):
            U = np.random.uniform(0,1)
            if U<=p:
                cpt=cpt+1
        X=cpt
        l.append(X)
    plt.hist(l)
    return np.array(l)

#Poisson distribution
def poisson_simulation(lam,size):
    l=[]
    S=0
    i=1
    X=0
    while i<=size and S<=1:
        U= np.random.uniform(0,1)
        S=S+(-np.log(U))/lam
        print(S)
        if S>1 :
            X=X+i*1 
            print(X)
        i=i+1
        l.append(X)
    plt.hist(l)
    return np.array(l)

    
#Geometric Distribution
def geometric_simulation(p,size):
    i=1
    U=np.random.uniform(0,1)
    print(U)
    while i<=size and U>p:
        U=np.random.uniform(0,1)
        print(U)
        i=i+1
    return i