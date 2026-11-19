gera.weibull <- function(nSamples, a, b)
{
  X <- rep(0, nSamples)
  U <- runif(nSamples)
  
  for (i in 1:nSamples)
  {
    X[i] <- b * ((-log(1 - U[i]))^(1.0/a))
  }
  
  return (X)
}

a = 1
b = 0.5
nSamples = 50000

X = gera.weibull(nSamples, a, b)
hist(X,
     main = "Distribuição Weibull",
     xlab = "X",
     ylab = "Densidade",
     breaks = 100,
     col = 'blue')