#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Sat Oct 24 21:17:26 2026

@author: jn
"""

import random
import math

ladoQuadradao   = 1
ladoQuadradinho = 0.5
r1              = 1
altura          = 6
custo           = 250

nSamples        = 10000

def dist_origem(x, y):
    return math.sqrt((x-0)**2 + (y-0)**2)

countCaiuDentro = 0
for _ in range(nSamples):
    x = random.uniform(0, 1)
    y = random.uniform(0, 1)
    
    if (dist_origem(x, y) > r1 and x >= (ladoQuadradao-ladoQuadradinho)):
        countCaiuDentro+=1

probAreaCinza = countCaiuDentro / nSamples
areaCinza = probAreaCinza * ladoQuadradao**2
gasto = areaCinza * altura * custo

print(f"O valor estimado do gasto do engenheiro será de R$ {gasto:.2f}")