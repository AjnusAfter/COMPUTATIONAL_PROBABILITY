# -*- coding: utf-8 -*-
import numpy as np
import matplotlib.pyplot as plt

def p(x):
    return ((12*x**2)*(1 - x))

def h(x): # Uniforme (0, 1)
    x = np.asarray(x)
    return np.full_like(x, 1)

def inversaHx(x): # Gera amostra de h(x) pelo método da inversa.
    return (x)

# Pelo Método da Rejeição, para calcular c é necessário primeiro encontrar o valor de x
# que maximiza p(x)/h(x). O valor de c deve ser calculado neste ponto.
# Encontrando max(p(x)/h(x)):
# p(x)/h(x) = 12x^2(1 - x), derivando e igualando a 0, temos:
# 12(2x(1 - x) - x^2)=0
# 2x - 2x^2 - x^2 = 0
# -3x^2 + 2x = 0
# x(-3x + 2) = 0
# Temos x = 0 e x = 2/3 como possíveis valores de x.
# Para x = 0, temos p(x)/h(x) = 0 e Para x = 2/3, temos p(x)/h(x) = 16/9.
# x = 2/3 é o valor escolhido o que implica c = p(2/3)/h(2/3) = 16/9.
def gerarAmostraX(nsamples):
    cont = 0
    X = np.zeros(nsamples)
    c = 16/9
    # Teste diferentes valores de c (0.1, 0.3, 4, 20, etc)
    # para avaliar como ele afeta os resultados.    
    for i in range(nsamples):
        while (True):
            cont = cont + 1
            u1 = np.random.sample() # Para gerar amostra de h(x)
            y = inversaHx(u1) 
            u2 = np.random.sample()
            if (u2 <= p(y)/(c*h(y))):   
                X[i] = y
                break 
    return (X)

# p(x)
valorx = np.arange(0, 1, 0.01)
valory = p(valorx)
plt.title('Distribuição')
plt.xlabel('x')
plt.ylabel('p(x)')
plt.plot(valorx, valory, color = 'blue')
plt.show()

# p(x) e h(x)
valorxh = np.arange(0, 1, 0.01)
c = (p(2/3)/h(2/3))
valoryh = c*h(valorxh)
plt.title('Distribuição')
plt.xlabel('x')
plt.ylabel('p(x)')
plt.plot(valorx, valory, color = 'blue')
plt.plot(valorxh, valoryh, color = 'orange')
plt.show()

# Gerando a amostra
nsamples = 100000
X = gerarAmostraX(nsamples)
plt.hist(X, bins = 100, facecolor = 'green')
plt.title('Amostra')
plt.xlabel('x')
plt.show()

# p(x) e amostra
plt.plot(valorx, valory, color = 'blue', label='Distribuição teórica')
plt.hist(X, density=True, bins = 100, facecolor = 'green', label = 'Histograma (densidade)')
plt.title('Distribuição teórica + Histograma da amostra')
plt.xlabel('x')
plt.ylabel('Densidade')
plt.legend()
plt.show()

