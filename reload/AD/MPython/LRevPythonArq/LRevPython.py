#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Sat Sep 19 04:13:59 2026

@author: jn
"""

#1
t = (10,20,30,40)
new_t= (t[1], t[0], t[2], t[3])
print(new_t)

#2
nums=[1,2,2,3,4,4,5]
nums_set= set(nums)
print(nums_set)

#3
list=[]
for i in range(0,11,2):
    list.append(i**2)
    
print(list)

#4
pares=[('a',1),('b',2),('c',3)]
#pares_t=('a',1),('b',2),('c',3)
d=dict(pares)
#d2=dict(pares_t)
print(d)
#print(d2)

#5
a = {1, 2, 3, 4}
b = {3, 4, 5, 6}
intersect = a.intersection(b)
print(intersect)

#6
palavras = ['sol', 'lua', 'marte', 'terra']
nova_lista = [palavra for palavra in palavras if len(palavra) > 3]
"""for palavra in palavras:
    if len(palavra) > 3:
        nova_lista.append(palavra)"""
        
print(nova_lista)

#7
l1 = [1, 2, 3]
l2 = [3, 4, 5]
uniao = set(l1 + l2)
print(uniao)

#8
dados = [(1, 'a'), (2, 'b'), (3, 'c')]
new_dados = [dados[2], dados[1], dados[0]]
print(new_dados)

#9
itens = [1, 2, 2, 3, 4, 4, 4, 5]
unique_itens = [item for item in itens if itens.count(item) == 1]
print(unique_itens)

#10
tuplas = [(n, n**2) for n in range(0,6)]
print(tuplas)

#11
nums = [1, 4, -3, 9]

for num in nums:
    if num < 0:
        print(str(num) + " é negativo")

#12


#13


#14


#15


#16


#17


#18


#19


#20


#21


#22


#23


#24


#24a


#24b


#24c


#24d


#24e


#24f
