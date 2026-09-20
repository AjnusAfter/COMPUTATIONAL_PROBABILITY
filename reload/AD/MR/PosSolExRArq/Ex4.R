
simulador <- function(nrodadas, quantia, probabilidade) {
  numeroJogadores <- length(quantia)
  jogadores <- seq(1:numeroJogadores)
  quantiaFinal <- quantia
  rodada <- 0
  
  while ((rodada < nrodadas) & (min(quantiaFinal) > 0)) {
    rodada <- rodada + 1
    quantiaFinal <- quantiaFinal - 1
    vencedor <- sample(jogadores, 1, prob = probabilidade)
    quantiaFinal[vencedor] <- quantiaFinal[vencedor] + numeroJogadores
  }
  
  return(quantiaFinal)
}

numerorodadas <- 1000
quantiaInicial <- c (150, 70, 240)
probabilidadeVencer <- c (0.3, 0.4, 0.3)
campeonato <- simulador(numerorodadas, quantiaInicial, probabilidadeVencer)

sprintf("Quantia final")
sprintf("Maria = %d.", campeonato[1])
sprintf("Gustavo = %d.", campeonato[2])
sprintf("Jorge = %d.", campeonato[3])
