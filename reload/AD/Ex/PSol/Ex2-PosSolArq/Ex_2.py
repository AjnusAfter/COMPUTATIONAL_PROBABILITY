import random
import numpy as np
import matplotlib.pyplot as plt

######
# Q1)
######

random.seed(123)

nsamples = 10000
PFNaoAjustado = 3500

PFAjustadoTotal = []
tempoSemanasTotal = []
custoTotal = []

for simulacao in range(nsamples):
  distribuicaoDados = random.choices([2,3,4], weights=[0.20,0.60,0.20])[0]
  desempenho = random.choices([3,4,5], weights=[0.10,0.70,0.20])[0]
  reusabilidade = random.choices([1,2,3], weights=[0.10,0.70,0.20])[0]
  complexidade = random.choices([2,3,4,5], weights=[0.10,0.60,0.20,0.10])[0]
  
  outrasCaracteristicas = 0
  for j in range(10):
    outrasCaracteristicas = outrasCaracteristicas + random.choices([1,2,3], weights=[0.20,0.60,0.20])[0]
  
  somaCaracteristicas = distribuicaoDados + desempenho + reusabilidade + complexidade + outrasCaracteristicas
  FA = 0.65 + 0.01 * somaCaracteristicas
  PFAjustado = PFNaoAjustado * FA
  
  # Produtividade (h/PF) e custo por hora
  produtividade = random.choices([4,5,6], weights=[0.20,0.60,0.20])[0]
  custoHora = random.choices([80,100,120], weights=[0.20,0.60,0.20])[0]
  
  tempoHoras = PFAjustado * produtividade
  tempoSemanas = tempoHoras / 40
  custo = tempoHoras * custoHora
  
  PFAjustadoTotal.append(PFAjustado)
  tempoSemanasTotal.append(tempoSemanas)
  custoTotal.append(custo)

PFAjustadoTotal = np.array(PFAjustadoTotal)
tempoSemanasTotal = np.array(tempoSemanasTotal)
custoTotal = np.array(custoTotal)
  
# a)
print("PF ajustado médio: %.2f" % (np.mean(PFAjustadoTotal)))

# b)
print("Tempo médio (semanas): %.2f" % (np.mean(tempoSemanasTotal)))

# c)
print("Custo médio (R$): %.2f" % (np.mean(custoTotal)))

# d)
print("Probabilidade custo < R$ 1.500.000,00: %.2f" % (np.mean(custoTotal < 1500000)))

# e)
print("Probabilidade tempo < 450 semanas: %.2f " % (np.mean(tempoSemanasTotal < 450)))

# f)

plt.figure(figsize=(15,4))

plt.subplot(1,3,1)
plt.hist(PFAjustadoTotal, bins=30, edgecolor="black")
plt.title("Distribuição do PF ajustado")

plt.subplot(1,3,2)
plt.hist(tempoSemanasTotal, bins=30, edgecolor="black")
plt.title("Distribuição do Tempo (semanas)")

plt.subplot(1,3,3)
plt.hist(custoTotal, bins=30, edgecolor="black")
plt.title("Distribuição do Custo (R$)")

plt.tight_layout()
plt.show()
