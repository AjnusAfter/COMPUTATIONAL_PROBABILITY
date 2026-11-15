lambda = 90

x <- seq(0,500)
# "Essa expressão calcula a função de sobrevivência da distribuição exponencial, e não a densidade de probabilidade."
# "Se você quer reproduzir o gráfico original, provavelmente deve usar a densidade:"
fx <- dexp(x, rate=1/lambda)

par(mfrow = c(1,2))

plot(
  x,
  fx,
  main = "Distribuição Exponencial, lamba = 90",
  xlab = "x",
  ylab = "f(x)",
  lwd = 1,
  type = "l",
)

lambda = 150

# "Essa expressão calcula a função de sobrevivência da distribuição exponencial, e não a densidade de probabilidade."
# "Se você quer reproduzir o gráfico original, provavelmente deve usar a densidade:"
fx <- dexp(x, rate=1/lambda)

plot(
  x,
  fx,
  main = "Distribuição Exponencial, lamba = 150",
  xlab = "x",
  ylab = "f(x)",
  lwd = 1,
  type = "l",
)