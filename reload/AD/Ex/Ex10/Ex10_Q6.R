
p <- function(x)
{
  return (12 * x^2 * (1 - x))
}

h <- function(x) # Uniforme (0, 1)
{
  return (rep(1, length(x)))
}

inversaHx <- function(x) # Gera amostra de h(x) pelo método da inversa.
{
  return (x)
}

# Pelo Método da Rejeição, para calcular c é necessário primeiro encontrar o valor de x
# que maximiza p(x)/h(x). O valor de c deve ser calculado neste ponto.
# Encontrando max(p(x)/h(x)):
# p(x)/h(x) = 12x^2(1 - x), derivando e igualando a 0, temos:
# 12(2x(1 - x) - x^2)=0
# 2x - 2x^2 - x^2 = 0
# -3x^2 + 2x = 0
# x(-3x + 2) = 0
# Temos x = 0 e x = 2/3 como possíveis valores de x.
# Para x = 0, temos p(x)/h(x) = 0 e Para x = 2/3, temos p(x)/h(x) = 16/9.
# x = 2/3 é o valor escolhido o que implica c = p(2/3)/h(2/3) = 16/9.

gerarAmostraX <- function(nsamples)
{
  cont <- 0
  X <- rep(0, nsamples)
  c <- 16/9
  
  # Teste diferentes valores de c (0.1, 0.3, 4, 20, etc)
  # para avaliar como ele afeta os resultados.
  
  for (i in 1:nsamples)
  {
    repeat
    {
      cont <- cont + 1
      u1 <- runif(1) # Para gerar amostra de h(x)
      y <- inversaHx(u1)
      u2 <- runif(1)
      
      if (u2 <= p(y) / (c * h(y)))
      {
        X[i] <- y
        break
      }
    }
  }
  
  return (X)
}

# p(x)
valorx <- seq(0, 1, 0.01)
valory <- p(valorx)

plot(valorx, valory,
     type = "l",
     col = "blue",
     main = "Distribuição",
     xlab = "x",
     ylab = "p(x)")

# p(x) e h(x)
valorxh <- seq(0, 1, 0.01)
c <- p(2/3) / h(2/3)
valoryh <- c * h(valorxh)

plot(valorx, valory,
     type = "l",
     col = "blue",
     main = "Distribuição",
     xlab = "x",
     ylab = "p(x)")

lines(valorxh, valoryh, col = "orange")

# Gerando a amostra
nsamples <- 100000
X <- gerarAmostraX(nsamples)

hist(X,
     breaks = 100,
     col = "green",
     main = "Amostra",
     xlab = "x")

# p(x) e amostra
hist(X,
     probability = TRUE,
     breaks = 100,
     col = "green",
     main = "Distribuição teórica + Histograma da amostra",
     xlab = "x",
     ylab = "Densidade")

lines(valorx, valory, col = "blue", lwd = 2)

#legend("topleft",
 #      legend = c("Distribuição teórica", "Histograma (densidade)"),
  #     col = c("blue", "green"),
   #    lwd = c(2, 10))
