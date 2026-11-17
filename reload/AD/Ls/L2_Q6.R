# QUESTÃO 6
# X ~ N(10, 5)

mu <- 10
sigma <- sqrt(5)


# ==========================================
# A) UTILIZANDO COMANDOS PRONTOS DO R
# ==========================================

# A.1) Calcular as probabilidades

# P(X < 3)
p1 <- pnorm(3, mean=mu, sd=sigma)

# P(2 < X < 7)
p2 <- pnorm(7, mean=mu, sd=sigma) -
  pnorm(2, mean=mu, sd=sigma)

# P(X > 6)
p3 <- 1 - pnorm(6, mean=mu, sd=sigma)

print(p1)
print(p2)
print(p3)


# A.2) Construir a curva e marcar P(X < 3)

xmin <- mu - 4*sigma
xmax <- mu + 4*sigma

curve(dnorm(x, mean=mu, sd=sigma),
      from=xmin, to=xmax,
      main="Distribuição Normal N(10,5)",
      xlab="X", ylab="Densidade",
      col="blue", lwd=2)

x <- seq(xmin, 3, length.out=500)

polygon(c(x[1], x, 3),
        c(0, dnorm(x, mu, sigma), 0),
        col="lightblue", border=NA)

curve(dnorm(x, mean=mu, sd=sigma),
      from=xmin, to=xmax,
      add=TRUE, col="blue", lwd=2)

abline(v=3, col="red", lty=2)


# ==========================================
# B) SEM COMANDOS PRONTOS DE DISTRIBUIÇÃO
# ==========================================

# B.1) Definir a função densidade

fdp <- function(x) {
  (1/(sigma*sqrt(2*pi))) *
    exp(-((x-mu)^2)/(2*sigma^2))
}

# P(X < 3)
p1 <- integrate(fdp, -Inf, 3)$value

# P(2 < X < 7)
p2 <- integrate(fdp, 2, 7)$value

# P(X > 6)
p3 <- integrate(fdp, 6, Inf)$value

print(p1)
print(p2)
print(p3)


# B.2) Construir a curva e marcar P(X < 3)

xmin <- mu - 4*sigma
xmax <- mu + 4*sigma

curve(fdp(x),
      from=xmin, to=xmax,
      main="Distribuição Normal N(10,5)",
      xlab="X", ylab="Densidade",
      col="blue", lwd=2)

x <- seq(xmin, 3, length.out=500)

polygon(c(x[1], x, 3),
        c(0, fdp(x), 0),
        col="lightblue", border=NA)

curve(fdp(x),
      from=xmin, to=xmax,
      add=TRUE, col="blue", lwd=2)

abline(v=3, col="red", lty=2)