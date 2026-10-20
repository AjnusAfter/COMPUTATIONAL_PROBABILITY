#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Thu Oct  8 09:04:51 2026

@author: jn
"""

import random
import numpy as np
import matplotlib.pyplot as plt

random.seed(123)

nEE = 25
nSE = 20
nCE = 15
nALI = 12
nAIE = 8

nSamples = 10000

PF_ajustadoTotal   = []
tempoSemanasTotal  = []
custoTotal         = []



for _ in range(nSamples):
    PF_naoAjustado = 0

    for _ in range(nEE):    
        entradasExternas            = random.choices([3,4,6], weights=[0.30,0.50,0.20], k=1)[0]    
        PF_naoAjustado+=entradasExternas
        
    for _ in range(nSE):
        saidasExternas              = random.choices([4,5,7], weights=[0.25,0.60,0.15], k=1)[0]
        PF_naoAjustado+=saidasExternas
        
    for _ in range(nCE):
        consultasExternas           = random.choices([3,4,6], weights=[0.40,0.40,0.20], k=1)[0]
        PF_naoAjustado+=consultasExternas
        
    for _ in range(nALI):
        arquivosLogicosInternos     = random.choices([7,10,15], weights=[0.20,0.50,0.30], k=1)[0]
        PF_naoAjustado+=arquivosLogicosInternos
        
    for _ in range(nAIE):
        arquivosDeInterfaceExterna  = random.choices([5,7,10], weights=[0.35,0.45,0.20], k=1)[0]
        PF_naoAjustado+=arquivosDeInterfaceExterna
    
    
        FA                     = random.choices([1.05,1.15,1.25], weights=[0.20,0.60,0.20], k=1)[0]
        produtividade_h_PF     = random.choices([4,5,6], weights=[0.20,0.60,0.20], k=1)[0]
        custoPorHora           = random.choices([80,100,120], weights=[0.20,0.60,0.20], k=1)[0]
        
        PF_ajustado            = PF_naoAjustado * FA
        
        tempoHoras             = PF_ajustado * produtividade_h_PF
        
        tempoSemanas           = tempoHoras / 40
        custo                  = tempoHoras  * custoPorHora
        
    PF_ajustadoTotal.append(PF_ajustado)
    tempoSemanasTotal.append(tempoSemanas)
    custoTotal.append(custo)

PF_ajustadoTotal  = np.array(PF_ajustadoTotal)
tempoSemanasTotal = np.array(tempoSemanasTotal)
custoTotal        = np.array(custoTotal)

#a) O valor médio esperado dos Pontos de Função Ajustados (PFA)
print("PF ajustado médio: %.2f" % (np.mean(PF_ajustadoTotal)))
#b) O tempo médio em semanas (40h/semana) para o desenvolvimento.
print("Tempo médio (semanas): %.2f" % (np.mean(tempoSemanasTotal)))
#c) O custo médio do sistema.
print("Custo Médio (R$): %.2f" % (np.mean(custoTotal)))
#d) A probabilidade de o custo ser menor que R$ 280.000,00.
print("Probabilidade custo < 280.000,00: %.2f" % (np.mean(custoTotal < 280000)))
#e) A probabilidade de o tempo ser menor que 60 semanas.
print("probabilidade tempo < 60: %.2f" % (np.mean(tempoSemanasTotal < 60)))
#f) Represente graficamente, por histogramas, as distribuições simuladas de Pontos de Função Ajustados , tempo (semanas) e custo (R$).
plt.figure(figsize=(15,4))

plt.subplot(1,3,1)
plt.hist(PF_ajustadoTotal, bins=30, edgecolor="black")
plt.title("Distribuição de Pontos de Função Ajustados")

plt.subplot(1,3,2)
plt.hist(tempoSemanasTotal, bins=30, edgecolor="black")
plt.title("Distribuição do Tempo (semanas)")

plt.subplot(1,3,3)
plt.hist(custoTotal, bins=30, edgecolor="black")
plt.title("Distribuição do Custo (R$)")

plt.tight_layout()
plt.show()

    
    
    
    
  
    

