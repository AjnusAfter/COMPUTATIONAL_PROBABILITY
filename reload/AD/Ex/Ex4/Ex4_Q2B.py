#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Wed Oct 21 07:16:25 2026

@author: ajna
"""

#Q2
##########################
nServidores = 8
nServidoresEscolhidos = 3
nSistemasOperacionais = 3   # Linux, Windows, FreeBSD
##########################

# "cada servidor pode ter qualquer um dos 3 sistemas, independentemente dos outros"
# Cada servidor tem 3 opções independentes
# Total = 3 * 3 * 3 = 3^3

nFormasEscolherSistemaOperacional = nSistemasOperacionais ** nServidoresEscolhidos
print(f"É possível atribuir os sistemas operacionais de {nFormasEscolherSistemaOperacional} maneiras diferentes.")