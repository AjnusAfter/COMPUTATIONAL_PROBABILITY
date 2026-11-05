# -*- coding: utf-8 -*-
"""
Created on Mon Oct 30 16:56:12 2026

@author: ajna
"""

import random

# P(A|B) = (P(B|A) * P(A)) / P(B)
def Bayes(pBA, pA, pB):
    return (pBA * pA) / pB

pSerAte30_A = 0.3
pSerAcima30_A = 0.7
pSerAte30_B = 0.5
pSerAcima30_B = 0.5

pSinistroAte30_A = 0.03    
pSinistroAcima30_A = 0.015
pSinistroAte30_B = 0.06
pSinistroAcima30_B = 0.04

pA = 0.6
pB = 0.4

nSamples = 1000000

pSinistro_C1 = pA * pSerAte30_A * pSinistroAte30_A
pSinistro_C2 = pA * pSerAcima30_A * pSinistroAcima30_A
pSinistro_C3 = pB * pSerAte30_B * pSinistroAte30_B
pSinistro_C4 = pB * pSerAcima30_B * pSinistroAcima30_B

pSinistro = pSinistro_C1 + pSinistro_C2 + pSinistro_C3 + pSinistro_C4

# A
plano = [""] * nSamples
faixa = [""] * nSamples
sinistro = [False] * nSamples

for i in range(nSamples):
    u = random.uniform(0, 1)    # sorteia o plano
    
    if u <= pA:
        plano[i] = "A"
    else:
        plano[i] = "B"
         
    u = random.uniform(0, 1)    # sorteia a faixa etária conforme plano
    
    if plano[i] == "A":
        if u <= pSerAte30_A:
            faixa[i] = "Até 30 anos"
        else:
            faixa[i] = "Acima de 30 anos"
    else:
        if u <= pSerAte30_B:
            faixa[i] = "Até 30 anos"
        else:
            faixa[i] = "Acima de 30 anos"
            
    u = random.uniform(0, 1)    # sorteia a ocorrência de Sinistro
    
    if plano[i] == "A" and faixa[i] == "Até 30 anos":
        sinistro[i] = u <= pSinistroAte30_A
        
    if plano[i] == "A" and faixa[i] == "Acima de 30 anos":
        sinistro[i] = u <= pSinistroAcima30_A
        
    if plano[i] == "B" and faixa[i] == "Até 30 anos":
        sinistro[i] = u <= pSinistroAte30_B
        
    if plano[i] == "B" and faixa[i] == "Acima de 30 anos":
        sinistro[i] = u <= pSinistroAcima30_B
        
    
# Contagens usadas nos denominadores
nSinistros = sum(sinistro)
print("nSinistros:", nSinistros)

nSinistrosAte30 = sum(
    faixa[i] == "Até 30 anos" and sinistro[i]
    for i in range(nSamples)
    )

print("Simulação:")

# A.1: P(B | Sinistro)
p1 = sum(
    plano[i] == "B" and sinistro[i]
    for i in range(nSamples)
    ) / nSinistros

print(f"P(B | Sinistro): {p1} ({p1*100:.2f}%)")

# A.2: P(Até 30 anos | Sinistro)
p2 = sum(
    faixa[i] == "Até 30 anos" and sinistro[i]
    for i in range(nSamples)
    ) / nSinistros

print(f"P(Até 30 anos | Sinistro): {p2} ({p2*100:.2f}%)")

# A.3: P(B | Sinistro e Até 30 anos)
p3 = sum(
    plano[i] == "B" and faixa[i] == "Até 30 anos" and sinistro[i]
    for i in range(nSamples)
    ) / nSinistrosAte30

print(f"P(B | Sinistro e Até 30 anos): {p3} ({p3*100:.2f}%)")

print("Analítico:") 

# B
pSinistroDadoB = pSerAte30_B * pSinistroAte30_B + pSerAcima30_B * pSinistroAcima30_B
pBDadoSinistro = Bayes(pSinistroDadoB, pB, pSinistro)
print(f"P(B | Sinistro): {pBDadoSinistro} ({pBDadoSinistro*100:.2f}%)")

pAte30Anos = pA * pSerAte30_A + pB * pSerAte30_B
pSinistroAte30 = pSinistro_C1 + pSinistro_C3 
pSinistroDadoAte30 = pSinistroAte30 / pAte30Anos
pAte30DadoSinistro = Bayes(pSinistroDadoAte30, pAte30Anos, pSinistro)
print(f"P(Até 30 anos | Sinistro): {pAte30DadoSinistro} ({pAte30DadoSinistro*100:.2f}%)")

pSinistroAte30 = pSinistro_C1 + pSinistro_C3
pSinistroAte30DadoB = pSerAte30_B * pSinistroAte30_B
pBDadoSinistroAte30 = Bayes(pSinistroAte30DadoB, pB,pSinistroAte30)
print(f"P(B | Sinistro e até 30 anos): {pBDadoSinistroAte30} ({pBDadoSinistroAte30*100:.2f}%)")
