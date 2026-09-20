# -*- coding: utf-8 -*-
import random

def simulador (nrodadas, quantia, probabilidade):  
  numeroJogadores = len(quantia)
  jogadores = range(numeroJogadores)
  quantiaFinal = quantia.copy()
  rodada = 0
  
  while ((rodada < nrodadas) and (min(quantiaFinal) > 0)):
    rodada = rodada + 1
    quantiaFinal = [valor - 1 for valor in quantiaFinal]
    vencedor = random.choices(jogadores, weights = probabilidade, k = 1)[0]
    quantiaFinal[vencedor] = quantiaFinal[vencedor] + numeroJogadores
  
  return(quantiaFinal)


numeroRodadas = 1000
quantiaInicial = [150, 70, 240]
probabilidadeVencer = [0.3, 0.4, 0.3]
campeonato = simulador(numeroRodadas, quantiaInicial, probabilidadeVencer)

print("Quantia final")
print("Maria = ", campeonato[0])
print("Gustavo = ", campeonato[1])
print("Jorge = ", campeonato[2])

