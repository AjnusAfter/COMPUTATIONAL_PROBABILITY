#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Wed Sep 23 02:28:58 2026

@author: jn
"""

import random

nSamples = 1000000
contA = 0
contB = 0

for i in range(nSamples):
    moedaRed = random.choices(["CA","CO"], weights = [2/5,3/5], k=1)[0]
    moedaGreen = random.choices(["CA","CO"], weights = [2/5,3/5], k=1)[0]
    moedaBlue = random.choices(["CA","CO"], weights = [2/5,3/5], k=1)[0]
    
    # (moedaRed == "CO" and moedaGreen == "CA") or (moedaRed == "CA" and moedaGreen == "CO")
    if (moedaRed != moedaGreen): 
        contA+=1
        
    if (moedaGreen == "CO" and moedaBlue == "CO"):
        contB+=1
        
PA = contA / nSamples        
PB = contB / nSamples
        
print("P(A):", PA)
print("P(B):", PB)