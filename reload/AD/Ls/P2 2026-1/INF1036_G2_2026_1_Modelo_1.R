######
# 2)
######

simulador <- function(n, TMC, TMA, TT) {
  retorno <- NULL
  total.atendimento <- 0
  total.atendimento.realizado <- 0
  tempo.atendimento <- rep(0, n)
  tempo.operacao <- rep(0, n)
  tempo.manutencao <- rep(0, n)  
  tempo <- 0
  while (tempo < TT) {
    tempo <- tempo + rexp(1, TMC) 
    total.atendimento <- total.atendimento + 1
    for (i in 1:n) {
      # verifica se caixa está em manutenção
      if (tempo < tempo.manutencao[i]) {
        next # caixa em manutenção
      }
      if (tempo.atendimento[i] < tempo) {
        
        tempo.atendimento[i] <- tempo + rexp(1, TMA)
        total.atendimento.realizado <- total.atendimento.realizado + 1
        
        # atualiza tempo de operação acumulada
        tempo.operacao[i] <- tempo.operacao[i] + (tempo.atendimento[i] - tempo)
        # se atingiu limite de operação (2000 min)
        if (tempo.operacao[i] >= 2000) {
          tempo.manutencao[i] <- tempo.atendimento[i] + 40
          tempo.operacao[i] <- 0
        }
        
        break
      }
    }
  }
  retorno <- c(total.atendimento.realizado, total.atendimento - total.atendimento.realizado)
  return (retorno)
}

#a)

set.seed(123)

n <- 3
TMC <- 1/2
TMA <- 1/3
TT <- 24000
atendimento <- simulador(n, TMC, TMA, TT)
print(atendimento) # 10308  1576

#b)

set.seed(123)

n <- 3
TMC <- 1/2
TMA <- 1/3
TT <- 24000
numero.simulacao <- 200
atendimento <- c (0, 0)

for (i in 1:numero.simulacao) {
  atendimento <- atendimento + simulador(n, TMC, TMA, TT)
}

media.atendimento <- atendimento / numero.simulacao
print(media.atendimento) # 10343.795  1670.905

######
# 3)
######

# a)

f <- function(x) {
  return(1 * x / 50)
}

curve(f, 0, 10)

print(integrate(f, lower = 0, upper = 10))

# f assume somente valores positivos no intervalo.
# A integral no intervalo é 1.

# F(x) = x^2 / 100, para x em [0, 10]; F(x) = 0, para x < 0; F(x) = 1, para x > 10

# b) 

# Inversa de F(x): Finv(u) = 10 * sqrt(u), para u em [0, 1]

Finv <- function(u) {
  return(10 * sqrt(u))
}

set.seed(123)
n <- 10000
u <- runif(n)
amostras <- Finv(u)

# Histograma com curva teorica f(x)
hist(amostras, breaks = 50, probability = TRUE, col = "lightblue",
     main = "Histograma das Amostras Metodo da Inversa)",
     xlab = "Tempo de Resposta (min)", ylab = "Densidade")
lines(x, fx, col = "blue", lwd = 2)

# c)

# SLA: 95% dos atendimentos ate 9 minutos
sla_limite <- 9
prop_sla <- mean(amostras <= sla_limite)
prop_sla  # Esperado: aproximadamente 81%

# A empresa esta em conformidade?
if (prop_sla >= 0.95) {
  resultado <- "A empresa CUMPRE o SLA"
} else {
  resultado <- "A empresa NAO cumpre o SLA"
}
print(resultado)

# d)

# E[X] = integral de 0 a 10 de xf(x) = 20/3 = 6.667
# E[X^2] = integral de 0 a 10 de (x^2)f(x) = 50
# Var[X] = (E[X^2]) - (E[X])^2 = 50 - (20/3)^2 = 50/9 = 5.556

######
# 4)
######

# a)

# f assume somente valores positivos no intervalo.
# A integral no intervalo é 1.
f <- function(x) {
  return (0.75 * (1 - x^2) * ifelse(abs(x) <= 1, 1, 0))
}

print(integrate(f, -1, 1)) # 1 with absolute error < 1.1e-14
x <- seq(-1, 1, length = 1000) 
y <- f(x)

min(y) # O menor valor no intervalo e 0
plot(x, y) # Pelo grafico tambem podemos ver que f(x) eh positiva no intervalo.

# b)

h <- function(x) {
  return (0.5)
}

inversa_h <- function(x) {
  return (-1 + (1 - (-1))*x)
}

gerarAmostra <- function (nsamples) {
  x <- rep(0, nsamples)
  c <- 1.5 # pois f(x) <= c * g(x), com g(x) = uniforme em [-1,1], densidade = 1/2
  for (i in 1:nsamples) {
    while (T) {
      u1 <- runif(1)
      y  <- inversa_h(u1) # gera Y a partir da inversa
      u2 <- runif(1)
      if (u2 <= f(y)/(c*h(y))){
        x[i] <- y
        break()
      }
    }
  }
  return (x)
}

set.seed(123)  # Reprodutibilidade
n <- 10000
amostras <- gerarAmostra(n)

# Histograma das amostras + curva da densidade teorica
hist(amostras, breaks = 50, probability = TRUE, col = "lightblue",
     main = "Histograma das Amostras com f(x)",
     xlab = "Desvio (mm)", ylab = "Densidade")
curve(f, from = -1.2, to = 1.2, col = "red", lwd = 2, add = TRUE)

# c) Pode utilizar o valor calculado pela integral ou pela amostra, custoTotal 1385

# P(|X| > 0.8) = P(X < -0.8) + P(X > 0.8) = 0.056
probabilidadeDescarte <- integrate(f, -1, -0.8)$value + integrate(f, 0.8, 1)$value

# Estimativa emperica da taxa de descarte
taxaDescarteEmpirica <- mean(abs(amostras) > 0.8)
taxaDescarteEmpirica  # Deve estar proxima de 0.0576 

custoUnitario <- 0.50
loteTotal <- 50000
custoTotal <- taxaDescarteEmpirica * loteTotal * custoUnitario # ou probabilidadeDescarte
print(custoTotal) # 1385


######
# 5)
######

media <- 80
desvio <- 12

# a)
probabilidade <- 1 - pnorm(95, mean = media, sd = desvio)
print(probabilidade) # 0.1056498

# b)
peso <- qnorm(0.70, mean = media, sd = desvio)
print(peso) # 86.29281

# c)
probabilidade <- 1 - pnorm(88, mean = media, sd = desvio) # 0.2524925
quantidade <- 40 * probabilidade
print(quantidade) # 10.0997

# d)
set.seed(123)
nsamples <- 100000

x <- rnorm(nsamples, mean = media, sd = desvio)
probabilidade <- mean((x >= 90) & (x <= 100))
print(probabilidade)  # 0.15467

