#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Sat Sep 19 04:13:59 2026

@author: jn
"""

#1
t = (10,20,30,40)
new_t= (t[1], t[0]) + t[2:]
print(new_t)

#2
nums=[1,2,2,3,4,4,5]
nums_set= set(nums)
print(nums_set)

#3
lista=[]
for i in range(0,11,2):
    lista.append(i**2)
    
print(lista)

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
# ou intersect = a & b
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
new_dados = [(valor, chave) for (chave, valor) in dados]
print(new_dados)

#9
itens = [1, 2, 2, 3, 4, 4, 4, 5]
unique_itens = [item for item in set(itens) if itens.count(item) == 1]
print(unique_itens)

#10
tuplas = [(n, n**2) for n in range(0,6)]
print(tuplas)

#11
nums = [1, 4, -3, 9]

for num in nums:
    if num < 0:
        print(str(num) + " é negativo.")
        
"""
tem_negativo = any(n < 0 for n in nums)
print(tem_negativo)  # True
"""

#12
nums = [2, 4, 6, 8]

"""
if any(num % 2 !=0 for num in nums):
     print("Nem todos os números são pares.")
else:
    print("Todos os números são pares.")
"""

print("Nem t" if any(num % 2 for num in nums) else "T", end="")
print("odos os números são pares.")

"""
todos_pares = all(n % 2 == 0 for n in nums)
print(todos_pares)  # True
"""

#13
nums = [1, 2, 3, 4]

def nova_lista(lista):
    nova_lista=[num**2 for num in lista]
    
    return nova_lista

print(nova_lista(nums))

"""
quadrados = list(map(lambda x: x**2, nums))
print(quadrados)  # [1, 4, 9, 16]

# map() aplica a função lambda x: x**2 a cada elemento da lista.
"""

#14
nums = [1, 2, 3, 4, 5]

impares = list(filter(lambda num : num % 2!= 0, nums))
print(impares)

#15
from functools import reduce
nums = [1, 2, 3, 4]

soma = reduce(lambda acc, x: acc + x, nums)
print(soma)

#16
nomes = ['Ana', 'Bruno', 'Carlos']
idades = [22, 35, 41]

nome_idades = list(zip(nomes, idades))
print(nome_idades)

#17
nomes = ['Ana', 'Bruno', 'Carlos']
todos_maiuscula = all(nome[0].isupper() for nome in nomes)

print(todos_maiuscula) # True

#18
palavras = ['python', 'é', 'legal']

comprimento = [len(palavra) for palavra in palavras]
print(comprimento)

"""
tamanhos = list(map(len, palavras))
print(tamanhos)  # [6, 1, 5]
"""

#19
from functools import reduce
nums = [1, 2, 3, 4, 5, 6]

pares = filter(lambda num: num % 2 == 0, nums)
soma_pares = reduce(lambda acc, x: acc + x, pares)
print(soma_pares)

#20
nomes = ['João', 'Maria']
idades = [30, 25]

frases = [f"{nome} tem {idade} anos." for nome, idade in zip(nomes, idades)]
print(frases)

#21
precos = [100, 200, 300, 400]
#precos_com_desconto=[]
precos_com_desconto2=[preco * (1 - 0.05) * (i + 1) for i,preco in enumerate(precos)]

"""
for i, preco in enumerate(precos):
    desconto = 0.05 * (i+1)
    preco_descontado = (1-desconto) * preco
    precos_com_desconto.append(round(preco_descontado,2))

print(precos_com_desconto)
"""

print(precos_com_desconto2)

#22
def selecionaPalavra(palavras):
   return (list(filter(lambda palavra: palavra[0].lower() in 'aeiou', palavras)))

frutas = lista = ['uva', 'abacaxi', 'banana', 'figo', 'damasco', 'amora']

print(selecionaPalavra(frutas))

#23
def selecionaFrase(frases, palavra, valor):    
    return (list(filter(lambda frase: frase.lower().count(palavra) >= valor, frases)))

frases = [
    'Sou noob demais para enfrentar um Boss de Raide.',
    'O Guerreiro e o Mago estavam prontos para a missão.',
    'O jogador encontrou uma Espada rara, mas trocou a Espada Lendária por Ouro.',
    'Nenhum Item está quebrado, só a Espada das Espadas.',
]

palavra = 'espada' #funciona com EspadaS
quantidade = 2

print(selecionaFrase(frases, palavra, quantidade))


#24
carteira = [
    {'codigo': 'ELET5', 'investimento': 3000, 'retorno': 3500},
    {'codigo': 'USIM4', 'investimento': 500, 'retorno': 300},
    {'codigo': 'VALE8', 'investimento': 100, 'retorno': 130},
    {'codigo': 'BVCA9', 'investimento': 1000, 'retorno': 1050}    
    ]

#24a
def selecionaCodigo(carteira):
    return (list(map(lambda x: x['codigo'], carteira)))

print(selecionaCodigo(carteira))

#24b
def calculaTaxa(carteira):
    return (list(map(lambda x: round((x['retorno'] - x['investimento']) / x['investimento'], 2), carteira)))
    
print(calculaTaxa(carteira))

#24c
def selecionaAcaoInvestimento(carteira, investimento):
    return (list(filter(lambda x: x['investimento'] > investimento, carteira)))

investimento = 700
    
print(selecionaAcaoInvestimento(carteira, investimento))

#24d
def selecionaAcaoTaxa(carteira, valor):
    return (list(filter(lambda x: (x['retorno'] - x['investimento']) / x['investimento'] > valor, carteira)))

taxa = 0.1

print(selecionaAcaoTaxa(carteira, taxa))

#24e
def calculaRetorno(carteira):
    investimento = list(map(lambda x: x['investimento'], carteira))
    return (reduce(lambda acc, x: acc + x, investimento))

print(calculaRetorno(carteira))

#24f
resumo=[
    f"{acao['codigo']}: {'+' if taxa >= 0 else ''}{round(taxa * 100, 1)}%"
    for acao in carteira
    for taxa in [(acao['retorno'] - acao['investimento']) / acao['investimento']]
    ]

print(resumo)

