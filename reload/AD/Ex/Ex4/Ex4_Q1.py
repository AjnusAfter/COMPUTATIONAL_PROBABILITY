#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Wed Oct 21 05:47:58 2026

@author: ajna
"""

from fractions import Fraction

probLucas = Fraction(2,3)
probAna = Fraction(3,4)

# P(pelo menos um) = 1 - P(nenhum)

probNenhum = (1-probLucas) * (1-probAna)
print(f"P(nenhum corrigir) = {probNenhum} = {float(probNenhum):.2f} ({float(probNenhum*100):.2f}%)")

probPeloMenosUm = 1 - probNenhum
print(f"P(pelo menos um corrigir) = {probPeloMenosUm} = {float(probPeloMenosUm):.2f} ({float(probPeloMenosUm*100):.2f}%)")