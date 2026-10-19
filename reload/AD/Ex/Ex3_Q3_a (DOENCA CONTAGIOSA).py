#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Sun Oct 18 16:20:32 2026

@author: jn
"""

import random

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

#4 parâmetros da enunciado (letra): 1
nDias = 365

#5 pré-parâmetros para o loop (respostas da questão): 3
maxInfectadas = SEIR["Exposto"] + SEIR["Infectado"]
contrairamDoenca = 0
diasComInfeccao = 0

#6 para cada dia
for _ in range(nDias):
    # 6.1 define pessoas infectadas
    infectadas = SEIR["Exposto"] + SEIR["Infectado"] 
    
    # 6.2 se houverem infectadas, dia pandêmico 
    if infectadas > 0:
        diasComInfeccao+=1
        
    # para cada pessoa
    #for _ in range(nSamples):
        
    # 6.3 para cada suscetível
    for _ in range(SEIR["Suscetível"]):
        # 6.3.1 sorteia quantidade de contatos com pessoas no dia
        contatosPorDia = random.choices([3,4,5], weights=[0.1,0.3,0.6], k=1)[0]
        
        # 6.3.1 calcula probabilidade do contato ser com uma pessoa infectada
        probContatoComPessoaInfectada = SEIR["Infectado"] / nSamples
        
        # 6.3.2 para cada contato 
        for _ in range(contatosPorDia):
            
            # 6.3.3 sorteia se contato com pessoa infectada, e se infecta
            if random.uniform(0,1) <= taxaTransmissao * probContatoComPessoaInfectada:
                    # 6.3.4 se sim, Suscetível vira Exposto     
                    SEIR["Suscetível"]  -=1
                    SEIR["Exposto"]     +=1
                    # 6.3.5 incrementa contador de contrairamDoença
                    contrairamDoenca    +=1
                    break;
                    
    # 6.4 para cada exposto                
    for _ in range(SEIR["Exposto"])   :
        
        # 6.4.1 sorteia se doença progride
        if random.uniform(0,1) <= taxaProgressao:
            
            # 6.3.4 se sim, Exposto vira Infectado     
            SEIR["Exposto"]             -=1
            SEIR["Infectado"]           +=1

    # 6.5 para cada infectado                         
    for _ in range(SEIR["Infectado"])   :
        
        # 6.5.1 sorteia se doença morre
        if random.uniform(0,1) <= taxaRecuperacao:
            
            # 6.3.4 se sim, Infectado vira Recuperado (imune)     
            SEIR["Infectado"]           -=1
            SEIR["Recuperado"]          +=1
    
    #7 atualiza total de infectadas
    infectadas = SEIR["Exposto"] + SEIR["Infectado"]
    #8 atualiza máximo total de infectadas
    maxInfectadas = max(maxInfectadas, infectadas)

#9 imprime respostas (pré-parâmetros do loop): 3
print("número máximo de pessoas infectadas simultaneamente:", maxInfectadas)       
print("total de pessoas que contraíram a doença:", contrairamDoenca)       
print(f"duração total da epidemia: {diasComInfeccao} dias")       