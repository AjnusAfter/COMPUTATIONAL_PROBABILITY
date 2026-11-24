# Para 0 < x < 1:
  # f(x)    = 3x²
  # F(x)    = x³
  # F^-1(x) = u^(1/3)


f <- function(x)
{
  return (3*x^2)
}

inversaFx <- function(u)
{
  return (u^(1/3))
}

gerarAmostraX <- function(nSamples)
{
  X <- rep(0, nSamples)
  U <- runif(nSamples)
  
  for (i in 1:nSamples)
  {
   X[i] <- inversaFx(U[i])
  }
  
  return (X)
}

nSamples <- 100000
X <- gerarAmostraX(nSamples)

par(mfrow = c(1,2))
valorx <- seq(0, 1, 0.01)
valory <- f(valorx)

# amostra
hist(X, breaks=100, col = 3, main="Amostra", xlab = "x")

# f(x) e amostra
hist(X, breaks=100, probability=TRUE, 
     col = 3, 
     main = "Distribuição teórica + Histograma da amostra",
     xlab = "x",
     ylab = "Densidade")

lines(valorx, valory, col = "blue", lwd = 2)

legend("topleft",
       legend = c("Distribuição teórica", "Histograma (densidade)"),
       col = c("blue", "green"),
       lwd = c(2, 10))