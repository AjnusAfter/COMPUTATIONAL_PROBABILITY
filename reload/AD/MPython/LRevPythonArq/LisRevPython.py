# -*- coding: utf-8 -*-

# 1)
t = (10, 20, 30, 40)
nova_tupla = (t[1], t[0]) + t[2:]
print(nova_tupla)  # (20, 10, 30, 40)

# Tuplas são imutáveis, então você precisa criar uma nova. Aqui pegamos t[1] (20) e t[0] (10), e depois acrescentamos o restante da tupla t[2:].

# 2)
nums = [1, 2, 2, 3, 4, 4, 5]
sem_duplicatas = list(set(nums))
print(sem_duplicatas)  # [1, 2, 3, 4, 5]

# set() remove duplicatas automaticamente. Depois convertemos de volta para list. A ordem pode mudar, pois set não mantém a ordem original.

# 3)
quadrados_pares = [x**2 for x in range(11) if x % 2 == 0]
print(quadrados_pares)  # [0, 4, 16, 36, 64, 100]

# A compreensão de listas permite aplicar uma operação (x**2) com uma condição (if x % 2 == 0) em uma linha só.

# 4)
pares = [('a', 1), ('b', 2), ('c', 3)]
d = dict(pares)
print(d)  # {'a': 1, 'b': 2, 'c': 3}

# A função dict() aceita uma lista de tuplas, onde cada tupla tem 2 elementos (chave, valor).

# 5)
a = {1, 2, 3, 4}
b = {3, 4, 5, 6}
intersecao = a & b
print(intersecao)  # {3, 4}

# O operador & retorna a interseção entre dois conjuntos, ou seja, os elementos comuns.

# 6)
palavras = ['sol', 'lua', 'marte', 'terra']
filtradas = [p for p in palavras if len(p) > 3]
print(filtradas)  # ['marte', 'terra']

# A compreensão de listas permite aplicar a condição len(p) > 3 para filtrar os itens da lista original.

# 7)
l1 = [1, 2, 3]
l2 = [3, 4, 5]
unica = list(set(l1 + l2))
print(unica)  # [1, 2, 3, 4, 5]

# Somamos as listas e usamos set para eliminar duplicatas, depois convertendo novamente em lista.

# 8)
dados = [(1, 'a'), (2, 'b'), (3, 'c')]
invertidas = [(valor, chave) for chave, valor in dados]
print(invertidas)  # [('a', 1), ('b', 2), ('c', 3)]

# A compreensão de listas permite reorganizar os pares da tupla trocando a ordem.

# 9)
itens = [1, 2, 2, 3, 4, 4, 4, 5]
unicos = [x for x in set(itens) if itens.count(x) == 1]
print(unicos)  # [1, 3, 5]

# Usamos set para iterar pelos elementos únicos e count() para verificar se aparece só uma vez.

# 10)
resultado = [(n, n**2) for n in range(6)]
print(resultado)  # [(0, 0), (1, 1), ..., (5, 25)]

# A compreensão de listas permite criar tuplas em cada iteração.

# 11)
nums = [1, 4, -3, 9]
tem_negativo = any(n < 0 for n in nums)
print(tem_negativo)  # True

# any() retorna True se pelo menos um elemento do iterável for verdadeiro. A expressão n < 0 retorna True apenas para -3.

# 12)
nums = [2, 4, 6, 8]
todos_pares = all(n % 2 == 0 for n in nums)
print(todos_pares)  # True

# all() retorna True se todos os elementos forem verdadeiros.

# 13)
nums = [1, 2, 3, 4]
quadrados = list(map(lambda x: x**2, nums))
print(quadrados)  # [1, 4, 9, 16]

# map() aplica a função lambda x: x**2 a cada elemento da lista.

# 14)
nums = [1, 2, 3, 4, 5]
impares = list(filter(lambda x: x % 2 != 0, nums))
print(impares)  # [1, 3, 5]

# filter() aplica a função que retorna True apenas para números ímpares.

# 15)
from functools import reduce

nums = [1, 2, 3, 4]
soma = reduce(lambda x, y: x + y, nums)
print(soma)  # 10

# reduce() aplica a função acumuladora x + y da esquerda para a direita.

# 16)
nomes = ['Ana', 'Bruno', 'Carlos']
idades = [22, 35, 41]
combinado = list(zip(nomes, idades))
print(combinado)  # [('Ana', 22), ('Bruno', 35), ('Carlos', 41)]

