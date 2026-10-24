#############
# 1)
#############

# a) V 
# Material 3, slide 20. Leis de De Morgan

# b) V
# Material 3, slide 12.

# c) F
# Material 5, slide 3.

# d) F
# Material 5, slide 13.
#P(R) = 0.20
#P(P) = 0.09
#P(ReP) = 0.05 
#P(R)*P(P) = 0.22 * 0.09 = 0.0198
# Como P(ReP) é diferente de P(R)*P(P) os eventos "sabem programadar em R" e
# "sabem programar em Python" não são independentes.

# e) V
# Material 5, slide 11. Probabilidade Total
#S = produção total da fábrica
#E1 = produção da máquina 1 => P(E1) = 0.25
#E2 = produção da máquina 2 => P(E2) = 0.35
#E3 = produção da máquina 3 => P(E3) = 0.40
#B = produção defeituosa => P(B) ?
#P(B/E1) = 0.05
#P(B/E2) = 0.04
#P(B/E3) = 0.02

#P(B) = P(B/E1)P(E1) + P(B/E2)P(E2) + P(B/E3)P(E3)

PB = 0.05*0.25 + 0.04*0.35 + 0.02*0.40
print(PB)

#############
# 2)
#############

set.seed(123)

nsamples <- 100000
cont.com.produto <- 0
cont.com.produto.avaliado.sem.produto <- 0
cont.com.produto.avaliado.com.produto <- 0
cont.sem.produto <- 0
cont.sem.produto.avaliado.sem.produto <- 0
cont.sem.produto.avaliado.com.produto <- 0

for (i in 1:nsamples) {
  possui.produto <- sample(c(T, F), 1, prob = c(0.08, 0.92))
  if (possui.produto) {
    cont.com.produto <- cont.com.produto + 1
    avaliado.com.produto <- sample(c(T, F), 1, prob = c(0.95, 0.05))
    if (avaliado.com.produto) {
      cont.com.produto.avaliado.com.produto <- cont.com.produto.avaliado.com.produto + 1 
    } else {
      cont.com.produto.avaliado.sem.produto <- cont.com.produto.avaliado.sem.produto + 1
    }
  } else {
    cont.sem.produto <- cont.sem.produto + 1
    avaliado.com.produto <- sample(c(T, F), 1, prob = c(0.15, 0.85))
    if (avaliado.com.produto) {
      cont.sem.produto.avaliado.com.produto <- cont.sem.produto.avaliado.com.produto + 1 
    } else {
      cont.sem.produto.avaliado.sem.produto <- cont.sem.produto.avaliado.sem.produto + 1
    }    
  }
}

#a) # 0.994461
prob.a <- (cont.sem.produto.avaliado.sem.produto / (cont.sem.produto.avaliado.sem.produto + cont.com.produto.avaliado.sem.produto))
sprintf("Probabilidade = %f.", prob.a)

#b) # 0.357395
prob.b <- (cont.com.produto.avaliado.com.produto / (cont.com.produto.avaliado.com.produto + cont.sem.produto.avaliado.com.produto))
sprintf("Probabilidade = %f.", prob.b)

#############
# 3)
#############

set.seed(123)

# Gasto R$ 286.73 Área = 0.19115

nsamples <- 100000
cont.dentro.area <- 0

for (i in 1:nsamples) {
  x <- runif(1)
  y <- runif(1)
  distancia <- sqrt((x - 0)^2 + (y - 0)^2)
  if ((distancia > 1) & (x > 0.5)) {
    cont.dentro.area <- cont.dentro.area + 1
  }
}

p.dentro.area <- cont.dentro.area / nsamples
area.total <- 1
area.cinza = p.dentro.area * area.total
altura <- 6
preco.concreto <- 250
gasto <- (area.cinza * altura) * preco.concreto
sprintf("Gasto total de R$ %.2f .", gasto)

#############
# 4)
#############

geraAleatoria <- function (p, nsamples) {
  x <- NULL
  u <- runif(nsamples)
  n <- length(p)
  for (i in 1:nsamples) {
    soma_prob <- p[1]
    for (j in 0:(n-1)) {
      if (u[i] <= soma_prob) {
        x <- c(x, j)
        break
      }
      soma_prob <- soma_prob + p[j + 2]
    }
  }
  return (x)
}

p <- c(0.2, 0.5, 0.3)
nsamples <- 100000
U <- geraAleatoria (p, nsamples)
hist(U, main = "Histograma")
print(table(U)/nsamples)  

#############
# 5)
#############

set.seed(123)

vidaInicial <- 1.0
totalHora <- 720
numeroSimulacao <- 1000

desgaste <- c(1, 2, 3) # Leve, Moderado, Severo
reducaoDesgaste <- c(0.01, 0.03, 0.06)
probabilidadeDesgaste <- c(0.7, 0.2, 0.1)
custoDesgaste <- c(300, 400, 800)

# Probabilidade Falha
a <- 0.0005
b <- 0.004
custoFalhaTotal <- 2000

custoSimulacao <- numeric(numeroSimulacao)
numeroSubstituicao <- numeric(numeroSimulacao)
numeroFalha <- numeric(numeroSimulacao)

for (simulacao in 1:numeroSimulacao) {
  vida <- vidaInicial
  custo <- 0
  substituicao <- 0
  falha <- 0
  
  for (hora in 1:totalHora) {
    
    # Verifica falha total aleatória
    probabilidadeFalhaTotal = a + b * (1 - vida)
    
    if (runif(1) < probabilidadeFalhaTotal) {
      custo <- custo + custoFalhaTotal
      substituicao <- substituicao + 1
      falha <- falha + 1
      vida <- vidaInicial
    } else {
      # Sorteia desgaste
      desgasteSelecionado <- sample(desgaste, size = 1, prob = probabilidadeDesgaste)
      vida <- vida - reducaoDesgaste[desgasteSelecionado]
      # Verifica se precisa substituir
      if (vida <= 0) {
        custo <- custo + custoDesgaste[desgasteSelecionado]
        substituicao <- substituicao + 1
        vida <- vidaInicial
      }      
    }
    
  }
  
  numeroSubstituicao[simulacao] <- substituicao
  custoSimulacao[simulacao] <- custo  
  numeroFalha[simulacao] <- falha
}

# Resultados agregados
mediaSubstituicao <- mean(numeroSubstituicao)
mediaCusto <- mean(custoSimulacao)
mediaFalha <- mean(numeroFalha)

# a) 13.72
sprintf("Média de substituições: %.2f", mediaSubstituicao) 

# b) R$ 9384.90
sprintf("Custo médio: R$ %.2f", mediaCusto)

# c) 1.76
sprintf("Média de falhas: %.2f", mediaFalha)
