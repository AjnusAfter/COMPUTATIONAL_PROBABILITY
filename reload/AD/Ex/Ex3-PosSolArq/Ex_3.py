# -*- coding: utf-8 -*-

#######################
# 3)
######################

import random
import numpy as np
import matplotlib.pyplot as plt

def simulaEpidemia (populacao = 10000, infectadosIniciais = 10, 
                           taxaT = 0.05, taxaP = 0.2, taxaR = 0.1,
                           dias = 365):
  
  S = populacao - infectadosIniciais
  E = 0
  I = infectadosIniciais
  R = 0  
  
  # Vetores para armazenar histórico
  vetorS = []
  vetorE = []
  vetorI = []
  vetorR = []
  
  for dia in range(dias): 
    
    S_para_E = 0
    E_para_I = 0
    I_para_R = 0
    
    for pS in range(S):
      contatos = random.choices([3, 4, 5], weights = [0.1, 0.3, 0.6], k = 1)[0]
      for contato in range(contatos):
        contatoI = random.choices(["S", "E", "I", "R"], weights = [S/populacao, E/populacao, I/populacao, R/populacao], k = 1)[0]
        if (contatoI == "I"):
          exposto = random.choices([True, False], weights = [taxaT, 1 - taxaT], k = 1)[0]
          if (exposto):
            S_para_E = S_para_E + 1
            break

    for pE in range(E):
       infectado = random.choices([True, False], weights = [taxaP, 1 - taxaP], k = 1)[0]
       if (infectado):
          E_para_I = E_para_I + 1

    for pI in range(I):
        recuperado = random.choices([True, False], weights = [taxaR, 1 - taxaR], k = 1)[0]
        if (recuperado):
          I_para_R = I_para_R + 1

    # Atualiza situações
    S = S - S_para_E
    E = E + S_para_E - E_para_I
    I = I + E_para_I - I_para_R
    R = R + I_para_R
    
    # Armazena histórico
    vetorS.append(S)
    vetorE.append(E)
    vetorI.append(I)
    vetorR.append(R)   
  
  return([vetorS, vetorE, vetorI, vetorR])

#a)

random.seed(42)

populacao = 10000

simulacao = simulaEpidemia()
maximoPessoasInfectadas = max(simulacao[2])
totalPessoasContrairam = populacao - min(simulacao[0])
duracaoEpidemia = sum(1 for x in simulacao[2] if x >= 1)

print("Número máximo de pessoas infectadas simultaneamente: ", maximoPessoasInfectadas) # 1223
print("Total de pessoas que contraíram a doença: ", totalPessoasContrairam) # 8520
print("Duração total da epidemia (dias com I >= 1): ", duracaoEpidemia) # 291

#b)

dias = range(1, len(simulacao[0]) + 1)

plt.plot(dias, simulacao[0], label='Susceptíveis (S)')
plt.plot(dias, simulacao[1], label='Expostos (E)')
plt.plot(dias, simulacao[2], label='Infectados (I)')
plt.plot(dias, simulacao[3], label='Recuperados (R)')

plt.xlabel('Dias')
plt.ylabel('Número de pessoas')
plt.title('Evolução da epidemia')
plt.legend()
plt.grid(True)
plt.show()

#c)
random.seed(42)

populacao = 10000

numeroSimulacoes = 100

vetorMaximo = []
vetorContrairam = []
vetorDuracao = []

for i in range(numeroSimulacoes):
  simulacao = simulaEpidemia()
  vetorMaximo.append(max(simulacao[2]))
  vetorContrairam.append(populacao - min(simulacao[0]))
  vetorDuracao.append(sum(1 for x in simulacao[2] if x > 1))


plt.hist(vetorMaximo, bins = 30, color = 'blue', edgecolor = 'black')
plt.title('Distribuição')
plt.xlabel('Número máximo de pessoas infectadas')
plt.ylabel('Frequência')
plt.show()

mediaMaximoPessoasInfectadas = np.mean(vetorMaximo)
mediaTotalPessoasContrairam = np.mean(vetorContrairam)
mediaDuracaoEpidemia = np.mean(vetorDuracao)
print("Média do número máximo de pessoas infectadas simultaneamente: ", mediaMaximoPessoasInfectadas) #1319.79
print("Média do total de pessoas que contraíram a doença: ", mediaTotalPessoasContrairam) # 8550.92
print("Média da duração total da epidemia (dias com I > 1): ", mediaDuracaoEpidemia) # 244.11
