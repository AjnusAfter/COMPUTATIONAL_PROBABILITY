#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Thu Nov 19 04:33:19 2026

@author: ajna
"""
import numpy as np
import matplotlib.pyplot as plt
import math

def weibull(nSamples, a, b):
    X = np.zeros(nSamples)
    U = np.random.sample(nSamples)
    
    for i in range(nSamples):
        X[i] = b * math.pow(-math.log(1 - U[i]), 1.0 / a)
        
    return (X)
    
a = 1
b = 0.5
nSamples = 50000

X = weibull(nSamples, a, b)
plt.title("Distribuição Weibull")
plt.xlabel("X")
plt.ylabel("Densidade")
plt.hist(X, bins=100, facecolor='blue')
plt.show()