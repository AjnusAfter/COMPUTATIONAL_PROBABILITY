#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Sun Oct 18 20:06:47 2026

@author: jn
"""

import random
import matplotlib.pyplot as plt

#1 seed
random.seed(42)

#2 samples
nSamples = 10000

#3 parâmetros do enunciado: 5 - 1(definição sorteada no loop) = 4
SEIR = {"Suscetível": 9990, "Exposto": 0, "Infectado": 10, "Recuperado": 0}
taxaTransmissao  = 0.05   # "prob de S virar E ao entrar em contato com I"
taxaProgressao   = 0.2    # "prob de E virar I por dia"
taxaRecuperacao  = 0.1    # "prob de I virar R por dia"
#contatosPorDia   = random.choices([3,4,5], weights=[0.1,0.3,0.6], k=1)[0]

#4 parâmetros da enunciado (letra a): 1
nDias = 365

#5 armazenamento de histórico/pré-parâmetros para o loop (respostas da questão): 4
vetorS=[]
vetorE=[]
vetorI=[]
vetorR=[]

#6 para cada dia
for _ in range(nDias):
        
    # 6.1 para cada suscetível
    for _ in range(SEIR["Suscetível"]):
        # 6.1.1 sorteia quantidade de contatos com pessoas no dia
        contatosPorDia = random.choices([3,4,5], weights=[0.1,0.3,0.6], k=1)[0]
        
        # 6.1.2 calcula probabilidade do contato ser com uma pessoa infectada
        probContatoComPessoaInfectada = SEIR["Infectado"] / nSamples
        
        # 6.1.3 para cada contato 
        for _ in range(contatosPorDia):
            
            # 6.1.3.1 sorteia se contato com pessoa infectada, e se infecta
            if random.uniform(0,1) <= taxaTransmissao * probContatoComPessoaInfectada:
                # 6.1.3.1.1 se sim, Suscetível vira Exposto     
                SEIR["Suscetível"]  -=1
                SEIR["Exposto"]     +=1
                    
    # 6.2 para cada exposto                
    for _ in range(SEIR["Exposto"])   :
        
        # 6.2.1 sorteia se doença progride
        if random.uniform(0,1) <= taxaProgressao:
            
            # 6.2.1.1 se sim, Exposto vira Infectado     
            SEIR["Exposto"]             -=1
            SEIR["Infectado"]           +=1

    # 6.3 para cada infectado                         
    for _ in range(SEIR["Infectado"])   :
        
        # 6.3.1 sorteia se doença morre
        if random.uniform(0,1) <= taxaRecuperacao:
            
            # 6.3.1.1 se sim, Infectado vira Recuperado (imune)     
            SEIR["Infectado"]           -=1
            SEIR["Recuperado"]          +=1
    
    # 6.4 armazena histórico
    vetorS.append(SEIR["Suscetível"])
    vetorE.append(SEIR["Exposto"])
    vetorI.append(SEIR["Infectado"])
    vetorR.append(SEIR["Recuperado"])

#7 parametriza plot das respostas (pré-parâmetros do loop): 4

plt.plot(range(nDias), vetorS, label="Suscetíveis (S)")
plt.plot(range(nDias), vetorE, label="Expostos (E)")
plt.plot(range(nDias), vetorI, label="Infectados (I)")
plt.plot(range(nDias), vetorR, label="Recuperados (R)")

#8 ativa legendas
plt.legend()

#9 ativa título e nome dos eixos
plt.title("Evolução da Pandemia")
plt.xlabel("Dias")
plt.ylabel("Número de Pessoas")

#10 ativa grid
plt.grid(True)

#11 plota
plt.show()