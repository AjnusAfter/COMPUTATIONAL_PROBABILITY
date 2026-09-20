# -*- coding: utf-8 -*-

import random

nsamples = 100000
contA = 0
contB = 0
moeda = ["CA","CO"]

for i in range(nsamples):
  
  face1 = random.choices(moeda, weights = [2/5, 3/5], k = 1)[0]
  face2 = random.choices(moeda, weights = [2/5, 3/5], k = 1)[0]
  face3 = random.choices(moeda, weights = [2/5, 3/5], k = 1)[0]
  
  if (((face1 == "CA") and (face2 == "CO")) or ((face1 == "CO") and (face2 == "CA"))):
    contA = contA + 1
  
  if ((face2 == "CO") and (face3 == "CO")):
    contB = contB + 1

PA = contA / nsamples
print(PA)

PB = contB / nsamples
print(PB)

