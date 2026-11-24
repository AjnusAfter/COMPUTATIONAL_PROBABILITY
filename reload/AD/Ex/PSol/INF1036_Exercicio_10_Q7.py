# -*- coding: utf-8 -*-

import numpy as np
import matplotlib.pyplot as plt
import math

# a)
# f(x) = 5x^4
# F(x) = x^5
# F-1(x) = (u^(1/5))

def f(x):
    return (5*(x**4))

def inversaFx(u):
    return (u**(1/5))

def gerarAmostraX(nsamples):
    X = np.zeros(nsamples) 
    U = np.random.sample(nsamples)
    for i in range(nsamples):
        X[i] = inversaFx(U[i])  
    return (X)

# f(x)
valorx = np.arange(0, 1, 0.01)
valory = f(valorx)
plt.plot(valorx, valory, color = 'blue')
plt.title('Distribuição')
plt.xlabel('x')
plt.ylabel('f(x)')
plt.grid(True)
plt.show()

# Amostra
nsamples = 100000
X = gerarAmostraX(nsamples)
plt.hist(X, bins = 100, facecolor = 'green')
plt.title('Amostra')
plt.xlabel('x')
plt.grid(True)
plt.show()

# f(x) e amostra
plt.plot(valorx, valory, color = 'blue', label='Distribuição teórica')
plt.hist(X, density = True, bins = 100, facecolor = 'green', label = 'Histograma (densidade)')
plt.title('Distribuição teórica + Histograma da amostra')
plt.xlabel('x')
plt.ylabel('Densidade')
plt.legend()
plt.grid(True)
plt.show()


# b)
# função g(x)
# Para 0 < x < 1/2, temos:
# g(x) = 4x
# G(x) = 2x^2
# G-1(x) = raiz(x/2)
# Para 1/2 < x < 1, temos:
# g(x) = 4(1 - x)
# G(x) = -2(1 - x)^2 + 1 (0.5 + integral de g(t) para 1/2 < t < x)
# G-1(x) = 1 - raiz((1 - u)/2)

def gx(x):   
    return np.where((x >= 0) & (x <= 0.5), 4*x, 4*(1 - x))
      
def Gx(x):
    return np.where((x >= 0) & (x <= 0.5), 2*x**2, 4*x - 2*x**2 - 1)
    
def inversaGx(u):
    return np.where((u >= 0) & (u <= 0.5), np.sqrt(u/2), 1 - np.sqrt((1 - u)/2))

def gerarAmostraX(nsamples):
    X = [] 
    U = np.random.sample(nsamples)
    X = inversaGx(U)
    return (X)


# g(x)
valorx = np.arange(0, 1, 0.01)
valory = gx(valorx)
plt.plot(valorx, valory, color = 'blue')
plt.title('Distribuição')
plt.xlabel('x')
plt.ylabel('g(x)')
plt.grid(True)
plt.show()

# Gerando a amostra
nsamples = 100000
X = gerarAmostraX(nsamples)
plt.hist(X, bins = 100, facecolor = 'green')
plt.title('Amostra')
plt.xlabel('x')
plt.grid(True)
plt.show()

# g(x) e amostra
plt.plot(valorx, valory, color = 'blue', label='Distribuição teórica')
plt.hist(X, density = True, bins = 100, facecolor = 'green', label = 'Histograma (densidade)')
plt.title('Distribuição teórica + Histograma da amostra')
plt.xlabel('x')
plt.ylabel('Densidade')
plt.legend()
plt.grid(True)
plt.show()


# G(x) e G-1(x)
valorx = np.arange(0, 1, 0.01)
valoryGx = Gx(valorx)
valoryInversaGx = inversaGx(valorx)

plt.figure(figsize=(10, 6))
plt.plot(valorx, valoryGx, label="Acmuluada G(x)", color='blue')
plt.plot(valorx, valoryInversaGx, label="Inversa $G^{-1}(u)$", color='green')
plt.axvline(0.5, color='gray', linestyle='--', alpha=0.5)
plt.title("Acumulada + Inversa da acumlada")
plt.xlabel("$x$ ou $F^{-1}(u)$")
plt.ylabel("$G(x)$ ou $u$")
plt.grid(True)
plt.legend()
plt.show()
