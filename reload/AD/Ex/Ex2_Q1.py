#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Thu Oct  8 00:19:53 2026

@author: jn
"""

import random
import numpy as np
import matplotlib.pyplot as plt

random.seed(123)

PF_naoAjustado = 3500
#caracteristicasGerais  = [-1] * 14
#notas_low = 0
#notas_high = 5
#FA = 0.65 + 0.01 * sum(caracteristicasGerais)
#PF_ajustado = PF_naoAjustado * FA

#distribuiçãoDeDados = [(2, 0.20), (3, 0.60), (4, 0.20)]
#requisitosDeDesempenho = [(3, 0.10), (4, 0.70), (5, 0.20)]
#reusabilidade = [(1, 0.10), (2, 0.70), (3, 0.20)]
#complexidadeDeProcessamento = [(2, 0.10), (3, 0.60), (4, 0.20), (5, 0.10)]
#c1  = [(1, 0.20), (2, 0.60), (3, 0.20)]
#c2  = [(1, 0.20), (2, 0.60), (3, 0.20)]
#c3  = [(1, 0.20), (2, 0.60), (3, 0.20)]
#c4  = [(1, 0.20), (2, 0.60), (3, 0.20)]
#c5  = [(1, 0.20), (2, 0.60), (3, 0.20)]
#c6  = [(1, 0.20), (2, 0.60), (3, 0.20)]
#c7  = [(1, 0.20), (2, 0.60), (3, 0.20)]
#c8  = [(1, 0.20), (2, 0.60), (3, 0.20)]
#c9  = [(1, 0.20), (2, 0.60), (3, 0.20)]
#c10 = [(1, 0.20), (2, 0.60), (3, 0.20)]

#produtividade_h_PF = [(4, 0.20), (5, 0.70), (6, 0.10)]
#custoPorHora       = [(80, 0.20), (100, 0.60), (120, 0.20)]

nSamples = 10000

PF_ajustadoTotal   = []
tempoSemanasTotal  = []
custoTotal         = []


for _ in range(nSamples):
    distribuiçãoDeDados         = random.choices([2,3,4], weights=[0.20,0.60,0.20], k=1)[0]    
    requisitosDeDesempenho      = random.choices([3,4,5], weights=[0.10,0.70,0.20], k=1)[0]
    reusabilidade               = random.choices([1,2,3], weights=[0.10,0.70,0.20], k=1)[0]
    complexidadeDeProcessamento = random.choices([2,3,4,5], weights=[0.10,0.60,0.20,0.10], k=1)[0]
    
    # condensado/soma diretas das dez outras características
    outrasDezCaracteristicas = 0
    for _ in range(10):
        outrasDezCaracteristicas+= random.choices([1,2,3], weights=[0.20,0.60,0.20], k=1)[0]
        
    somaCaracteristicas    = distribuiçãoDeDados + requisitosDeDesempenho + reusabilidade + complexidadeDeProcessamento + outrasDezCaracteristicas
    FA                     = 0.65 + 0.01 * somaCaracteristicas
    PF_ajustado            = PF_naoAjustado * FA
    
    produtividade_h_PF     = random.choices([4,5,6], weights=[0.20,0.70,0.10], k=1)[0]
    custoPorHora           = random.choices([80,100,120], weights=[0.20,0.60,0.20], k=1)[0]
    
    tempoHoras             = PF_ajustado * produtividade_h_PF
    
    tempoSemanas           = tempoHoras / 40
    custo                  = tempoHoras  * custoPorHora
    
    PF_ajustadoTotal.append(PF_ajustado)
    tempoSemanasTotal.append(tempoSemanas)
    custoTotal.append(custo)
    
PF_ajustadoTotal  = np.array(PF_ajustadoTotal)
tempoSemanasTotal = np.array(tempoSemanasTotal)
custoTotal        = np.array(custoTotal)

#a) O valor médio esperado de 𝑃𝐹𝑎𝑗𝑢𝑠𝑡𝑎𝑑𝑜 .
print("PF ajustado médio: %.2f" % (np.mean(PF_ajustadoTotal)))
#b) O tempo médio em semanas (40h/semana) para o desenvolvimento.
print("Tempo médio (semanas): %.2f" % (np.mean(tempoSemanasTotal)))
#c) O custo médio do sistema.
print("Custo Médio (R$): %.2f" % (np.mean(custoTotal)))
#d) A probabilidade de o custo ser menor que R$ 1.500.000,00.
print("Probabilidade custo < 1.500.000,00: %.2f" % (np.mean(custoTotal < 1500000)))
#e) A probabilidade de o tempo ser menor que 450 semanas.
print("probabilidade tempo < 450: %.2f" % (np.mean(tempoSemanasTotal < 450)))
#f) Represente graficamente, por histogramas, as distribuições simuladas de 𝑃𝐹𝑎𝑗𝑢𝑠𝑡𝑎𝑑𝑜 , tempo (semanas) e custo (R$).
plt.figure(figsize=(15,4))

plt.subplot(1,3,1)
plt.hist(PF_ajustadoTotal, bins=30, edgecolor="black")
plt.title("Distribuição do PF ajustado")

plt.subplot(1,3,2)
plt.hist(tempoSemanasTotal, bins=30, edgecolor="black")
plt.title("Distribuição do Tempo (semanas)")

plt.subplot(1,3,3)
plt.hist(custoTotal, bins=30, edgecolor="black")
plt.title("Distribuição do Custo (R$)")

plt.tight_layout()
plt.show()
