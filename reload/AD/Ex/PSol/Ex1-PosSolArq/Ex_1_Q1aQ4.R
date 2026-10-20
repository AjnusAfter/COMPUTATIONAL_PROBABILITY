######
# Q1)
######

# a)

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

a <- 39373
c <- 0
M <- 2147483647
x0 <- 3

# a)

quantidadePersonagens <- 10
tamanhoAmostra <- quantidadePersonagens * 3  # 3 atributos por personagem

U <- LCG(x0, a, c, M, tamanhoAmostra)

forcaLCG <- U[seq(1, tamanhoAmostra, 3)] * (20 - 10) + 10
agilidadeLCG <- U[seq(2, tamanhoAmostra, 3)] * (15 - 5) + 5
inteligenciaLCG <- U[seq(3, tamanhoAmostra, 3)] * (18 - 8) + 8

# b)

forcaPadrao <- runif(10, min = 10, max = 20)
agilidadePadrao <- runif(10, min = 5,  max = 15)
inteligenciaPadrao <- runif(10, min = 8,  max = 18)


######
# Q2)
######

set.seed(123)

vidaInicial <- 1.0
totalHora <- 720
numeroSimulacao <- 1000

desgaste <- c(1, 2, 3)
reducaoDesgaste <- c(0.01, 0.03, 0.07)
probabilidadeDesgaste <- c(0.7, 0.2, 0.1)
custoDesgaste <- c(400, 500, 700)

probabilidadeFalhaTotal <- 0.002
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

# a) 14.47
sprintf("Média de substituições: %.2f", mediaSubstituicao) 

# b) R$ 9873.40
sprintf("Custo médio: R$ %.2f", mediaCusto)

# c) 1.46
sprintf("Média de falhas: %.2f", mediaFalha)


######
# Q3)
######

set.seed(123)

nsamples <- 1000
vitorias <- c(0, 0, 0) # A, B, C

vencedorDuelo <- function(p1, p2) {
  if ((p1 == 1) & (p2 == 2)) {
    prob <- 0.60
  } else if ((p1 == 2) & (p2 == 1)) {
    prob <- 0.40
  } else if ((p1 == 2) & (p2 == 3)) {
    prob <- 0.65
  } else if ((p1 == 3) & (p2 == 2)) {
    prob <- 0.35
  } else if ((p1 == 3) & (p2 == 1)) {
    prob <- 0.55
  } else if ((p1 == 1) & (p2 == 3)) {
    prob <- 0.45
  }
  
  if (runif(1) < prob) {
    return(p1)
  } else {
    return(p2)
  }
}

for (i in 1:nsamples) {
  descanso <- sample(c(1, 2, 3), size = 1, prob = c(0.4, 0.3, 0.3))
  
  if (descanso == 1) {
    p1 <- 2
    p2 <- 3
  } else if (descanso == 2) {
    p1 <- 1
    p2 <- 3
  } else {
    p1 <- 1
    p2 <- 2
  }
  
  vencedor1 <- vencedorDuelo(p1, p2)
  vencedor2 <- vencedorDuelo(vencedor1, descanso)
  
  vitorias[vencedor2] <- vitorias[vencedor2] + 1
}

probabilidades <- (vitorias / nsamples)
sprintf("Probabilidade de vitoria:")
sprintf("A = %.2f.", probabilidades[1]) # 0.37
sprintf("B = %.2f.", probabilidades[2]) # 0.35
sprintf("C = %.2f.", probabilidades[3]) # 0.28

######
# Q4)
######

set.seed(123)

# Parâmetros
n_dias <- 100
voos_por_dia <- 20
n_voos <- n_dias * voos_por_dia
capacidade <- 180
passagens_vendidas <- 190
taxa_voluntarios <- 0.25
comp_voluntaria <- 1000
comp_forcada <- 2500

# Pré-alocação dos vetores
presentes_total <- numeric(n_voos)
realocados_embarcados <- numeric(n_voos)
novos_embarcados <- numeric(n_voos)
excedentes <- numeric(n_voos)
voluntarios <- numeric(n_voos)
forcados <- numeric(n_voos)
custos <- numeric(n_voos)
overbooking <- logical(n_voos)

# Fila de espera inicial
fila <- 0

for (voo in 1:n_voos) {
  # Sorteio de presença
  probs <- runif(passagens_vendidas, 0.90, 0.95)
  presentes_novos <- sum(runif(passagens_vendidas) < probs)
  
  total_presentes <- fila + presentes_novos
  presentes_total[voo] <- total_presentes
  
  if (total_presentes > capacidade) {
    assentos_disponiveis <- capacidade
    realocados_embarcados[voo] <- min(fila, assentos_disponiveis) # fila
    assentos_restantes <- assentos_disponiveis - realocados_embarcados[voo]
    
    novos_embarcados[voo] <- min(presentes_novos, assentos_restantes)
    excedentes[voo] <- presentes_novos - novos_embarcados[voo]
    
    voluntarios[voo] <- floor(excedentes[voo] * taxa_voluntarios)
    forcados[voo] <- excedentes[voo] - voluntarios[voo]
    
    custos[voo] <- voluntarios[voo] * comp_voluntaria + forcados[voo] * comp_forcada
    fila <- voluntarios[voo] + forcados[voo] # Excedentes
    
    overbooking[voo] <- TRUE
  } else {
    realocados_embarcados[voo] <- fila
    novos_embarcados[voo] <- presentes_novos
    excedentes[voo] <- 0
    voluntarios[voo] <- 0
    forcados[voo] <- 0
    custos[voo] <- 0
    fila <- 0
    overbooking[voo] <- FALSE
  }
  
}

# Estatísticas
sprintf("Resultados da Simulação:")
sprintf("Taxa média de overbooking: %.2f%%", mean(overbooking) * 100) # 10.15%
sprintf("Média de passageiros por voo: %.2f", mean(presentes_total)) #175.96
sprintf("Total de excedentes: %d", sum(excedentes)) # 401
sprintf("Total de voluntários realocados: %d", sum(voluntarios)) # 22
sprintf("Total de forçados realocados: %d", sum(forcados)) # 379
sprintf("Custo total com compensações: R$ %.2f", sum(custos)) # R$ 969,500.00
sprintf("Custo médio diário: R$ %.2f", sum(custos) / n_dias) # R$ 9,695.00
