######
# Q1)
######

# a.i)

dbinom(1, 10, 0.15)

# a.ii)

dbinom(0, 10, 0.15)

# a.iii)

# P(X<2)=P(X=0)+P(X=1)

pbinom(1, 10, 0.15)

# b)

set.seed(123)

N <- 100000

x <- rbinom(N, 10, 0.15)

mean(x == 1)
mean(x == 0)
mean(x < 2)

# c)

x <- 0:10

prob <- dbinom(x, 10, 0.15)

plot(
  x,
  prob,
  type = "h",
  lwd = 10,
  col = "blue",
  xlab = "Número de lâmpadas defeituosas",
  ylab = "Probabilidade",
  main = "Distribuição Binomial (n = 10, p = 0,15)"
)

# Use a binomial quando cada ensaio é independente e a probabilidade de sucesso p permanece constante
# entre os ensaios (por exemplo, testar lâmpadas de uma grande produção assumindo
# probabilidade fixa de defeito e amostras independentes).

# Use a hipergeométrica quando a amostragem é feita sem reposição a partir de uma população finita
# com um número fixo de sucessos — aí os ensaios são dependentes e a probabilidade
# muda conforme você retira itens.

# d.i)

# dhyper(x, m=5, n=15, k=3)
dhyper(2, 5, 15, 3) # 0.1315789

# d.ii)
# P(X≥2)=P(X=2)+P(X=3)

sum(dhyper(2:3, 5, 15, 3)) # 0.1403509

# d.iii)
# P(X=0)

dhyper(0, 5, 15, 3) # 0.3991228

# e)

set.seed(123)

N <- 100000

x <- rhyper(N, 5, 15, 3)

mean(x == 2) # 0.13115
mean(x >= 2) # 0.14002
mean(x == 0) # 0.40065

######
# Q2)
######

# Temos uma taxa média de 30 mensagens por semana (7 dias). Logo, a taxa média diária é:
  
# λ = 30/7

# Se X representa o número de mensagens recebidas em um dia:
# X ∼ Poisson(30/7)

# O responsável não responde aos e-mails quando há mais de 3 mensagens:
# P(não responder) = P(X > 3)

lambda <- 30/7
pNaoResponderEmUmDia <- 1 - ppois(3, lambda) # ppois é a acumulada
print(pNaoResponderEmUmDia)

# a) Em cada um dos 5 dias o responsável não responda aos e-mails

# Assumindo independência entre os dias:
# P(não responder nos 5 dias) = [P(X>3)]^5

lambda <- 30/7

pNaoResponderEmUmDia <- 1 - ppois(3, lambda)

pNaoResponderTodos5 <- pNaoResponderEmUmDia^5

print(pNaoResponderTodos5)  # 0.0918144

# b) Em pelo menos um dos 5 dias o responsável não responda aos e-mails
# Calculando o complementar.
# P(responder em um dia) = P(X≤3)
# P(responder em todos os 5 dias) = P(X≤3)^5
# P(pelo menos um dia sem responder) = 1 − P(responder em todos os 5 dias) = 1 − [P(X≤3)]^5

lambda <- 30/7

pResponderEmUmDia <- ppois(3, lambda)
pResponderEmTodos5 <- pResponderEmUmDia^5

pPeloMenosUmDiaSemResponder <- 1 - pResponderEmTodos5

print(pPeloMenosUmDiaSemResponder) # 0.9921048

######
#  Q3)
######

# a)
set.seed(123)

lambda <- 30/7
n <- 1000000

dia1 <- rpois(n, lambda)
dia2 <- rpois(n, lambda)
dia3 <- rpois(n, lambda)
dia4 <- rpois(n, lambda)
dia5 <- rpois(n, lambda)

itemA <- mean(
    dia1 > 3 &
    dia2 > 3 &
    dia3 > 3 &
    dia4 > 3 &
    dia5 > 3
)

print(itemA) # 0.091704

# b)
set.seed(123)

lambda <- 30/7
n <- 1000000

dia1 <- rpois(n, lambda)
dia2 <- rpois(n, lambda)
dia3 <- rpois(n, lambda)
dia4 <- rpois(n, lambda)
dia5 <- rpois(n, lambda)

itemB <- mean(
    dia1 > 3 |
    dia2 > 3 |
    dia3 > 3 |
    dia4 > 3 |
    dia5 > 3
)

print(itemB) # 1

######
#  Q4)
######

# a) 0.3341407

# P((x = 2) | (X >= 1)) = P((X = 2) ∩ P(X > = 1)) / P(X >= 1) = P(X = 2) / P (X >= 1)

n <- 20
p <- 0.08

pxIgual2 <- dbinom(2, size = n, prob = p) # P(X=2)
pxMaiorIgual1 <- 1 - dbinom(0, size = n, prob = p) # P(X>=1)

probabilidade <- pxIgual2 / pxMaiorIgual1 # probabilidade condicional
print(probabilidade)

# b) 0.2188594
probabilidade <- dhyper(0, m = 6, n = 19, k = 5)
print(probabilidade)
# c) 0.009
probabilidade <- dgeom(2, prob = 0.9)
print(probabilidade)
# d) 0.00012, P(T>4)=(0.1)^4 = 0.0001
set.seed(123)
p <- 0.9
nsamples <- 100000
contador <- 0

for(i in 1:nsamples){
  t <- rgeom(1, p)  # falhas antes do sucesso
  if(t >= 4) { # verifica se demorou mais que 4 tentativas
    contador <- contador + 1
  }
}

probabilidade <- contador / nsamples # estimativa
print(probabilidade)




