lambda = 90 # horas

# P(X > 100)?
# P(X > 100) = 1 - P(X <= 100)
1 - pexp(100, rate=1/lambda)

x <- seq(0,500)
# "Essa expressão calcula a função de sobrevivência da distribuição exponencial, e não a densidade de probabilidade."
# "Se você quer reproduzir o gráfico original, provavelmente deve usar a densidade:"
fx <- dexp(x, rate=1/lambda)
print(fx)
plot(
  x,
  fx,
  main = "Distribuição Exponencial",
  xlab = "x",
  ylab = "f(x)",
  lwd = 1,
  type = "l",
  #ylim = 0.012
)