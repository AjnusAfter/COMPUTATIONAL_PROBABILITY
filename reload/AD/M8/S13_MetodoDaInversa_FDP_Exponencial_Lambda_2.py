#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Thu Nov 19 03:05:21 2026

@author: jn
"""

import numpy as np
import matplotlib.pyplot as plt
import math

def exponencial(nSamples, taxa):
    X = np.zeros(nSamples)                      # nSamples com posições 0
    U = np.random.sample(nSamples)              # nSamples com valores [0.0, 1.0)]
    
    for i in range(nSamples):
        X[i] = -math.log(1.0 - U[i]) / taxa     # Inversa da Exponencial
    
    return (X)

taxa = 2.0
nSamples = 50000

X = exponencial(nSamples, taxa)

plt.title("Distribuição Exponencial")
plt.xlabel("X")
plt.ylabel("Densidade")
plt.hist(X, bins=100, facecolor='blue')
plt.show()