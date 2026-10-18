#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Sun Oct 18 14:07:09 2026

@author: jn
"""

import random

#seed
random.seed(123)

#parâmetros
nSamples = 100000
areaTalhao = 100 * 100     # "1 hectare"
ladoTalhao = 100           # metros

#categorias
categorias = {"Ruim": 0, "Média": 0,"Boa": 0,"Excelente": 0}


def calculaArea(x1, y1, x2, y2, x3, y3):
    return (1/2) * (abs(x1*(y2-y3) + x2*(y3-y1) + x3*(y1-y2)))

# para cada simulação
for _ in range(nSamples):
    # sorteia coordenadas
    x1, y1 = random.uniform(0, ladoTalhao), random.uniform(0, ladoTalhao)
    x2, y2 = random.uniform(0, ladoTalhao), random.uniform(0, ladoTalhao)
    x3, y3 = random.uniform(0, ladoTalhao), random.uniform(0, ladoTalhao)
    
    #calcula a área
    area = calculaArea(x1, y1, x2, y2, x3, y3)
    
    # calcula a proporção
    proporcao = area / areaTalhao
    
    # avalia categoria da proporção
    if proporcao < 0.05:
        categorias["Ruim"]+=1
    elif proporcao < 0.10:
        categorias["Média"]+=1
    elif proporcao < 0.20:
        categorias["Boa"]+=1
    else:
        categorias["Excelente"]+=1

# para cada 'categoria: quantidade' no dicionário
for categoria, quantidade in categorias.items():
    # imprime 'Categoria: Quantidade (percentual)'
    percentual = (quantidade / nSamples) * 100
    print(f"{categoria}: {quantidade} ({percentual:.2f}%)")


