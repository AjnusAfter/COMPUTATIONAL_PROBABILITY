# -*- coding: utf-8 -*-

# Para 0 < x < 1, temos:
# f(x) = 3x^2
# F(x) = x^3
# F-1(x) = (u^(1/3))

import numpy as np
import matplotlib.pyplot as plt

def f(x):
    return (3*(x**2))

def inversaFx(u):
    return (u**(1/3))

def gerarAmostraX(nsamples):
    X = np.zeros(nsamples) 
    U = np.random.sample(nsamples)
    for i in range(nsamples):
        X[i] = inversaFx(U[i])  
    return (X)

# f(x)
valorx = np.arange(0, 1, 0.01)
valory = f(valorx)
plt.title('Distribuição')
plt.xlabel('x')
plt.ylabel('f(x)')
plt.plot(valorx, valory, color = 'blue')
plt.show()

# Gerando a amostra
nsamples = 100000
X = gerarAmostraX(nsamples)
plt.hist(X, bins = 100, facecolor = 'green')
plt.title('Amostra')
plt.xlabel('x')
plt.show()

# f(x) e amostra
plt.plot(valorx, valory, color = 'blue', label='Distribuição teórica')
plt.hist(X, density = True, bins = 100, facecolor = 'green', label = 'Histograma (densidade)')
plt.title('Distribuição teórica + Histograma da amostra')
plt.xlabel('x')
plt.ylabel('Densidade')
plt.legend()
plt.show()




