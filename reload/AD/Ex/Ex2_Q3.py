#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Thu Oct  8 10:27:51 2026

@author: jn
"""

import random
import numpy as np
import matplotlib.pyplot as plt

random.seed(123)


P = np.array([
    [0.6, 0.3, 0.1],
    [0.2, 0.5, 0.3],
    [0.1, 0.3, 0.6]
    ])

nSamples = 1000
estadoInicial = 2
estados = [0] *nSamples
estados[0] = estadoInicial

# smulação da cadeia
for i in range(1, nSamples):
    estadoAtual = estados[i-1]
    estados[i] = random.choices([1,2,3], weights=P[estadoAtual-1], k=1)[0]

# frequência relativa
frequenciaRelativa = []
for estado in [1,2,3]:
    frequenciaRelativa.append(estados.count(estado) / len(estados))
    
print("Frequêcia relativa dos estados:")
print(f"Estado 1: {frequenciaRelativa[0]:.5f}")
print(f"Estado 2: {frequenciaRelativa[1]:.5f}")
print(f"Estado 3: {frequenciaRelativa[2]:.5f}")

plt.bar([1,2,3], frequenciaRelativa)
plt.title("Frequência relativa dos estados")
plt.xlabel("Estado")
plt.ylabel("Frequência relativa")
plt.show()
    