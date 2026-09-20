# -*- coding: utf-8 -*-

# a)

totalCombinacoes = 2 * 6
print(totalCombinacoes)

# b)

import random

nsamples = 10000000
contB = 0

for i in range(nsamples):
  
  faceMoeda = random.choices(["CA","CO"], weights = [1/2, 1/2], k = 1)[0]
  faceDado = random.choices(["1","2","3","4","5","6"], weights = [1/6, 1/6, 1/6, 1/6, 1/6, 1/6], k = 1)[0]
  
  if ((faceMoeda == "CA") and (faceDado == "4")):
    contB = contB + 1
  
PB = contB / nsamples
print(PB)

# c)

import random

nsamples = 10000000
contC = 0

for i in range(nsamples):
  
  faceMoeda = random.choices(["CA","CO"], weights = [2/3, 1/3], k = 1)[0]
  faceDado = random.choices(["1","2","3","4","5","6"], weights = [1/6, 1/6, 1/6, 1/6, 1/6, 1/6], k = 1)[0]
  
  if ((faceMoeda == "CA") and (faceDado == "4")):
    contC = contC + 1
  
PC = contC / nsamples
print(PC)
