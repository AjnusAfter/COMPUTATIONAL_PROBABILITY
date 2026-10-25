#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Thu Oct 22 21:06:18 2026

@author: ajna
"""

# a) ( V ) Sejam 𝐴 e 𝐵 dois conjuntos, então, A U B = 𝐴̅ ∩ 𝐵̅.
# b) ( V ) Sejam 𝐴 e 𝐵 dois conjuntos, então, 𝐴 − 𝐵 = 𝐴 ∩ 𝐵̅ = { ∈ 𝑆 |  ∈ 𝐴 𝑒  ∉ 𝐵}
# c) ( F ) Se 𝐴 e 𝐵 são dois eventos de um espaço amostral 𝑆, então 𝑃(𝐴|𝐵) = 𝑃(𝐵|𝐴)𝑃(𝐵)/𝑃(𝐴)
# d) ( F ) Em uma empresa 22% dos funcionários sambem programar em R, 9% sabem programar em Python e 5% sabem programar em R e Python, logo, os eventos “sabem programar em R” e “sabem programar em Python” são independentes.
# e) ( V ) Em uma fábrica de parafusos, as máquinas A, B e C produzem 25%, 35% e 40% do total produzido e, da produção de cada uma, 5%, 4% e 2%, respectivamente, apresentam defeito. Se escolhemos ao acaso um parafuso desta fábrica, a probabilidade de ele ser defeituoso é 0,0345.        

pSerA = 0.25 
pSerB = 0.35
pSerC = 0.40

pDefeitoA = 0.05 
pDefeitoB = 0.04
pDefeitoC = 0.02

pDefeituoso = pSerA*pDefeitoA + pSerB*pDefeitoB + pSerC*pDefeitoC

print(f"a probabilidade de um parafuso escolhido ao acaso ser defeituoso é: {pDefeituoso}")