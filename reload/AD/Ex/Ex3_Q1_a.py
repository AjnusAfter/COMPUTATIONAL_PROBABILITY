#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Thu Oct  8 11:02:05 2026

@author: jn
"""

#import matplotlib.pyplot as plt

#a
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

a = 39373
c = 0
M = 2**31 - 1
x0 = 3
nSamples = 10000


UM1 = LCG(x0, a, c, M, nSamples)
UM2 = LCG(50, a, c, M, nSamples)
#plt.hist(U, color="green", edgecolor="black")

CC1 = CARA_COROA(UM1, 0.5)
CC2 = CARA_COROA(UM2, 0.5)

#print(sum(CC))

cara_e_coroa = 0

for i in  range(nSamples):
    if CC1[i] != CC2[i]:
        cara_e_coroa+=1 
        
print("Cara e Coroa ocorreu", cara_e_coroa, "vezes."        )

    
        
    
    