#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Thu Sep 24 20:40:32 2026

@author: jn
"""

import random

def simulador (nRodadas, quantias, probabilidades):
    nJogadores = len(quantias)
    jogadores = range(nJogadores)
    quantiasFinais = quantias.copy()
    rodada = 0
    
    while ((rodada < nRodadas) and (min(quantiasFinais) > 0)):
        rodada+=1
        
        quantiasFinais = [valor-1 for valor in quantiasFinais]
        winner = random.choices(jogadores, weights=probabilidades, k=1)[0]
        quantiasFinais[winner] = quantiasFinais[winner] + nJogadores      # +1 p/ player
        
    return (quantiasFinais)

nRodadas = 1000
quantiasIniciais = [150, 70, 240]
probabilidadesVitoria = [0.3, 0.4, 0.3]

torneio = simulador(nRodadas, quantiasIniciais, probabilidadesVitoria)
            
print("Quantias finais:")
print("Maria = ", torneio[0])
print("Gustavo = ", torneio[1])
print("Jorge = ", torneio[2])


"""
M = 150
G = 70
J = 240
nRodadas = 1000

for i in range(nSamples):
    while (M >= 0 or G >= 0 or J >= 0):     # se tiver, pode apostar a última ficha
        M-=1
        G-=1
        J-=1
        
        winner = random.choices(["M", "G", "J"], weights=[0.3,0.4,0.3], k=1)[0]
        
        if winner == "M":
            M+=3
        elif winner == "G":
            G+=3
        else:
            J+=3

print("Maria: %f dólares", M)
print("Gustavo: %f dólares", G)
print("Jorge: %f dólares", J)
"""
    
    
    
    
    

