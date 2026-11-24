#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Mon Nov 23 21:26:24 2026

@author: jn
"""

import numpy as np
import math
import matplotlib.pyplot as plt

def inversa_F(u):
    return (u**(1/3))

def gerar_f(nSamples):
        X = np.zeros(nSamples)
        U = np.random.sample(nSamples)
        
        for i in range(nSamples):
            X[i] = inversa_F(U[i])
        return (X)
    


x = np.linspace(0, 1, 100)

plt.plot(x, 3*x**2, color='blue', linewidth=2)
plt.title(r'Função densidade $f(x)=3x^2$')
plt.xlabel('x')
plt.ylabel('f(x)')
plt.grid()
plt.show()


X = gerar_f(100000)

plt.hist(X, bins=100, density=True, color='blue')
plt.title('Distribuição')
plt.xlabel('X')
plt.ylabel('Densidade')
plt.grid()
plt.show()


plt.hist(X, bins=100, density=True,
         color='blue', label='Distribuição simulada')

plt.plot(x, 3*x**2,
         color='red', linewidth=2,
         label='Densidade teórica')

plt.title('Distribuição simulada x Teórica')
plt.xlabel('X')
plt.ylabel('Densidade')
plt.legend()
plt.grid()

plt.show()