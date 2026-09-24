#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Thu Sep 24 20:00:29 2026

@author: jn
"""

import random
import math

raio1 = 1
raio2 = 1
nSamples = 1000000
contDentroAreaCultivada = 0

for i in range(nSamples):
    x = random.random()
    y = random.random()
    
    distancia1 = math.sqrt((x-0)**2 + (y-0)**2)
    distancia2 = math.sqrt((x-1)**2 + (y-1)**2)
    
    if distancia1 <= raio1 and distancia2 <= raio2:
        contDentroAreaCultivada+=1 
        
proporcaoDentroAreaCultivada = contDentroAreaCultivada / nSamples
areaTotal = 1
areaCultivada = proporcaoDentroAreaCultivada * areaTotal
aduboPorQuilometro = 200
numeroMeses = 12
quantidadeAdubo = areaCultivada * aduboPorQuilometro * numeroMeses

print('Quantidade (kg) = ', quantidadeAdubo)


        