p <- function(x)
{
  return ((1.0/sqrt(2*pi)) * exp((-x^2)/2))
}

h <- function(x)
{
  return (exp(-x))
}

# Inversa da exponencial com lambda = 1
# usada para gerar variável aleatória Y
inversa_h <- function(x)
{
  return (-log(1.0-x))
}

normal <- function(nSamples)
{
  x <- rep(0, nSamples)
  c <- exp(1/2)/sqrt(2*pi)
  
  for (i in 1:nSamples)
  {
    while(T)
    {
      u1 <- runif(1)
      y  <- inversa_h(u1)   # gera Y a partir da inversa
      u2 <- runif(1)
      
      if (u2 <= p(y)/(c*h(y)))
      {
        u3 <- runif(1)  # simetria da normal
        
        if (u3 < 0.5)
          x[i] <- -y
        else
        {
          x[i] <- y
        }
        break()
      }
    }
  }
  return (x)
}

par(mfrow = c(1,3))

# Gráfico 1
nSamples <- 100000 
x <- seq(-4, 4, 0.01)
fx <- p(x)
plot(x, fx, main = "Distribuição Normal Padrão", xlab = "x", ylab = "p(x)")

# Gráfico 2
X <- normal(nSamples); print(mean(X)); print(var(X))
hist(X, 
     main = "Histograma da amostra", 
     xlab = "x", 
     ylab = "Frequência", 
     breaks = 100, 
     col = 3) 

# Gráfico 3
hist(X,
     main = "Distribuição teórica + Histograma (densidade)",
     xlab = "x",
     ylab = "Densidade",
     breaks = 100,
     probability = TRUE,
     col = 3)

lines(x, fx, col = "blue", lwd = 2)
legend("center", 
       legend = c("Histograma (densidade)", "Distribuição teórica"), col = c("green", "blue"), lwd = 2)