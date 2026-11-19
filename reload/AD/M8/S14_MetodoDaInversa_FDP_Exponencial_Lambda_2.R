gera.exponencial <- function(x, taxa)
{
  X <- rep(0, nSamples)               # nSamples posições com 0-
  U <- runif(nSamples)                # nSamples valores em [0.0, 1.0)
  
  for (i in 1:nSamples)
  {
    X[i] <- -log(1.0 - U[i]) / taxa    # Inversa da Exponencial
  }
  
  return (X)
}

taxa <- 2.0
nSamples <- 50000

X <- gera.exponencial(nSamples, taxa)
hist(X, 
     main = "Distribuição Exponencial", 
     xlab="X", 
     ylab = "Densidade",
     breaks = 100,
     col = 4)