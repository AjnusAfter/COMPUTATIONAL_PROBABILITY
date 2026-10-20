#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Mon Oct  5 11:57:22 2026

@author: jn
"""

import random

"""
probAVenceB = 0.60
probBVenceA = 1 - probAVenceB
probBVenceC = 0.65
probCVenceB = 1 - probBVenceC
probCVenceA = 0.55
probAVenceC = 1 - probCVenceA

probADescansa = 0.4
probBDescansa = 0.3 
probCDescansa = 0.3

x0= 123
a = 39373
c = 0
M = 2^31 - 1

def LCG(seed, a, c, M, nSamples):
    x = seed
    u = []
    
    for _ in range(nSamples):
        nx = (a*x + c) % M
        u.append(float(nx) / float(M))
        x = nx
        
    return u

U = LCG (x0, a, c, M, nSamples)
"""

random.seed(123)

nSamples = 1000
countVitorias = [0, 0, 0]        # A, B, C
probVitorias  = [0, 0, 0]        # A, B, C

def vencedorDuelo (p1, p2):
    prob = 0
    
    if p1 == 1 and p2 == 2:
        prob = 0.60
    elif p1 == 2 and p2 == 1:
        prob = 0.40
    elif p1 == 2 and p2 == 3:
        prob = 0.65
    elif p1 == 3 and p2 == 2:
        prob = 0.35
    elif p1 == 3 and p2 == 1:
        prob = 0.55
    elif p1 == 1 and p2 == 3:
        prob = 0.45
    
    
    if random.random() < prob:
        return p1
    else:
        return p2
    

for _ in range(nSamples):
    descanso = random.choices([1,2,3], weights=[0.4, 0.3, 0.3], k=1)[0]
    
    if descanso == 1:
        p1 = 2
        p2 = 3
    elif descanso == 2:
        p1 = 1
        p2 = 3
    else:
        p1 = 1
        p2 = 2
        
    vencedorPreliminar = vencedorDuelo(p1, p2)
    vencedorEtapa = vencedorDuelo(vencedorPreliminar, descanso)
        
    countVitorias[vencedorEtapa - 1] += 1
        
        
for i in range(len(countVitorias)):
    probVitorias[i] = countVitorias[i] / nSamples
        
print("Probabilidade de Vitória:")
print(f"A = {probVitorias[0]:.2f}")     # 0.35
print(f"B = {probVitorias[1]:.2f}")     # 0.35
print(f"C = {probVitorias[2]:.2f}")     # 0.30


    
    




