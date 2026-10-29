#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Mon Oct 26 23:47:59 2026

@author: ajna
"""

import numpy as np
import random

random.seed(123)    

nSamples    = 1000
totalHoras  = 720
a           = 0.0005
b           = 0.004

listaSubstituicoes = []     # para a: média de substituições
listaCustos = []            # para b: custo médio por simulação
totalFalhasInesperadas = 0

for _ in range(nSamples):
    vidaRestante = 1.0
    substituicoes = 0
    custoTotal = 0

    for _ in range(totalHoras):
        # verificar falha total inesperada
        pFalhaTotalInesperada = a + b*(1-vidaRestante) 
        
        if random.uniform(0, 1) < pFalhaTotalInesperada:
            substituicoes +=1
            totalFalhasInesperadas+=1
            custoTotal +=2000
            vidaRestante = 1.0      # reset
            continue
        
        # sorteia desgaste
        u = random.uniform(0, 1)
        
        if u < 0.70:
            reducao = 0.01
            custoSubstituicao = 300
        elif u < 0.90:
            reducao = 0.03
            custoSubstituicao = 400
        else:
            reducao = 0.06
            custoSubstituicao = 800
            
        # aplica desgaste
        vidaRestante-=reducao
        
        # precisa substituir por desgaste?
        if vidaRestante <= 0:
            substituicoes +=1
            custoTotal += custoSubstituicao
            vidaRestante = 1.0      # reset
        
    listaSubstituicoes.append(substituicoes)
    listaCustos.append(custoTotal)
    
#mediaSubstituicoes = sum(listaSubstituicoes) / nSamples
#custoMedio = sum(listaCustos) / nSamples
mediaFalhasInesperadas = totalFalhasInesperadas / nSamples
    
print("Média de substituições por simulação:", np.mean(listaSubstituicoes))
print("Custo médio total por simulação: R$", np.mean(listaCustos))
print("Número médio de falhas totais aleatórias:", mediaFalhasInesperadas)
    