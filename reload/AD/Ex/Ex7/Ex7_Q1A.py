# -*- coding: utf-8 -*-
"""
Created on Mon Oct 30 16:56:12 2026

@author: ajna
"""

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

#A.1
pSinistroDadoB = pSerAte30_B * pSinistroAte30_B + pSerAcima30_B * pSinistroAcima30_B
pBDadoSinistro = Bayes(pSinistroDadoB, pB, pSinistro)
print("P(B | Sinistro):", pBDadoSinistro)

#A.2
pAte30Anos = pA * pSerAte30_A + pB * pSerAte30_B
pSinistroAte30 = pSinistro_C1 + pSinistro_C3 
pSinistroDadoAte30 = pSinistroAte30 / pAte30Anos
pAte30DadoSinistro = Bayes(pSinistroDadoAte30, pAte30Anos, pSinistro)
print("P(Até 30 anos | Sinistro):", pAte30DadoSinistro)

#A.3
pSinistroAte30_B = pSinistro_C3
print("P(B | Sinistro e até 30 anos):", Bayes(pSinistro_B, pB, pSinistro_Ate30))
