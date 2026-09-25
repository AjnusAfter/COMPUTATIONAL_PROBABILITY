
simulador <- function(nRodadas, quantias, probabilidades)
{
  nJogadores = length(quantias)
  jogadores = 1:nJogadores
  quantiasFinais = quantias
  rodada = 0
  
  while ((rodada < nRodadas) & (min(quantiasFinais) > 0))
  {
    rodada <- rodada +1
    quantiasFinais = quantiasFinais - 1
    winner = sample(jogadores, 1, prob = probabilidades)
    quantiasFinais[winner] = quantiasFinais[winner] + nJogadores
  }
  
  print(sprintf("Rodada: %d", rodada))
  
  return (quantiasFinais)
}

nRodadas <- 1000
quantiasIniciais <- c(150, 70, 240)
probabilidadesVitoria <- c(0.3, 0.4, 0.3)
torneio = simulador(nRodadas, quantiasIniciais, probabilidadesVitoria)

print("Quantias finais:")
print(sprintf("Maria = U$ %.2f", torneio[1]))
print(sprintf("Gustavo = U$ %.2f", torneio[2]))
print(sprintf("Jorge = U$ %.2f", torneio[3]))