#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Thu Oct  8 13:24:57 2026

@author: jn
"""

import random
import numpy as np

random.seed(123)

#d

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
            
        

nSamples = 10000


UM = np.random.sample(nSamples)
UD = LM(nSamples)

CC   = CARA_COROA(UM, 0.55)
DADO = DADO_OITO_FACES(UD)

#cara_e_um = 0
#cara_e_quatro = 0
#coroa_e_sete = 0
count=0
for i in  range(nSamples):
    if CC[i] == 1 and DADO[i] == 7:
        count+=1 
        
    elif CC[i] == 0 and (DADO[i] == 1 or DADO[i]==4):
        count+=1
    
        
        
print("Probabilidade estimada:", count/nSamples)
