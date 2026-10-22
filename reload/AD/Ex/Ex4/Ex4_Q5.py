#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Thu Oct 22 08:44:08 2026

@author: ajna
"""

import math

nScripts = 5

# "ordem":          permutação ou arranjo
# ordena os totais: deve ser permutação
# permutação:       P(n) = n!

nFormasExecucao = math.factorial(nScripts)

print(f"Para executar os {nScripts} scripts ordenados existem {nFormasExecucao} formas diferentes.")

# "# script1 e script2 devem sempre estar juntos (um seguido do outro) em qualquer ordem"
# 2 viram 1
nFormasExecucao = math.factorial(nScripts - 2 + 1)

# caso 1: (...) S1 S2 (...) OU
# caso 2: (...) S2 S1 (...) 

nFormasExecucao *=2

print(f"\nPara executar os {nScripts} scripts ordenados com a restrição dada existem agora {nFormasExecucao} formas diferentes.")

