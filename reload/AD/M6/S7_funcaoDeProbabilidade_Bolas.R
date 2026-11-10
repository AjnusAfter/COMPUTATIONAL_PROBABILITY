nSamples <- 10000
urna <- c(rep(1,3), rep(2,7))
probabilidadesSelecao <- rep(0.1, 10)
totalBolas <- rep(0,3) # nenhuma, um ou 2 bolas

for (i in 1:nSamples)
{
  bolas <- sample(urna, 2, replace = F, prob = probabilidadesSelecao)
  
  if (bolas[1] == 1 & bolas[2] == 1)
  {
    totalBolas[3] = totalBolas[3]+1
  }
  else if (bolas[1] == 1 | bolas[2] == 1)
  {
    totalBolas[2] = totalBolas[2]+1
  }
  else
  {
    totalBolas[1] = totalBolas[1]+1
  }
}

sprintf("P(nenhuma bola '1'): %.4f", totalBolas[1] / nSamples)
sprintf("P(1 bola'1'): %.4f", totalBolas[2] / nSamples)
sprintf("P(2 bolas '1'): %.4f", totalBolas[3] / nSamples)

#gráfico
q <- 0:5
p <- c(totalBolas[1] / nSamples, totalBolas[2] / nSamples, totalBolas[3] / nSamples, 0, 0, 0)

plot(
  q,
  p,
  main = "Gráfico",
  xlab = "Quantidade",
  ylab = "Probabilidade",
  type = "h",
  lwd = 3,
)
points (0:2, totalBolas/nSamples, pch = 16)
