# Item	Resposta
# a)	V
# b)	F
# c)	V
# d)	F
# e)	F
# f)	V
# g)	V
# h)	F
# i)	V
# j)	F
# k)	V
# l)	V
# m)	V
# n)	V
# o)	V
# p)	V
# q)	F
# r)	V
# s)	V
# t)	F
# 
# Justificativas
# a) Verdadeiro. Existem 12 tentativas independentes, cada uma com probabilidade constante de defeito \(p=0,25\). Portanto, é Binomial.
# 
# b) Falso. Mesmo com \(p=0,5\), os valores não são todos igualmente prováveis. A distribuição é simétrica, mas não uniforme.
# 
# c) Verdadeiro. A Binomial é uma distribuição discreta. Para valores não inteiros de \(k\), a probabilidade é zero.
# 
# d) Falso.
# 
# X ~ Bin(n = 15, p = 0.1)
# 
# P(X = 0) = C(15, 0) * 0.1^0 * 0.9^15
# P(X = 0) = 0.9^15 ≈ 0.2059
# 
# e) Falso.
#
# Na distribuição Binomial, a média e a variância são dadas por:
#
# E(X) = np
# Var(X) = np(1 - p)
#
# Portanto, mantendo p fixo, quando n aumenta, tanto a média
# quanto a variância aumentam.
#
# Logo, a afirmação é falsa, pois a variância não permanece constante.
# 
# f) Verdadeiro. Na distribuição Normal, média, mediana e moda coincidem devido à simetria.
# 
# g) Verdadeiro.
#
# Na distribuição de Poisson, a probabilidade é dada por:
#
# P(X = k) = (e^(-λ) * λ^k) / k!
#
# Para λ = 3 e k = 0:
#
# P(X = 0) = (e^(-3) * 3^0) / 0! = e^(-3)
#
# Portanto, a afirmação é verdadeira.
# 
# h) Falso. A Poisson é discreta e admite apenas valores inteiros não negativos de \(k\).
# 
# i) Verdadeiro.
#
# Na distribuição de Poisson, a soma das quantidades de eventos
# ocorridos em períodos independentes também segue uma distribuição
# de Poisson, com parâmetro igual à soma dos parâmetros.
#
# Como a taxa é de 2 eventos por hora e o período é de 5 horas:
#
# λ = 2 * 5 = 10
#
# Portanto, o número de eventos nesse período segue uma distribuição
# de Poisson com parâmetro λ = 10.
# 
# j) Falso. A moda da Poisson não é necessariamente \(\lambda\). Por exemplo, quando \(\lambda\) é inteiro, existem duas modas: \(\lambda-1\) e \(\lambda\).
# 
# k) Verdadeiro. A Geométrica modela o número de tentativas independentes até o primeiro sucesso, com probabilidade constante \(p\).
# 
# l) Verdadeiro.
#
# A função f(x) = x^2, restrita ao domínio x >= 0, é estritamente
# crescente e, portanto, é invertível.
#
# Para encontrar sua inversa, isolamos x:
#
# y = x^2
# x = sqrt(y)
#
# Logo:
#
# f^(-1)(x) = sqrt(x)

# m) Verdadeiro. Para o primeiro sucesso ocorrer na segunda tentativa,
# deve ocorrer uma falha na primeira e um sucesso na segunda:
#
# P(T = 2) = (1 - p)p = 0,7 * 0,3 = 0,21
# 
# n) Verdadeiro. A distribuição Geométrica possui a propriedade de
# falta de memória, ou seja, a probabilidade de esperar mais n tentativas,
# dado que já se esperou m tentativas sem sucesso, é a mesma de esperar
# mais n tentativas desde o início:
#
# P(T > m + n | T > m) = P(T > n)
# 
# o) Verdadeiro. Na distribuição Weibull, o parâmetro beta (β)
# determina o comportamento da taxa de falha:
#
# - β = 1: taxa de falha constante (distribuição Exponencial).
# - β > 1: taxa de falha crescente.
# - β < 1: taxa de falha decrescente.

# p) Verdadeiro. A Hipergeométrica modela retiradas sem reposição de uma população finita.
# 
# q) Falso. Como as bolas são retiradas sem reposição, a distribuição correta é Hipergeométrica, não Binomial.
# 
# r) Verdadeiro. Poisson modela a quantidade de eventos; Exponencial modela o tempo entre eventos consecutivos.
# 
# s) Verdadeiro. A distribuição de Poisson pode aproximar a
# distribuição Binomial quando n é grande e p é pequeno,
# mantendo λ = np constante.
# 
# t) Falso. Na Hipergeométrica, a probabilidade de sucesso muda a cada retirada, pois não há reposição.
# 
# Sequência para conferência:
#   V F V F F V V F V F V V V V V V F V V F


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
x <- seq(0, 10, length.out = 1000)
fx <- f(x)

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