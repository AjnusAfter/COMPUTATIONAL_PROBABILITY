#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Thu Oct  8 12:14:32 2026

@author: jn
"""

import numpy as np

#b
def LCG(seed, a, c, M, nSamples):
    x = seed
    u = []
    
    for _ in range(nSamples):
        nx = (a*x + c) % M
        u.append(float(nx)/float(M))
        x = nx
        
    return u

def CARA_COROA(U, p):
    n = len(U)
    CC = []
    
    for i in range(n):
        if U[i] < (1.0 - p):
            CC.append(0)
        else:
            CC.append(1)
    
    return CC

def DADO_OITO_FACES (U):
    n = len(U)
    dado = []
    
    for i in range(n):
        if U[i] < 1.0/8.0:
            dado.append(1)
        elif U[i] < 2.0/8.0:
            dado.append(2)
        elif U[i] < 3.0/8.0:
            dado.append(3)
        elif U[i] < 4.0/8.0:
            dado.append(4)
        elif U[i] < 5.0/8.0:
            dado.append(5)
        elif U[i] < 6.0/8.0:
            dado.append(6)
        elif U[i] < 7.0/8.0:
            dado.append(7)
        else:
            dado.append(8)
    
    return dado

a = 39373
c = 0
M = 2**31 - 1
x0 = 3
nSamples = 10000


UM = LCG(x0, a, c, M, nSamples)
UD = np.random.sample(nSamples)

CC   = CARA_COROA(UM, 0.5)
DADO = DADO_OITO_FACES(UD)

coroa_e_cinco = 0
for i in  range(nSamples):
    if CC[i] == 1 and DADO[i] == 5:
        coroa_e_cinco+=1 
        
print("Caroa e Cinco ocorreu", coroa_e_cinco, "vezes.")

    
        
    
    