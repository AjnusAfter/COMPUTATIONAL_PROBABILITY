#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Thu Oct 22 09:20:21 2026

@author: ajna
"""

# devices's pabilities
pD1 = 0.9
pD2 = 0.9
pD3 = 0.9
pD4 = 0.95
pD5 = 0.95
pD6 = 0.99

circuit = {
    "block 1": [pD1, pD2, pD3],
    "block 2": [pD4, pD5],
    "block 3": [pD6],
    }

# para Circuito funcionar, os 3 blocos devem funcionar
# para Bloco funcionar, pelo menos um dos devices deve funcionar
# P(pelo menos um) funcionar = 1 - P(Nenhum)
# P(Nenhum) = 1-P(A) + 1-P(B) + 1-P(C) ...

pCircuito = 1 # elemento neutro para multiplicação
i = 1         # apenas para print
for block, pDevicesAtblock in circuit.items():
    pNenhumAtBlock = 1
    pPeloMenosUmAtBlock = 1

    for pDevice in pDevicesAtblock:
        pNenhumAtBlock *= 1 - pDevice
    print(f"¬P(block{i}) = {pNenhumAtBlock}")

    pPeloMenosUmAtBlock = 1 - pNenhumAtBlock
    print(f"P(block{i}) = {pPeloMenosUmAtBlock}\n")
     
    pCircuito *= pPeloMenosUmAtBlock
    i+=1
    
print(f"(multiplicando as probabilidades de cada bloco funcionar)\nP(circuito) = {pCircuito}" )
