#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Wed Oct 21 06:40:44 2026

@author: ajna
"""

import math

#Q2
##########################
nServidores = 8
nServidoresEscolhidos = 3
nSistemasOperacionais = 3   # Linux, Windows, FreeBSD
##########################

# "escolher 3 servidores"                = escolher partes: arranjo ou combinação
# sem cargos ou posições específicas     = ordem não importa: combinação
# combinação                             = n! / (p!*(n-p)!)

combinacao = math.factorial(nServidores) // (math.factorial(nServidoresEscolhidos)*math.factorial(nServidores-nServidoresEscolhidos))
print(f"É possível escolher os {nServidoresEscolhidos} servidores para a tarefa de {combinacao} formas diferentes.")


