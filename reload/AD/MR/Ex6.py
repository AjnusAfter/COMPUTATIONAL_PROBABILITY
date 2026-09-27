#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Sat Sep 26 04:54:18 2026

@author: jn
"""

import random

def customChoiches(population, weights = None, k=1):
    if len(population) == 0:
        raise ValueError("A população não pode estar vazia.")
        
    if weights is None:
        weights = [1] * len (population)
        
    if len(weights) != len(population):
        raise ValueError("weights deve ter o mesmo tamanho de population.")
        
    if any(w < 0 for w in weights):
        raise ValueError("Os valores não podem ser negativos.")
        
    if sum(weights) == 0:
        raise ValueError("A soma dos pesos deve ser maior que zero.")
        
    resultado =[]
    cumulativas =[]
    soma = 0
    
    for w in weights:
        soma += w
        cumulativas.append(soma)
        
    for _ in range(k):
        r = random.uniform(0, soma)                 # gera número aleatório decimal entre 0 e soma
        
        for i, limite in enumerate(cumulativas):    # percorre cumulativas
            if r <= limite:                         # quando r cair dentro do limite de um elemento (probabilidade)
                resultado.append(population[i])     # appenda o elemento correspondente de population (instanciou)
                break
            
    return resultado

#teste
population = ["A", "B", "C"]
weights = [1, 2, 7]

print(customChoiches(population, weights, k=5))
