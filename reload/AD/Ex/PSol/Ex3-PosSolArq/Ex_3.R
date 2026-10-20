#######################
# 1)
######################

LCG <- function (seed, a, c, M, nsamples) {
  x <- seed
  u <- NULL
  for (i in 1:nsamples) {
    nx <- (a * x + c) %% M
    u <- c(u, as.double(nx) / as.double(M))
    x <- nx
  }
  return (u)
}

LM <- function(nsamples) {
  a <- NULL
  b <- c (2^9, 2^8, 2^7, 2^6, 2^5, 2^4, 2^3, 2^2, 2^1, 2^0)  # 10 moedas
  total.numero <- (2^10 - 1)  # 10 moedas
  u <- NULL  
  for (i in 1:nsamples) {
    a <- sample (c(0, 1), 10, replace = T)
    numero <- sum (a * b)
    u <- c(u, as.double(numero) / as.double(total.numero))
  }
  return (u)  
}

MOEDA <- function (U, p) {
  n <- length(U)
  CC <- NULL
  for (i in 1:n)
    if (U[i] < (1.0 - p))
      CC <- c(CC, 0) #cara
    else
      CC <- c(CC, 1) #coroa
  return (CC)  
}

DADO <- function (U) {
  n = length(U)
  dado = NULL
  for (i in 1:n) {
    if (U[i] < 1.0 / 8.0)
      dado <- c(dado, 1)
    else if (U[i] < 2.0 / 8.0)
      dado <- c(dado, 2)
    else if (U[i] < 3.0 / 8.0)
      dado <- c(dado, 3)
    else if (U[i] < 4.0 / 8.0)
      dado <- c(dado, 4)
    else if (U[i] < 5.0 / 8.0)
      dado <- c(dado, 5)
    else if (U[i] < 6.0 / 8.0)
      dado <- c(dado, 6)
    else if (U[i] < 7.0 / 8.0)
      dado <- c(dado, 7)
    else
      dado <- c(dado, 8)
  }
  return (dado)
}

DADO.VICIADO <- function (U) {
  n = length(U)
  dado = NULL
  for (i in 1:n) {
    if (U[i] < 1.0 / 7.0)
      dado <- c(dado, 1)
    else if (U[i] < 2.0 / 7.0)
      dado <- c(dado, 2)
    else if (U[i] < 3.0 / 7.0)
      dado <- c(dado, 4)
    else if (U[i] < 4.0 / 7.0)
      dado <- c(dado, 5)
    else if (U[i] < 5.0 / 7.0)
      dado <- c(dado, 6)
    else if (U[i] < 6.0 / 7.0)
      dado <- c(dado, 7)    
    else
      dado <- c(dado, 8)
  }
  return (dado)
}

# a.1)

a <- 39373
c <- 0
M <- 2147483647
nsamples <- 10000

UM1 <- LCG(3, a, c, M, nsamples)
CC1 <- MOEDA(UM1, 0.5)

UM2 <- LCG(123, a, c, M, nsamples)
CC2 <- MOEDA(UM2, 0.5)

cont <- 0
for (i in 1:nsamples) {
  if ((CC1[i] != CC2[i])) {
    cont <- cont + 1
  }
}

cat("Resultado:", cont, "\n")

# a.2)

a <- 39373
c <- 0
M <- 2147483647
nsamples <- 10000

UM <- LCG(3, a, c, M, nsamples * 2)
CC <- MOEDA(UM, 0.5)

cont <- 0
for (i in 1:nsamples) {
  if ((CC[2*i - 1] != CC[2*i])) {
    cont <- cont + 1
  }
}

cat("Resultado:", cont, "\n")

# b)

set.seed(123)

a <- 39373
c <- 0
M <- 2147483647
nsamples <- 10000

UM <- LCG(3, a, c, M, nsamples)
CC <- MOEDA(UM, 0.5)
UD <- runif(nsamples)
FD = DADO(UD)

cont <- 0
for (i in 1:nsamples) {
  if ((CC[i] == 1) && (FD[i] == 5)) {
    cont <- cont + 1
  }
}

cat("Resultado:", cont, "\n")

# c) 

set.seed(123)

a <- 39373
c <- 0
M <- 2147483647
nsamples <- 10000

UM <- LCG(3, a, c, M, nsamples)
CC <- MOEDA(UM, 0.5)
UD <- LM(nsamples)
FD = DADO.VICIADO(UD)

cont <- 0
for (i in 1:nsamples) {
  if ((CC[i] == 1) && (FD[i] == 8)) {
    cont <- cont + 1
  }
}

cat("Resultado:", cont, "\n")

# d) 

set.seed(123)

nsamples <- 10000

UM <- runif(nsamples)
CC <- MOEDA(UM, 0.55)
UD <- LM(nsamples)
FD = DADO(UD)

cont <- 0
for (i in 1:nsamples) {
  if ((CC[i] == 1) && (FD[i] == 7)) {
    cont <- cont + 1
  } else if ((CC[i] == 0) && ((FD[i] == 1) || (FD[i] == 4))) {
    cont <- cont + 1
  }
}

cat("Probabilidade estimada:", cont/nsamples, "\n")

#######################
# 2)
######################

# Configuração
set.seed(123)        # Semente
nsamples <- 100000   # Número de simulações
l <- 100             # Lado do talhão
areaTotal <- l^2

# Vetor para contagem
categorias <- c("Ruim" = 0, "Média" = 0, "Boa" = 0, "Excelente" = 0)

# Simulação
for (i in 1:nsamples) {
  x <- runif(3, 0, l)
  y <- runif(3, 0, l)
  
  # Cálculo da área do triângulo
  area <- 0.5 * abs(
    x[1]*(y[2] - y[3]) + x[2]*(y[3] - y[1]) + x[3]*(y[1] - y[2])
  )
  
  proporcao <- area / areaTotal  # Proporção da área coberta
  
  # Classificação
  if (proporcao < 0.05) {
    categorias["Ruim"] <- categorias["Ruim"] + 1
  } else if (proporcao < 0.10) {
    categorias["Média"] <- categorias["Média"] + 1
  } else if (proporcao < 0.20) {
    categorias["Boa"] <- categorias["Boa"] + 1
  } else {
    categorias["Excelente"] <- categorias["Excelente"] + 1
  }
}

# Probabilidades estimadas
probabilidades <- categorias / nsamples
print(probabilidades)

