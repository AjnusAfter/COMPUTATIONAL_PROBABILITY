#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Thu Oct  8 12:38:08 2026

@author: jn
"""

import random

random.seed(123)

#c
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

def DADO_OITO_FACES_VICIADO (U):
    n = len(U)
    dado = []
    
    for i in range(n):
        if U[i] < 1.0/7.0:
            dado.append(1)
        elif U[i] < 2.0/7.0:
            dado.append(2)
        elif U[i] < 3.0/7.0:
            dado.append(4)
        elif U[i] < 4.0/7.0:
            dado.append(5)
        elif U[i] < 5.0/7.0:
            dado.append(6)
        elif U[i] < 6.0/7.0:
            dado.append(7)
        else:
            dado.append(8)
    
    return dado

def LM(nSamples):
    moedas = []
    binarios = [2**9,2**8,2**7,2**6,2**5,2**4,2**3,2**2,2**1,2**0]
    maiorNumero = 2**10 -1
    u=[]
    
    for _ in range(nSamples):
        numero=0
        moedas = random.choices([0,1], k=10)
        
        for i in range(10):
            numero += moedas[i] * binarios[i]
            
        u.append(float(numero)/float(maiorNumero))
        
    return u
            
        

a = 39373
c = 0
M = 2**31 - 1
x0 = 3
nSamples = 10000


UM = LCG(x0, a, c, M, nSamples)
UD = LM(nSamples)

CC   = CARA_COROA(UM, 0.5)
DADO = DADO_OITO_FACES_VICIADO(UD)

coroa_e_oito = 0
for i in  range(nSamples):
    if CC[i] == 1 and DADO[i] == 8:
        coroa_e_oito+=1 
        
print("Caroa e Oito ocorreu", coroa_e_oito, "vezes.")

    
        
    
    