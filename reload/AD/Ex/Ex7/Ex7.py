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

print(f"    : {p1} ({p1*100:.2f}%)")

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

# B
print("Analítico:") 

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


# C - comparação entre a carteira original e a alterada

def simularCarteiraAte30(pJovens_A, pJovens_B):
    nSinistros = 0
    nSinistrosB = 0
    nSinistrosAte30 = 0
    nSinistrosAte30_B = 0
    
    for _ in range(nSamples):
        
        # sorteia o plano
        if random.uniform(0, 1) <= pA:
            planoCliente = "A"
        else:
            planoCliente = "B"
        
        # sorteia a faixa etária conforme o plano
        u = random.uniform(0, 1)
        
        if planoCliente == "A":
            ehJovem = u <= pJovens_A
        else:
            ehJovem = u <= pJovens_B
            
        # define a probabilidade de sinistro
        if planoCliente == "A":
            if ehJovem:
                pSinistro = pSinistroAte30_A
            else:
                pSinistro = pSinistroAcima30_A
        else:
            if ehJovem:
                pSinistro = pSinistroAte30_A
            else:
                pSinistro = pSinistroAcima30_A
        
        # sorteia o sinistro
        teveSinistro = random.uniform(0, 1) < pSinistro
        
        # conta os eventos
        if teveSinistro:          
            nSinistros +=1
            
            if planoCliente == "B":
                nSinistrosB+=1
                
            if ehJovem:
                nSinistrosAte30+=1
                
                if planoCliente == "B":
                    nSinistrosAte30_B+=1
    
    return (
        nSinistros / nSamples,
        nSinistrosB / nSinistros,
        nSinistrosAte30 / nSinistros,
        nSinistrosAte30_B / nSinistrosAte30
        )

# carteira original
random.seed(42)
original = simularCarteiraAte30(pSerAte30_A, pSerAte30_B)

# carteira alterada (20%+ jovens)
alterada = simularCarteiraAte30(pSerAte30_A * 1.20, pSerAte30_B * 1.20)

nomes = [
    "P(Sinistro)",
    "P(B | Sinistro)",
    "P(Até 30 anos | Sinistro)",
    "P(B | Sinistro e até 30 anos)"
    ]

print("Impacto na alteração da carteira:")

for i in range(len(nomes)):
    diferenca = (alterada[i] - original[i]) * 100
    
    print(f"\n{nomes[i]}")
    print(f"  Original: {original[i]:.4f}")
    print(f"  Alterada: {alterada[i]:.4f}")
    print(f"  Diferença: {diferenca:+.2f}%")
    
            
        
    


