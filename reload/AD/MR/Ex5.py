#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Sat Sep 26 03:13:29 2026

@author: jn
"""

import random

nSamples = 100000

contSemDefeito = 0
contComDefeito = 0

contSemManutencao = 0
contComManutencao = 0

contSemManutencaoSemDefeito = 0
contSemManutencaoComDefeito = 0
contComManutencaoSemDefeito = 0
contComManutencaoComDefeito = 0

contSemManutencaoComDefeitoC1 = 0
contComManutencaoComDefeitoC1 = 0
contSemManutencaoComDefeitoC2 = 0
contComManutencaoComDefeitoC2 = 0
contSemManutencaoComDefeitoC3 = 0
contComManutencaoComDefeitoC3 = 0
contSemManutencaoComDefeitoC4 = 0
contComManutencaoComDefeitoC4 = 0

for i in range(nSamples):

  workwork_efetuaManutencao = random.choices([True, False], weights = [0.4, 0.6], k=1)[0]
  
  if workwork_efetuaManutencao == True:
    contComManutencao = contComManutencao +1
    
    apresentouDefeitoC1 =  random.choices(["C1","SD"], weights = [0.04, 0.96], k=1)[0]
    apresentouDefeitoC2 =  random.choices(["C2","SD"], weights = [0.04, 0.96], k=1)[0]
    apresentouDefeitoC3 =  random.choices(["C3","SD"], weights = [0.03, 0.97], k=1)[0]
    apresentouDefeitoC4 =  random.choices(["C4","SD"], weights = [0.03, 0.97], k=1)[0]
    
    if apresentouDefeitoC1 == "C1":
        contComManutencaoComDefeitoC1 = contComManutencaoComDefeitoC1 +1
      
    if apresentouDefeitoC2 == "C2":
        contComManutencaoComDefeitoC2 = contComManutencaoComDefeitoC2 +1
      
    if apresentouDefeitoC3 == "C3":
        contComManutencaoComDefeitoC3 = contComManutencaoComDefeitoC3 +1
      
    if apresentouDefeitoC4 == "C4":
        contComManutencaoComDefeitoC4 = contComManutencaoComDefeitoC4 +1
      
    if apresentouDefeitoC1 == "SD" and apresentouDefeitoC2 == "SD" and apresentouDefeitoC3 == "SD" and apresentouDefeitoC4 == "SD":
        contComManutencaoSemDefeito = contComManutencaoSemDefeito +1
    else:
        contComManutencaoComDefeito = contComManutencaoComDefeito +1
      
  else:
    contSemManutencao = contSemManutencao +1
    
    apresentouDefeitoC1 =  random.choices(["C1","SD"], weights = [0.04, 0.96], k=1)[0]
    apresentouDefeitoC2 =  random.choices(["C2","SD"], weights = [0.04, 0.96], k=1)[0]
    apresentouDefeitoC3 =  random.choices(["C3","SD"], weights = [0.06, 0.94], k=1)[0]
    apresentouDefeitoC4 =  random.choices(["C4","SD"], weights = [0.06, 0.94], k=1)[0]
    
    if apresentouDefeitoC1 == "C1":
      contSemManutencaoComDefeitoC1 = contSemManutencaoComDefeitoC1 +1
      
    if apresentouDefeitoC2 == "C2":
      contSemManutencaoComDefeitoC2 = contSemManutencaoComDefeitoC2 +1
      
    if apresentouDefeitoC3 == "C3":
      contSemManutencaoComDefeitoC3 = contSemManutencaoComDefeitoC3 +1
      
    if apresentouDefeitoC4 == "C4":
      contSemManutencaoComDefeitoC4 = contSemManutencaoComDefeitoC4 +1
      
    
    if apresentouDefeitoC1 == "SD" and apresentouDefeitoC2 == "SD" and apresentouDefeitoC3 == "SD" and apresentouDefeitoC4 == "SD":     
      contSemManutencaoSemDefeito = contSemManutencaoSemDefeito +1
    else:
      contSemManutencaoComDefeito = contSemManutencaoComDefeito +1
      
      
contSemDefeito = contComManutencaoSemDefeito + contSemManutencaoSemDefeito
contComDefeito = contComManutencaoComDefeito + contSemManutencaoComDefeito

#ai
print("Probabilidade de apresentar defeito:", contComDefeito / nSamples)

#aii
print("Probabilidade de sem manutenção apresentar defeito:", contSemManutencaoComDefeito / contSemManutencao)

#aiii
print("Probabilidade de com manutenção apresentar defeito:", contComManutencaoComDefeito / contComManutencao)

#bi
print("Probabilidade de ter sido feita manutenção dado que apresentou o defeito C1:", contComManutencaoComDefeitoC1/(contComManutencaoComDefeitoC1 + contSemManutencaoComDefeitoC1))

#bii
print("Probabilidade de ter sido feita manutenção dado que apresentou o defeito C3:", contComManutencaoComDefeitoC3/(contComManutencaoComDefeitoC3 + contSemManutencaoComDefeitoC3))

# defeitos = c(C1,C2,C3,C4)
# probsSManutencao = c(0.4, 0.4, 0.6, 0.6)
# probsCManutencao = c(0.4, 0.4, 0.3, 0.3)
# nSamples = 1000000
# 
# equipamento = sample(defeitos, 1, prob=probsSManutencao)

