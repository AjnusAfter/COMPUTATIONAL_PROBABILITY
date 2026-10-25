#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Sat Oct 24 19:42:25 2026

@author: ajna
"""

import random

naoApresentam                          = 0.92
apresentam                             = 0.08

apresentam_avaliadasAsApresentam       = 0.95
apresentam_avaliadasAsNaoApresentam    = 0.05

naoApresentam_avaliadasAsApresentam    = 0.15
naoApresentam_avaliadasAsNaoApresentam = 0.85

nSamples = 10000

#A
nAvaliadasAsNaoApresentam = 0
nRealmenteNaoApresentam   = 0
#B
nAvaliadasAsApresentam    = 0
nRealmenteApresentam      = 0
for _ in range(nSamples):
    # sorteia sutuação real
    naoApresenta = (
        random.uniform(0,1) < naoApresentam
        )
    
    # sorteia avaliação do equipamento
    if naoApresenta:
        avaliadoAsNaoApresenta = (
            random.uniform(0,1) < naoApresentam_avaliadasAsNaoApresentam
            )
    
    else:
        avaliadoAsNaoApresenta = (
            random.uniform(0,1) < apresentam_avaliadasAsNaoApresentam
            )
        
    #A
    # mapeia (só) as malas avaliadas como não apresenta:
    if avaliadoAsNaoApresenta:
        nAvaliadasAsNaoApresentam+=1
        
        # destas mapeia (só) as malas que realmente não apresentam:
        if naoApresenta:
            nRealmenteNaoApresentam+=1
    
    #B
    # mapeia (só) as malas avaliadas como apresentam:
    else:
        nAvaliadasAsApresentam+=1
        
        # destas mapeia (só) as malas que realmente apresentam:
        if not naoApresenta:
            nRealmenteApresentam+=1

#A    
# evitando divisão por 0            
if nAvaliadasAsNaoApresentam > 0:
    probNao = nRealmenteNaoApresentam / nAvaliadasAsNaoApresentam
    
    print(f"P(realmente não apresenta | avaliada como não apresenta): {probNao:.4f} ({probNao*100:.2f}%)")
    
else:
    print("Nenhuma mala foi avaliada como não apresentando.")

#B    
# evitando divisão por 0            
if nAvaliadasAsApresentam > 0:
    probSim = nRealmenteApresentam / nAvaliadasAsApresentam
    
    print(f"\nP(realmente apresenta | avaliada como apresenta): {probSim:.4f} ({probSim*100:.2f}%)")
    
else:
    print("Nenhuma mala foi avaliada como apresentando.")
    
        
