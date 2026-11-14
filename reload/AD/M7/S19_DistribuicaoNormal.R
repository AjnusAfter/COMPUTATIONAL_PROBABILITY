micro = 82
teta = 13

# A A probabilidade de se encontrar um jogador com mais de 93 quilos
X = 93
1 - pnorm(X, micro, teta)

# B O valor do peso para o qual a probabilidade de se encontrar valores menores que o deste seja de 70%
p = 0.7
qnorm(p, micro, teta)

# 5
curve(
  dnorm(x, micro, teta),
  50, 110,                    # limites do gráfico
  main = "Distribuição",
  ylab = "Probabilidade",
)
lines(
  c(micro+teta, micro+teta),  # início e fim da linha em relação ao eixo x
  c(0, 0.3),                  # início e fim da linha em relação ao eixo y
  col  = 2
)
