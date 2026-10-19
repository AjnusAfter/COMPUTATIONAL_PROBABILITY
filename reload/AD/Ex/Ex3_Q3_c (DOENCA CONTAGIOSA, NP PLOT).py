#!/usr/bin/env python3
#-*- coding: utf-8 -*-
"""
Created on Mon Oct 19 11:24:32 2026

@author: jn
"""

#0 importar bibliotecas
import random
import matplotlib.pyplot as plt
import numpy as np

#1 seed
random.seed(42)

#2 pessoas e cenários (samples)
nPessoas = 10000
nSamples = 100

#3 parâmetros do enunciado: 5 - 2(definição setada no loop) = 3
#SEIR = {"Suscetível": 9990, "Exposto": 0, "Infectado": 10, "Recuperado": 0}
taxaTransmissao  = 0.05   #"prob de S virar E ao entrar em contato com I"
taxaProgressao   = 0.2    #"prob de E virar I por dia"
taxaRecuperacao  = 0.1    #"prob de I virar R por dia"
#contatosPorDia   = random.choices([3,4,5], weights=[0.1,0.3,0.6], k=1)[0]

#4 parâmetros da enunciado (letra c): 1
nDias = 365

#5 armazenamento de histórico/pré-parâmetros para cálculo das médias e plot(respostas da questão): 3
vetorMaxInfectadas=[]
vetorContrairamDoenca=[]
vetorDiasComInfeccao=[]

#6 algoritmo demora pra rodar, feedback para o usuário
cenariosCount=0

#7 para cada cenário
for _ in range(nSamples):
    
    #8 pré-parâmetros para o loop (dicionário + respostas da questão): 4
    SEIR = {"Suscetível": 9990, "Exposto": 0, "Infectado": 10, "Recuperado": 0}
    maxInfectadas = SEIR["Exposto"] + SEIR["Infectado"]
    contrairamDoenca = 0
    diasComInfeccao = 0
    
    #9 para cada dia
    for _ in range(nDias):
        #10 define pessoas infectadas
        infectadas = SEIR["Exposto"] + SEIR["Infectado"] 
        
        #11 se houverem infectadas, dia pandêmico 
        if infectadas > 0:
            diasComInfeccao += 1
            
            
        #12 para cada suscetível
        for _ in range(SEIR["Suscetível"]):
            #13 sorteia quantidade de contatos com pessoas no dia
            contatosPorDia = random.choices([3,4,5], weights=[0.1,0.3,0.6], k=1)[0]
            
            #14 calcula probabilidade do contato ser com uma pessoa infectada
            probContatoComPessoaInfectada = SEIR["Infectado"] / nPessoas
            
            #15 para cada contato 
            for _ in range(contatosPorDia):
                
                #16 sorteia se contato com pessoa infectada (podia sortear com as outras também) e se infecta 
                if random.uniform(0,1) <= taxaTransmissao * probContatoComPessoaInfectada:
                        #17 se sim, Suscetível vira Exposto     
                        SEIR["Suscetível"]  -=1
                        SEIR["Exposto"]     +=1
                        #18 incrementa contador de contrairamDoença, e breca
                        contrairamDoenca    +=1
                        break;
                        
        #19 para cada exposto                
        for _ in range(SEIR["Exposto"])   :
            
            #20 sorteia se doença progride
            if random.uniform(0,1) <= taxaProgressao:
                
                #21 se sim, Exposto vira Infectado     
                SEIR["Exposto"]             -=1
                SEIR["Infectado"]           +=1
    
        #22 para cada infectado                         
        for _ in range(SEIR["Infectado"])   :
            
            #23 sorteia se doença morre
            if random.uniform(0,1) <= taxaRecuperacao:
                
                #24 se sim, Infectado vira Recuperado (imune)     
                SEIR["Infectado"]           -=1
                SEIR["Recuperado"]          +=1
        
        #25 atualiza total de infectadas
        infectadas = SEIR["Exposto"] + SEIR["Infectado"]
        #26 atualiza máximo total de infectadas
        maxInfectadas = max(maxInfectadas, infectadas)
        
    #27 armazena histórico dos itens que o enunciado pede: 3    
    vetorMaxInfectadas.append(maxInfectadas)
    vetorContrairamDoenca.append(contrairamDoenca)
    vetorDiasComInfeccao.append(diasComInfeccao)
        
    #28 incrementa e imprime cenário completo
    cenariosCount+=1
    print(f"Cenário {cenariosCount} completo.")


#29 calcula médias dos itens que o enunciado pede: 3    
mediaMaxInfectadas = np.mean(vetorMaxInfectadas)
mediaContrairamDoenca = np.mean(vetorContrairamDoenca)
mediaDiasComInfeccao = np.mean(vetorDiasComInfeccao)

#30 imprime respostas dos itens que o enunciado pede: 3    
print(f"\nMédia do número máximo de pessoas infectadas simultaneamente: {mediaMaxInfectadas:.2f}")
print(f"Média do total de pessoas que contraíram a doença: {mediaContrairamDoenca:.2f}")
print(f"Média da duração total da epidemia (dias com E+I > 1): {mediaDiasComInfeccao:.2f}")

#31 plota histograma de Número de Pessoas Infectadas (5 comandos)
plt.hist(vetorMaxInfectadas, bins=30, color = "orange", edgecolor = "black")
plt.title("Distribuição")
plt.xlabel("Número Máximo de Pessoas Infectadas")
plt.ylabel("Frequência")
plt.show()