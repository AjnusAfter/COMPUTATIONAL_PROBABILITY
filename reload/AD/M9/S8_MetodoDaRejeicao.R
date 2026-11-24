p <- function(x)
{
  return ((1.0/sqrt(2*pi)) * exp((-x^2)/2))
}

h <- function(x)
{
  return (exp(-x))
}

x <- seq(0, 4, 0.01)
# p(x) <= c*h(x); após c isolado, para o menor c possível: achar o máximo da função
c <- exp(1/2)/sqrt(2*pi)  
y <- seq(0, 4, 0.01)

plot(x,
     p(x),
     type = "l",
     ylim = c(0, 0.8),
     col  = 4,
     main = "c*h e p(x)",
     xlab = "Eixo X",
     ylab = "Eixo Y")

lines(y,
      c*h(y),
      type = "l",
      col = 3)

legend("topright",
       legend = c("p(x)", "c*h(x)"),
       col = c("blue", "green"),
       lwd = 2)