#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Wed Oct 21 18:17:19 2026

@author: ajna
"""

import math

#Q2
##########################
nServidores = 8
nServidoresEscolhidos = 3
nSistemasOperacionais = 3   # Linux, Windows, FreeBSD
##########################

# from A

# "escolher 3 servidores"                = escolher partes: arranjo ou combinação
# sem cargos ou posições específicas     = ordem não importa: combinação
# combinação                             = n! / (p!*(n-p)!)

combinacao = math.factorial(nServidores) // (math.factorial(nServidoresEscolhidos)*math.factorial(nServidores-nServidoresEscolhidos))

# from B

# "cada servidor pode ter qualquer um dos 3 sistemas, independentemente dos outros"
# Cada servidor tem 3 opções independentes
# Total = 3 * 3 * 3 = 3^3

nFormasEscolherSistemaOperacional = nSistemasOperacionais ** nServidoresEscolhidos

# C

# "número total de configurações possíveis: considerando tanto a escolha dos servidores quanto as atribuições de sistemas operacionais"

nEscolhaServidores = combinacao
nConfiguracoesPossiveis = nEscolhaServidores * nFormasEscolherSistemaOperacional

print(f"O número total é de {nConfiguracoesPossiveis} configurações possíveis.")