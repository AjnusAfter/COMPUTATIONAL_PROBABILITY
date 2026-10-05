#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Mon Oct  5 05:04:59 2026

@author: jn
"""

import random

"""
def LCG (seed, a, c, M, nSamples):
    x = seed
    u = []
    
    for _ in range(nSamples):
        nx = (a*x + c) % M
        u.append(float(nx) / float(M))
        x = nx
    
    return u


a = 39373
c = 0
M = 2^31 - 1
x0 = 123
"""

"""
U = LCG(x0, a, c, M, nSamples)
print(U)
"""

random.seed(123)    
nSamples = 1000
totalHoras = 720

listaSubstituicoes = []     # para a: média de substituições
listaCustos = []            # para b: custo médio por simulação
totalFalhasTotais = 0

for _ in range(nSamples):
    vidaUtil = 1.0
    substituicoes = 0
    custoTotal = 0

    for _ in range(totalHoras):
        # verificar falha total aleatória
        if random.random() < 0.002:
            substituicoes +=1
            totalFalhasTotais+=1
            custoTotal +=2000
            vidaUtil = 1.0      # reset
            continue
        
    # sorteia desgaste
    u = random.random()
    
    if u < 0.70:
        reducao = 0.01
        custoSubstituicao = 400
    elif u < 0.90:
        reducao = 0.03
        custoSubstituicao = 500
    else:
        reducao = 0.07
        custoSubstituicao = 700
        
    # aplica desgaste
    vidaUtil-=reducao
    
    # precisa substituir por desgaste?
    if vidaUtil <= 0:
        substituicoes +=1
        custoTotal += custoSubstituicao
        vidaUtil = 1.0      # reset
        
    listaSubstituicoes.append(substituicoes)
    listaCustos.append(custoTotal)
    
mediaSubstituicoes = sum(listaSubstituicoes) / nSamples
custoMedio = sum(listaCustos) / nSamples
mediaFalhasTotais = totalFalhasTotais / nSamples
    
print(f"Média de substituições por simulação: {mediaSubstituicoes:.4f}")
print(f"Custo médio total por simulação: R$ {custoMedio:.2f}")
print(f"Número médio de falhas totais aleatórias: {mediaFalhasTotais:.2f}")
    
    
    





















