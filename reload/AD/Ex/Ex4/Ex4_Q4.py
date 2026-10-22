#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Thu Oct 22 08:24:57 2026

@author: ajna
"""

import math

nEngenheiros = 7

# organizar TODOS:      Permutação
# mesa circular:        Permutação Circular
# permutação circular:  (PC)n = (n-1)! 

# caso 1: (...) B1 S B2 (...) OU
# caso 2: (...) B2 S B1 (...)

# 3 viram 1
new_nEngenheiros = nEngenheiros - 3 + 1

nManeirasDeOrganizar = math.factorial(new_nEngenheiros-1) * 2 # casos

print(f"Podemos organizar os {nEngenheiros} engenheiros ao redor da mesa com a condição citada de {nManeirasDeOrganizar} maneiras diferentes.")


