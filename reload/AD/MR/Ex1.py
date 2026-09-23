#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Wed Sep 23 01:41:57 2026

@author: jn
"""

import random

#a

totalCombinacoes = 2 * 6
print(totalCombinacoes)

#b
print("#B:") 
#analítica
PB = (1/2) * (1/6)
print("analítica:", PB)

#simulação
nSamples = 1000000
contB = 0

for i in range(nSamples):
    faceMoeda = random.choices(["CA","CO"], weights = [1/2,1/2], k=1)[0]
    faceDado = random.choices(["1","2","3","4","5","6"], weights = [1/6,1/6,1/6,1/6,1/6,1/6], k=1)[0]
    
    if ((faceMoeda == "CA") and (faceDado == "4")):
        contB = contB + 1

PB = contB / nSamples
print("simulação:", PB)

#c
print("#C:") 
#analítica
PC = (2/3) * (1/6)
print("analítica:", PC)

#simulação
nSamples = 1000000
contC = 0

for i in range(nSamples):
    faceMoeda = random.choices(["CA","CO"], weights = [2/3,1/3], k=1)[0]
    faceDado = random.choices(["1","2","3","4","5","6"], weights = [1/6,1/6,1/6,1/6,1/6,1/6], k=1)[0]
    
    if ((faceMoeda == "CA") and (faceDado == "4")):
        contC = contC + 1
    
PC = contC / nSamples
print("simulação:", PC) 
    
    
    