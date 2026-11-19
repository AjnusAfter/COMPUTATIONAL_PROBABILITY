# P(X = xj) = pj;   j = 1,2,3,4;    p1 = 0,2    p2 = 0,15   p3 = 0,25   p4 = 0,4

gera.variavel <- function(nSamples)
{
  X <- rep(0, nSamples)   # nSamples posições com 0
  U <- runif(nSamples)    # nSamples valores em [0.0, 1)
  
  for (i in 1:nSamples)
  {
    X[i] <- ifelse(U[i] < 0.2, 1,
                   ifelse(U[i] < 0.35, 2,    # 0.2 + 0.15
                          ifelse (U[i] < 0.6, 3, 4)))    # 0.2 + 0.15 + 0.25
  }
  
  return (X)
}

nSamples <- 1000
X <- gera.variavel(nSamples)
dados <- table(X)

barplot(dados,
        xlab = "X",
        ylab = "Quantidade")