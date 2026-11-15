# 21
mean = 100; sd = sqrt(100); X = 95

pnorm(X, mean, sd)


# 22
funcao.normal <- function(x)
{
  fx <- (1 / sqrt(2*pi*100)) * exp ((-1/200) * (x-100)^2)
  return (fx)
}

par(mfrow = c(1,2))


# 23
x <- seq(60, 140, length.out = 100)
fx <- funcao.normal (x)
plot(
  x, 
  fx, 
  type = "l"
)

plot(x, fx, type = "l")
vx <- c(60, 60, x[x < 90], 90, 90)
vy <- c(0, funcao.normal(60), fx[x < 90], funcao.normal(90), 0)
polygon(vx, vy, dens = 50)


# 24
pnorm(90, mean=100, sd=10)

# "que diferentemente da pnorm() reporta ainda o erro de aproximação numérica"
integrate(funcao.normal, -Inf, 90)

pnorm(105, mean, sd) - pnorm(90, mean, sd)
integrate(funcao.normal, 90, 105)

1 - pnorm(90, mean, sd)
integrate(funcao.normal, 90, +Inf)