# zip() combina os elementos correspondentes das duas listas em tuplas.

# 17)
nomes = ['Ana', 'Bruno', 'Carlos']
todos_maiuscula = all(nome[0].isupper() for nome in nomes)
print(todos_maiuscula)  # True

# all() verifica se a primeira letra de cada nome é maiúscula usando isupper().

# 18)
palavras = ['python', 'é', 'legal']
tamanhos = list(map(len, palavras))
print(tamanhos)  # [6, 1, 5]

# A função len é aplicada a cada string da lista.

# 19)
from functools import reduce

nums = [1, 2, 3, 4, 5, 6]
pares = filter(lambda x: x % 2 == 0, nums)
soma_pares = reduce(lambda x, y: x + y, pares)
print(soma_pares)  # 12

# filter seleciona apenas os pares
# reduce soma todos eles

# 20)
nomes = ['João', 'Maria']
idades = [30, 25]
frases = [f"{nome} tem {idade} anos" for nome, idade in zip(nomes, idades)]
print(frases)  # ['João tem 30 anos', 'Maria tem 25 anos']

# zip junta os pares nome/idade, e a compreensão de lista formata a string para cada tupla.

# 21)
precos = [100, 200, 300, 400]
precos_com_desconto = []

for i, preco in enumerate(precos):
    desconto = 0.05 * (i + 1)
    preco_descontado = preco * (1 - desconto)
    precos_com_desconto.append(round(preco_descontado, 2))

print(precos_com_desconto) # [95.0, 180.0, 255.0, 340.0]

# enumerate traz o índice para calcular o desconto progressivo, e o preço é ajustado multiplicando pela taxa (1 - desconto). round é usado para deixar os valores com duas casas decimais.

# 22)
def selecionaPalavra(lista):
    return(list(filter(lambda palavra: palavra[0].lower() in 'aeiou', lista)))

lista = ['uva', 'abacaxi', 'banana', 'figo', 'damasco', 'amora']

listaSelecionada = list(selecionaPalavra(lista))
print(listaSelecionada)

# 23)
def selecionaFrase(lista, palavra, quantidade):
    return (list(filter(lambda frase: frase.lower().count(palavra) >= quantidade, lista)))

frase = [
'Sou muito jovem para ter um carro',
'Carro de bombeiro e carro de polícia, todos estavam presentes.',
'O carro azul era mais bonito que o carro verde, mas preferi o carro branco.',
'Nenhuma bicicleta está quebrada.',
]

palavra = 'carro'
quantidade = 2

fraseSelecionada = selecionaFrase(frase, palavra, quantidade)
print(fraseSelecionada)

# 24)

carteira = [
    {'codigo': 'ELET5', 'investimento': 3000, 'retorno': 3500},
    {'codigo': 'USIM4', 'investimento': 500, 'retorno': 300},
    {'codigo': 'VALE8', 'investimento': 100, 'retorno': 130},
    {'codigo': 'BVCA9', 'investimento': 1000, 'retorno': 1050}    
]

# a)
def selecionaCodigo(carteira):
    return(list(map(lambda x: x['codigo'] , carteira)))

print(selecionaCodigo(carteira))

# b)
def calculaTaxa(carteira):
    return(list(map(lambda x: round((x['retorno'] - x['investimento']) / x['investimento'], 2) , carteira)))

print(calculaTaxa(carteira))

# c)
def selecionaAcaoInvestimento(carteira, investimento):
    return(list(filter(lambda x: x['investimento'] > investimento, carteira)))

investimento = 700

print(selecionaAcaoInvestimento(carteira, investimento))

# d)
def selecionaAcao(carteira, taxa):
    return(list(filter(lambda x: (x['retorno'] - x['investimento']) / x['investimento'] > taxa , carteira)))

taxa = 0.1

print(selecionaAcao(carteira, taxa))

# e)
from functools import reduce

def calculaRetorno(carteira):
    investimento = list(map(lambda x: x['investimento'] , carteira))
    return(reduce(lambda x, y: x + y, investimento))

print(calculaRetorno(carteira))

# f)
# Uso de f-strings.
resumo = [
    f"{acao['codigo']}: {'+' if taxa >= 0 else ''}{round(taxa * 100, 1)}%"
    for acao in carteira # Itera sobre cada dicionário da lista carteira.
    for taxa in [ (acao['retorno'] - acao['investimento']) / acao['investimento'] ] # Calcula a taxa de retorno e a associa a uma variável (taxa).
]

print(resumo)

