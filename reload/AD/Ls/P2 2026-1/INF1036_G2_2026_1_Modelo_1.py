# -*- coding: utf-8 -*-

import numpy as np

np.random.seed(123)

# a)

# Número de dias simulados
n = 10000

# Geração de variáveis uniformes
U = np.random.uniform(0, 1, n)

# Geração da demanda diária (em milhares de unidades)
X = (8 * U) ** (1/3)

# Verificar em quantos dias a demanda excede o estoque disponível (1.1 mil unidades)
faltouProduto = X > 1.1

# Estimar a probabilidade de falta de produto
probabilidade = np.mean(faltouProduto)

print(f"Estimativa de P(X > 1.1): {probabilidade:.4f}") # 0.8298
   
# b), c) e d)

import numpy as np
import matplotlib.pyplot as plt

# Parâmetros
N = 30                      # número de dias
S_max = 2.1                 # estoque máximo (mil unidades)
R = 1.5                     # quantidade reposta diariamente (mil unidades)
estoque = 1.4               # estoque inicial (mil unidades)
custoProdutoEstocagem = 0.8 # custo de estocagem por unidade
custoProdutoNaoAtendido = 10 # custo de não atendimento por unidade

demandaTotal = 0
atendidaTotal = 0
diasFalta = 0
estoquesFinais = []
estoquesIniciais = []
demandas = []
atendimentos = []
naoAtendimentos = []

# Simulação para N dias
for _ in range(N):
        
    # Gerando demanda aleatória via método da inversa
    U = np.random.uniform()
    demanda = (8 * U) ** (1/3)

    estoquesIniciais.append(estoque) # No dia 1 é o estoque inicial
    
    # Registrando a demanda
    demandaTotal += demanda
    demandas.append(demanda) 
    
    # Verificando o atendimento
    falta = 0
    atendida = 0
    if (demanda <= estoque):
        atendida = demanda
    else:
        atendida = estoque
        falta = demanda - estoque
        diasFalta += 1

    atendimentos.append(atendida)    
    naoAtendimentos.append(falta)
    atendidaTotal += atendida
    
    # Atualizando o estoque
    estoque -= atendida
    estoque = min(estoque + R, S_max)
    
    estoquesFinais.append(estoque)

# Cálculos finais
taxaAtendimento = atendidaTotal / demandaTotal
estoqueMedio = np.mean(estoquesFinais)
estoquesIniciaisUnidade = np.array(estoquesIniciais) * 1000
custoEstocagem = sum(estoquesIniciaisUnidade) * custoProdutoEstocagem
naoAtendimentosUnidade = np.array(naoAtendimentos) * 1000
custoNaoAtendimento = sum(naoAtendimentosUnidade) * custoProdutoNaoAtendido
custoTotal = custoEstocagem + custoNaoAtendimento

# Resultados
print(f"Taxa média de atendimento: {taxaAtendimento:.4f}") # 0.9522
print(f"Dias com falta de produto: {diasFalta}") # 8
print(f"Estoque médio final do dia: {estoqueMedio:.3f} mil unidades") # 1.809 mil
print(f"Custo estocagem: R$ {custoEstocagem:.2f}")  # R$ 42866.24
print(f"Custo não atendimento: R$ {custoNaoAtendimento:.2f}") # R$ 20232.12
print(f"Custo total: R$ {custoTotal:.2f}") # R$ 63098.36

# Gráficos
x = np.linspace(1, 30, 30)   # N = 30 dias
y1 = estoquesFinais          # Primeira curva
y2 = demandas                # Segunda curva
y3 = atendimentos            # Terceira curva

# Criando o gráfico
plt.plot(x, y1, label='Estoque final do dia')
plt.plot(x, y2, label='Demanda diária')
plt.plot(x, y3, label='Atendimento diário')

# Adicionando legendas e título
plt.xlabel('Dias')
plt.ylabel('Quantidade (mil unidades)')
plt.title('Gráfico de acompanhamento')
plt.legend()
plt.grid(True)

# Gerando o gráfico
plt.show()



