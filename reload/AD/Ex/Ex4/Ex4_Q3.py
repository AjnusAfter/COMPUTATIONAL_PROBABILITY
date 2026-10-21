#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Wed Oct 21 18:34:15 2026

@author: ajna
"""

import math

nProgramadores = 7
nEngenheiras   = 4 
nPessoasEscolhidas = 6
nPessoasEngenheiras = list(range(2, nEngenheiras+1))

def combinacao (n, p):
    return math.factorial(n) // (math.factorial(p) * math.factorial(n-p))

nFormasGrupo = 0
for p in nPessoasEngenheiras:
    nFormasGrupo += combinacao(nEngenheiras, p) * combinacao(nProgramadores, nPessoasEscolhidas - p)
    print(f"Para {p} engenheiras e {nPessoasEscolhidas - p} programadores: C({nEngenheiras},{p}) * C({nProgramadores},{nPessoasEscolhidas - p}) = {combinacao(nEngenheiras, p) * combinacao(nProgramadores, nPessoasEscolhidas - p)}")
    
print(f"\nSomando:\nPodemos escolher o grupo, garantindo que haja pelo menos duas engenheiras na equipe de {nFormasGrupo} formas diferentes.")
    
