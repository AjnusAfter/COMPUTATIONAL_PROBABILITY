######
# Q1)
######

set.seed(123)

nsamples <- 10000
PFNaoAjustado <- 3500

PFAjustadoTotal <- numeric(nsamples)
tempoSemanasTotal <- numeric(nsamples)
custoTotal <- numeric(nsamples)

for (simulacao in 1:nsamples) {
  distribuicaoDados <- sample(c(2,3,4), 1, prob=c(0.20,0.60,0.20))
  desempenho <- sample(c(3,4,5), 1, prob=c(0.10,0.70,0.20))
  reusabilidade <- sample(c(1,2,3), 1, prob=c(0.10,0.70,0.20))
  complexidade <- sample(c(2,3,4,5), 1, prob=c(0.10,0.60,0.20,0.10))
  
  outrasCaracteristicas <- 0
  for (j in 1:10) {
    outrasCaracteristicas <- outrasCaracteristicas + sample(c(1,2,3), 1, prob=c(0.20,0.60,0.20))
  }
  
  somaCaracteristicas <- distribuicaoDados + desempenho + reusabilidade + complexidade + outrasCaracteristicas
  FA <- 0.65 + 0.01 * somaCaracteristicas
  PFAjustado <- PFNaoAjustado * FA
  
  # Produtividade (h/PF) e custo por hora
  produtividade <- sample(c(4,5,6), 1, prob=c(0.20,0.70,0.10))
  custoHora <- sample(c(80,100,120), 1, prob=c(0.20,0.60,0.20))
  
  tempoHoras <- PFAjustado * produtividade
  tempoSemanas <- tempoHoras / 40
  custo <- tempoHoras * custoHora
  
  PFAjustadoTotal[simulacao] <- PFAjustado
  tempoSemanasTotal[simulacao] <- tempoSemanas
  custoTotal[simulacao] <- custo
}

# a)
sprintf("PF ajustado médio: %.2f", mean(PFAjustadoTotal))

# b)
sprintf("Tempo médio (semanas): %.2f", mean(tempoSemanasTotal))

# c)
sprintf("Custo médio (R$): %.2f", mean(custoTotal))

# d)
sprintf("Probabilidade custo < R$ 1.500.000,00: %.2f", mean(custoTotal < 1500000))

# e)
sprintf("Probabilidade tempo < 450 semanas: %.2f ", mean(tempoSemanasTotal < 450))

# f)

par(mfrow = c(1, 3))
hist(PFAjustadoTotal, breaks=30, main="Distribuição do PF ajustado", xlab="PF ajustado")
hist(tempoSemanasTotal, breaks=30, main="Distribuição do Tempo (semanas)", xlab="Semanas")
hist(custoTotal, breaks=30, main="Distribuição do Custo (R$)", xlab="Custo (R$)")

######
# Q2)
######

set.seed(123)
nsamples <- 10000

# Quantidades fixas
EE_total <- 25
SE_total <- 20
CE_total <- 15
ALI_total <- 12
AIE_total <- 8

# Pesos IFPUG
pesosIFPUG <- list(
  EE = c(3,4,6),
  SE = c(4,5,7),
  CE = c(3,4,6),
  ALI = c(7,10,15),
  AIE = c(5,7,10)
)

# Probabilidades
complexidadeProbabilidade <- list(
  EE = c(0.30,0.50,0.20),
  SE = c(0.25,0.60,0.15),
  CE = c(0.40,0.40,0.20),
  ALI = c(0.20,0.50,0.30),
  AIE = c(0.35,0.45,0.20)
)

FAValor <- c(1.05, 1.15, 1.25)
FAProbabilidade <- c(0.2,0.6,0.2)
produtividadeValor <- c(4,5,6);
produtividadeProbabilidade <- c(0.20,0.60,0.20)
custoValor <- c(80,100,120)
custoProbabilidade <- c(0.20,0.60,0.20)
  
PFAjustadoTotal <- numeric(nsamples)
tempoSemanasTotal <- numeric(nsamples)
custoTotal <- numeric(nsamples)

for (simulacao in 1:nsamples) {
  PFNaoAjustado <- 0
  
  # Sorteio da complexidade de cada função
  for (j in 1:EE_total)
    PFNaoAjustado <- PFNaoAjustado + sample(pesosIFPUG$EE, 1, prob = complexidadeProbabilidade$EE)
  for (j in 1:SE_total)
    PFNaoAjustado <- PFNaoAjustado + sample(pesosIFPUG$SE, 1, prob = complexidadeProbabilidade$SE)
  for (j in 1:CE_total)
    PFNaoAjustado <- PFNaoAjustado + sample(pesosIFPUG$CE, 1, prob = complexidadeProbabilidade$CE)
  for (j in 1:ALI_total)
    PFNaoAjustado <- PFNaoAjustado + sample(pesosIFPUG$ALI, 1, prob = complexidadeProbabilidade$ALI)
  for (j in 1:AIE_total)
    PFNaoAjustado <- PFNaoAjustado + sample(pesosIFPUG$AIE, 1, prob = complexidadeProbabilidade$AIE)
  
  fatorAjuste <- sample(FAValor, 1, prob = FAProbabilidade)
  PFAjustado <- PFNaoAjustado * fatorAjuste
  
  produtividade <- sample(produtividadeValor, 1, prob = produtividadeProbabilidade)
  custoHora <- sample(custoValor, 1, prob = custoProbabilidade)
  
  tempoHoras <- PFAjustado * produtividade
  tempoSemanas <- tempoHoras / 40  
  custo <- tempoHoras * custoHora
  
  PFAjustadoTotal[simulacao] <- PFAjustado
  tempoSemanasTotal[simulacao] <- tempoSemanas
  custoTotal[simulacao] <- custo  
}

# a)
sprintf("PF ajustado médio: %.2f", mean(PFAjustadoTotal))

# b)
sprintf("Tempo médio (semanas): %.2f", mean(tempoSemanasTotal))

# c)
sprintf("Custo médio (R$): %.2f", mean(custoTotal))

# d)
sprintf("Probabilidade custo < R$ 280.000,00: %.2f", mean(custoTotal < 280000))

# e)
sprintf("Probabilidade tempo < 60 semanas: %.2f ", mean(tempoSemanasTotal < 60))

# f)

par(mfrow = c(1, 3))
hist(PFAjustadoTotal, breaks=30, main="Distribuição do PF ajustado", xlab="PF ajustado")
hist(tempoSemanasTotal, breaks=30, main="Distribuição do Tempo (semanas)", xlab="Semanas")
hist(custoTotal, breaks=30, main="Distribuição do Custo (R$)", xlab="Custo (R$)")

######
# Q3)
######

set.seed(123)

# Definir a matriz de transição
P <- matrix(c(0.6, 0.3, 0.1,
              0.2, 0.5, 0.3,
              0.1, 0.3, 0.6), byrow = TRUE, nrow = 3)

# Número de simulações
nsamples <- 100000
estado_inicial <- 2
estados <- numeric(nsamples)
estados[1] <- estado_inicial

# Simulação da cadeia
for (i in 2:nsamples) {
  estados[i] <- sample(1:3, size = 1, prob = P[estados[i-1], ])
}

# Frequência relativa
frequencia_relativa <- table(estados) / length(estados)
barplot(frequencia_relativa, main = "Frequência relativa dos estados")
#      1       2       3 
#0.27568 0.37333 0.35099 
