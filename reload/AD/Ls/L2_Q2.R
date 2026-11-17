fdp <- function(x)
{
  return (ifelse(-1<=x & x<0, -x,
                 ifelse(0<=x & x<=1, x, 0)))
}

# A
par(bg ="black",
    fg = "white",
    col.axis = "white",
    col.lab = "white",
    col.main = "white")

x0 <- seq(-1.5, -1, by = 0.01)
x0 <- x0[-length(x0)]  # remove o último ponto (-1)
x1 <- seq(-1, 0,    by = 0.01)
x2 <- seq(0, 1,     by = 0.01)
x3 <- seq(1, 1.5,   by = 0.01)
x3 <- x3[-1]           # remove o primeiro ponto (1)

plot(x1, 
     fdp(x1),
     main = "Função de Densidade de Probabilidade(?)",
     xlab = "x",
     ylab = "f(x)",
     col = 4,
     lwd = 2,
     type = "l",
     xlim = c(-1.5, 1.5),
     ylim = c(0, 1))

lines(x0, fdp(x0), lwd = 2, col = 2)
lines(x2, fdp(x2), lwd = 2, col = 3)
lines(x3, fdp(x3), lwd = 2, col = 2)

# f(x) >= 0 para todo x pertencente a S?
# Sim.

# S| f(x)dx = 1?
# T1 = 1*1/2; T2 = 1*1/2; T1 + T2 = 0.5 + 0.5 (+0+0) = 1
# Sim.


# B
p <- integrate(fdp, -1, 0.25)$value + integrate(fdp, 0.75, 1)$value
round(p, 2) # O integrate() calcula a integral numericamente, então pode haver um pequeno erro de aproximação. (0.7500001)


# C
EX <- integrate(function(x) x * fdp(x), -1, 1)$value

EX2 <- integrate(function(x) x^2 * fdp(x), -1, 1)$value

VarX <- EX2 - EX^2

print(VarX)


# D
FDA <- function(x)
{
  return(ifelse(x < -1, 0,
                ifelse(x < 0, (1-x^2)/2,
                       ifelse(x <= 1, (1+x^2)/2, 1))))
}

FDA(c(-2, -1, -0.5, 0, 0.5, 1, 2)) # Gráfica no arquivo S3