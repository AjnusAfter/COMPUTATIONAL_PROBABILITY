#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Mon Oct 19 19:49:22 2026

@author: ajna
"""

#0 importa numpy
import numpy as np

#1 define LCG
def LCG(seed, a, c, M, nSamples):
    x = seed
    u = []
    
    for _ in range(nSamples):
        nx = (a*x + c) % M
        u.append(float(nx/float(M)))
        x = nx
    
    return u

#2 define parâmetros do LCG: 4
a = 39373
c = 0
M = 2**31 -1
x0 = 3

#3 define quantidade de leituras
nSamples = 100

#4 declara vetores para calcular média(s) desejadas: 3
vetorTemperatura =[]
vetorUmidadeAr =[]
vetorUmidadeSolo =[]

#5 gera LCG's (com sementes diferentes)
LCG_temperatura = LCG(x0, a, c, M, nSamples)
LCG_umidadeAr = LCG(x0+1, a, c, M, nSamples)    # seed diferente
LCG_umidadeSolo = LCG(x0+2, a, c, M, nSamples)  # seed diferente

#6 preenche os vetores (a*x + c?) iterando
vetorTemperatura = [15 + u * (35-15) for u in LCG_temperatura]
vetorUmidadeAr = [0.3 + u * (0.9-0.3) for u in LCG_umidadeAr]
vetorUmidadeSolo = [0.2 + u * (0.8-0.2) for u in LCG_umidadeSolo]

#7 calcula as médias a partir dos vetores
mediaTemperatura = np.mean(vetorTemperatura)    
mediaUmidadeAr = np.mean(vetorUmidadeAr) * 100    
mediaUmidadeSolo = np.mean(vetorUmidadeSolo) * 100

#8 imprime as médias
print(f"O valor médio da Temperatura é: {mediaTemperatura:.2f}°C.")
print(f"O valor médio da Umidade do Ar é: {mediaUmidadeAr:.2f}%.")
print(f"O valor médio da Umidade do Solo é: {mediaUmidadeSolo:.2f}%.")