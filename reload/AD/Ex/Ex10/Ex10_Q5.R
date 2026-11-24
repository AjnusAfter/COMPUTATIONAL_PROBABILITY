p <- function(x)
{
  return (60 * x^3 * (1 - x)^2)
}

h <- function(X)
{
  return (rep(1, length(X)))
}

inversaHx <- function(x)
{
  return (x)
}

gerarAmostraX <- function(nSamples)
{
  count <- 0
  X <- rep(0, nSamples)
  c <- p(3/5) / h(3/5)
  
  # x que maximiza p(x)/h(x) é 3/5 e, pelo Método da Rejeição,
  # o valor de c deve ser calculado neste ponto.
  
  for (i in 1:nSamples)
  {
    repeat
    {
      count <- count +1
      u1 <- runif(1)    # para gerar amostra de h(x)
      y  <- inversaHx(u1) 
      u2 <- runif(1) 
      
      if (u2 <= p(y) / (c*h(y)))
      {
        X[i] <- y
        break
      }
    }
  }
  
  return (X)
}

par(mfrow=c(2,2))

#p(x)
valorX <- seq(0, 1, length.out = 100)
valorY <- p(valorX)

plot(valorX, valorY,
     type = "l",
     col = "blue",
     main = "Distribuição",
     xlab = "x",
     ylab = "p(x)")

# p(x) e h(x)
valorXH <- seq(0, 1, length.out = 100)
c <- p(3/5) / h(3/5)
valorYH <- c * h(valorXH)

plot(valorXH, valorYH,
     type = "l",
     col = "blue",
     main = "Distribuição",
     xlab = "x",
     ylab = "p(x)")

lines (valorXH, valorYH, col = "orange")

#gerando a amostra
nSamples <- 100000
X <- gerarAmostraX(nSamples)

hist(X, breaks = 100,
     col = "green",
     main = "Amostra",
     xlab = "x")

# p(x) e a amostra
hist(X, breaks = 100, probability = TRUE,
     col = 3,
     main = "Distribuição teórica + Histograma da amostra",
     xlab = "x",
     ylab = "Densidade")

lines(valorX, valorY, col = "blue", lwd = 2)

#legend("topleft",
 #      legend = c("Distribuição teórica", "Histograma (densidade)"),
  #     col = c("blue", "green"),
   #    lwd = c(2, 10))