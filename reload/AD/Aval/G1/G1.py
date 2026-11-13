# -*- coding: utf-8 -*-
"""
Editor Spyder

Este é um arquivo de script temporário.
"""

import random
import math

random.seed(42)

nSamples = 1000

#Q2d

taxaComDefeito = 0.12
taxaSemDefeito = 1-taxaComDefeito # 0.88

taxaComDefeitoIDComDefeito = 0.92
taxaComDefeitoIDSemDefeito = 1-taxaComDefeitoIDComDefeito # 0.08

taxaSemDefeitoIDComDefeito = 0.08
taxaSemDefeitoIDSemDefeito = 1-taxaSemDefeitoIDComDefeito # 0.92


comDefeito=0
comDefeitoIDComDefeito=0
semDefeitoIDComDefeito=0
semDefeito=0
comDefeitoIDSemDefeito=0
semDefeitoIDSemDefeito=0
for _ in range(nSamples):
    comDefeito += random.choices([1, 0], weights=[taxaComDefeito,1-taxaComDefeito], k=1)[0]
    comDefeitoIDComDefeito += random.choices([1, 0], weights=[taxaComDefeitoIDComDefeito,1-taxaComDefeitoIDComDefeito], k=1)[0]
    semDefeitoIDComDefeito += random.choices([1, 0], weights=[taxaSemDefeitoIDComDefeito,1-taxaSemDefeitoIDComDefeito], k=1)[0]
    
    semDefeito += random.choices([1, 0], weights=[taxaSemDefeito,1-taxaSemDefeito], k=1)[0]
    #print(semDefeito)
    comDefeitoIDSemDefeito = random.choices([1, 0], weights=[taxaComDefeitoIDSemDefeito,1-taxaComDefeitoIDSemDefeito], k=1)[0]
    #print(comDefeitoIDSemDefeito)
    semDefeitoIDSemDefeito = random.choices([1, 0], weights=[taxaSemDefeitoIDSemDefeito,1-taxaSemDefeitoIDSemDefeito], k=1)[0]
    #print(semDefeitoIDSemDefeito)
    
probIDDefeituosoSerDefeituoso =  comDefeito / (comDefeitoIDComDefeito + semDefeitoIDComDefeito)
print("probIDDefeituosoSerDefeituoso:", probIDDefeituosoSerDefeituoso)
probIDNaoDefeituosoSerNaoDefeituoso =(comDefeitoIDSemDefeito + semDefeitoIDSemDefeito) / semDefeito
print("probIDNaoDefeituosoSerNaoDefeituoso:", probIDNaoDefeituosoSerNaoDefeituoso)

#Q4


def LCG (seed, a, c, M, nSamples):
    x = seed
    u = []
    
    for _ in range(nSamples):
        nx = (a*x + c) % M
        u.append(float(nx) / float(M))
        x = nx
        
    return u

def FX(x):
    return -x**2+10*x-16

def HX(x):
    return -3*x**2+36*x-81

a = 39373
c = 0
M = 2**31 -1
x0= 42

UXY = LCG(x0, a, c, M, 2 * nSamples)

raizFX_1 = (-10 - math.sqrt(10**2 -4*(-1)*(-16)))/2*(-1)
print("\n",raizFX_1)
raizFX_2 = (-10 + math.sqrt(10**2 -4*(-1)*(-16)))/2*(-1)
print(raizFX_2)

raizHX_1 = (-36 - math.sqrt(36**2 -4*(-3)*(-81)))/2*(-3)
print(raizHX_1)
raizHX_2 = (-36 + math.sqrt(36**2 -4*(-3)*(-81)))/2*(-3)
print(raizHX_2)

pontoArea=0
for i in range(nSamples):
    x = UXY[2*i]
    y = UXY[2*i+1]
    Fy = FX(y)
    Hy = HX(y)
    
    if (((x > raizFX_2 and x < raizFX_1) or (x > raizHX_2 and x < raizHX_1)) and ((y < Fy) or (y < Hy))): 
        pontoArea+=1 

estimativa = pontoArea / nSamples        
print("\nEstimativa:", estimativa)    # 0.0, estranho mas esperado pois os limites laterais não se sobrepóem
# não parece haver insterseção entre as funções

#Q5
nSegurados = 1000


P1_1a5 = [
      [0.85,0.12,0.03],
      [0.08,0.72,0.20],
      [0,0,1]
      ]

P2_6a10 = [
      [0.81,0.14,0.05],
      [0.05,0.70,0.25],
      [0,0,1]
      ]
      
P3_11a17 = [
      [0.78,0.15,0.07],
      [0.04,0.65,0.31],
      [0,0,1]
      ]

#if

r = 0.08            
t = 17


for i in range(nSegurados):
    prob1 = random.choices([1,2,3], weights=P1_1a5[i], k=1)[0]
    prob2 = random.choices([1,2,3], weights=P2_6a10[i], k=1)[0]
    pro31 = random.choices([1,2,3], weights=P3_11a17[i], k=1)[0]


#valorPresente = valorFuturo / (1+r)**t        
    
