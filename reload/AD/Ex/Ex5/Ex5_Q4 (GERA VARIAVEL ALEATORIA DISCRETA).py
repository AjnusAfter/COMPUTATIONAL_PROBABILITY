#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Mon Oct 26 12:21:14 2026

@author: ajna
"""

import random
import matplotlib.pyplot as plt

def geraAleatoriaDiscreta(p, nSamples):
    x = []
    u = [random.uniform(0, 1) for _ in range(nSamples)]
    n = len(p)
    
    for i in range(nSamples):
        somaProb = p[0]
        
        for j in range(n):
            if (u[i] <= somaProb):
                    x.append(j)
                    break        
                
            somaProb+=p[j+1]                # somaProb atinge 100% (e break) antes de j+1 estourar o vetor
    
    return x
            

nSamples = 10000
p = [0.2, 0.5, 0.3]
U = geraAleatoriaDiscreta(p,nSamples)


gap  = 1                                    # "for j in range(n)" índices inteiros
bins = [i-gap/2 for i in range(len(p)+1)]   # GOOD size baseado também no tamanho de p
plt.hist(U, bins=bins, edgecolor="black",color="orange")
plt.title("Histograma")
plt.xlabel("Valores")
plt.ylabel("Frequência")
plt.xticks(range(len(p)))                   # apenas os valores de U (nesse caso índices inteiros)
plt.show()