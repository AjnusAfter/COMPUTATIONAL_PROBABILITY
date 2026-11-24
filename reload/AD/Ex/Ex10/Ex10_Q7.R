
# a)
# f(x) = 5x^4
# F(x) = x^5
# F-1(x) = u^(1/5)

f <- function(x)
{
  return (5 * x^4)
}

inversaFx <- function(u)
{
  return (u^(1/5))
}

gerarAmostraX <- function(nsamples)
{
  X <- rep(0, nsamples)
  U <- runif(nsamples)
  
  for (i in 1:nsamples)
  {
    X[i] <- inversaFx(U[i])
  }
  
  return (X)
}


# b)
# função g(x)
# Para 0 < x < 1/2, temos:
# g(x) = 4x
# G(x) = 2x^2
# G-1(x) = raiz(x/2)
#
# Para 1/2 < x < 1, temos:
# g(x) = 4(1 - x)
# G(x) = -2(1 - x)^2 + 1
# G-1(x) = 1 - raiz((1 - u)/2)

gx <- function(x)
{
  return (ifelse(x >= 0 & x <= 0.5,
                 4 * x,
                 4 * (1 - x)))
}

inversaGx <- function(u)
{
  return (ifelse(u >= 0 & u <= 0.5,
                 sqrt(u / 2),
                 1 - sqrt((1 - u) / 2)))
}

gerarAmostraX <- function(nsamples)
{
  U <- runif(nsamples)
  X <- inversaGx(U)
  
  return (X)
}


# Organizando os quatro gráficos
par(mfrow = c(2, 2))

# a) f(x)
valorx <- seq(0, 1, 0.01)
valory <- f(valorx)

plot(valorx, valory,
     type = "l",
     col = "blue",
     main = "Densidade f(x)",
     xlab = "x",
     ylab = "f(x)")

grid()

# a) Amostra
nsamples <- 100000
X <- gerarAmostraX(nsamples)

hist(X,
     breaks = 100,
     col = "green",
     main = "Amostra - item a",
     xlab = "x")

grid()


# b) g(x)
valorx <- seq(0, 1, 0.01)
valory <- gx(valorx)

plot(valorx, valory,
     type = "l",
     col = "blue",
     main = "Densidade g(x)",
     xlab = "x",
     ylab = "g(x)")

grid()

# b) Amostra
nsamples <- 100000
X <- gerarAmostraX(nsamples)

hist(X,
     breaks = 100,
     col = "green",
     main = "Amostra - item b",
     xlab = "x")

grid()
