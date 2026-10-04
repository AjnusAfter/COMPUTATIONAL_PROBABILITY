#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Fri Oct  2 04:56:16 2026

@author: jn
"""

import random

def LCG (seed, a, c, M, nSamples):
    x = seed
    u = []
    
    for _ in range(nSamples):
        nx = (a*x + c) % M
        u.append(float (nx) / float(M))
        x = nx
    
    return u

a = 39373
c = 0
M = 2^31-1
x0 = 3
qtdPersonagens = 10
nSamples = qtdPersonagens * 3       # 3 atributos por personagem

U = LCG(x0, a, c, M, nSamples)

#a
for i in range(qtdPersonagens):
    forcaLCG = 10.0 + U[3*i] * (20.0-10.0)
    agilidadeLCG = 10.0 + U[3*i +1] * (15.0-5.0)
    inteligenciaLCG = 10.0 + U[3*i +2] * (18.0-8.0)

print("\nforçaLCG:", forcaLCG)
print("agilidadeLCG:", agilidadeLCG)
print("inteligenciaLCG:", inteligenciaLCG)

#b        
forcaPadrao = random.uniform(10.0, 20.0)
agilidadePadrao = random.uniform(5.0, 15.0)
inteligenciaPadrao = random.uniform(8.0, 18.0)

print("\nforcaPadrao:", forcaPadrao)
print("agilidadePadrao:", agilidadePadrao)
print("inteligenciaPadrao:", inteligenciaPadrao)
