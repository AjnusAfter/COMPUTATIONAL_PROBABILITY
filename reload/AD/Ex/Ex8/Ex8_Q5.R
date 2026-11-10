lambda <- 4

#A 
k <- 0:20

par(mfrow = c(1,2))

plot(
  k,
  dpois(k, lambda),
  main="Probabilidade - 1 minuto",
  xlab = "Pacotes perdidos",
  ylab = "P(X = k)",
  lwd = 3,
  type = "h"
)

plot(
  k,
  ppois(k, lambda),
  main="Acumulada - 1 minuto",
  xlab = "Pacotes perdidos",
  ylab = "P(X <= k)",
  lwd = 3,
  type = "s"
)

# B Exatamente 6 perdas em 2 minutos
dpois(6, lambda * 2)

# C No máximo 3 perdas em 2 minutos
ppois(3, lambda * 2)

# D Esperança (valor esperado) e variância em 5 minutos
# Na Poisson, ambas são iguais ao parâmetro lambda do intervalo
valor.esperado <- lambda * 5; print(valor.esperado)
variancia      <- lambda * 5; print(variancia)


