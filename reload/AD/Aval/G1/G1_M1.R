#############
# 1)
#############

# F V F F V V

#############
# 2)
#############

# d)

set.seed(123)

# Número de transações simuladas
N <- 100000

# Contadores
totalSuspeitas <- 0
totalNaoSuspeitas <- 0

fraudesSuspeitas <- 0
legitimasNaoSuspeitas <- 0

for (i in 1:N) {
  
  # Simula a ocorrência de fraude
  fraude <- runif(1) < 0.19
  
  # Simula a classificação realizada pelo sistema
  if (fraude) {
    suspeita <- runif(1) < 0.95
  } else {
    suspeita <- runif(1) < 0.17
  }
  
  # Contabiliza os resultados
  if (suspeita) {
    
    totalSuspeitas <- totalSuspeitas + 1
    
    if (fraude) {
      fraudesSuspeitas <- fraudesSuspeitas + 1
    }
    
  } else {
    
    totalNaoSuspeitas <- totalNaoSuspeitas + 1
    
    if (!fraude) {
      legitimasNaoSuspeitas <- legitimasNaoSuspeitas + 1
    }
  }
}

# Probabilidade de fraude dado que a transação é suspeita
p1 <- fraudesSuspeitas / totalSuspeitas

# Probabilidade de ser legítima dado que não é suspeita
p2 <- legitimasNaoSuspeitas / totalNaoSuspeitas

# Apresenta os resultados
cat("P(Fraude | Suspeita):", round(p1 * 100, 2), "%\n") # 56.51 %
cat("P(Legítima | Não suspeita):", round(p2 * 100, 2), "%\n") # 98.66 %


#############
# 3)
#############

simulaEpidemiaModelo <- function(populacao = 10000, infectadosIniciais = 10, 
                                 taxaT = 0.05, taxaP = 0.2, taxaR = 0.1,
                                 dias = 365) {
  
  S <- populacao - infectadosIniciais
  E <- 0
  I <- infectadosIniciais
  R <- 0  
  
  # Vetores para armazenar histórico
  vetorS <- NULL
  vetorE <- NULL
  vetorI <- NULL
  vetorR <- NULL
  
  for (dia in 1:dias) {
    
    S_para_E <- 0
    E_para_I <- 0
    I_para_R <- 0
    
    if (S > 0) {
      for (pS in 1:S) {
        contatos <- sample(c(3, 4, 5), 1, prob = c(0.10, 0.30, 0.60))
        for (contato in 1:contatos) {
          contatoI <- sample(c("S", "E", "I", "R"), 1, prob = c(S/populacao, E/populacao, I/populacao, R/populacao))
          if (contatoI == "I") {
            exposto <- sample(c(TRUE, FALSE), 1, prob = c(taxaT, 1 - taxaT))
            if (exposto) {
              S_para_E <- S_para_E + 1
              break
            }
          }
        }
      }
    }
    
    if (E > 0) {
      for (pE in 1:E) {
        infectado <- sample(c(TRUE, FALSE), 1, prob = c(taxaP, 1 - taxaP))
        if (infectado) {
          E_para_I <- E_para_I + 1
        }
      }  
    }
    
    if (I > 0) {
      for (pI in 1:I) {
        recuperado <- sample(c(TRUE, FALSE), 1, prob = c(taxaR, 1 - taxaR))
        if (recuperado) {
          I_para_R <- I_para_R + 1
        }
      }  
    }
    
    # De forma mais direta
    # E_para_I <- E_para_I + sum(sample(c(TRUE, FALSE), E, prob = c(taxaP, 1 - taxaP), replace = T))
    # I_para_R <- I_para_R + sum(sample(c(TRUE, FALSE), I, prob = c(taxaR, 1 - taxaR), replace = T))  
    
    # Atualiza situações
    S <- S - S_para_E
    E <- E + S_para_E - E_para_I
    I <- I + E_para_I - I_para_R
    R <- R + I_para_R
    
    # Armazena histórico
    vetorS <- c(vetorS, S)
    vetorE <- c(vetorE, E)
    vetorI <- c(vetorI, I)
    vetorR <- c(vetorR, R)   
  }
  
  return(list(S = vetorS, E = vetorE, I = vetorI, R = vetorR))
}

# a)

set.seed(42)

populacao <- 10000

simulacao <- simulaEpidemiaModelo()
maximoPessoasInfectadas <- max(simulacao$I)
totalPessoasContrairam <- populacao - min(simulacao$S)
duracaoEpidemia <- sum(simulacao$I >= 1)

sprintf("Número máximo de pessoas infectadas simultaneamente: %d", maximoPessoasInfectadas) # 1316
sprintf("Total de pessoas que contraíram a doença: %d", totalPessoasContrairam) # 8647
sprintf("Duração total da epidemia (dias com I >= 1): %d", duracaoEpidemia) # 269

# b)

dias <- 1:length(simulacao$S)

plot(dias, simulacao$S,
     type = "l",
     col = "blue",
     lwd = 2,
     ylim = c(0, populacao),
     xlab = "Dias",
     ylab = "Número de pessoas",
     main = "Evolução da epidemia - Modelo SEIR")

lines(dias, simulacao$E, col = "orange", lwd = 2)
lines(dias, simulacao$I, col = "red", lwd = 2)
lines(dias, simulacao$R, col = "green", lwd = 2)

legend("right",
       legend = c("Suscetíveis", "Expostos", "Infectados", "Recuperados"),
       col = c("blue", "orange", "red", "green"),
       lty = 1,
       lwd = 2)

# c)

set.seed(42)

numeroSimulacoes <- 100
populacao <- 10000

vetorMaximo <- NULL
vetorContrairam <- NULL
vetorDuracao <- NULL

for (i in 1:numeroSimulacoes) {
  simulacao <- simulaEpidemiaModelo()
  vetorMaximo <- c(vetorMaximo, max(simulacao$I))
  vetorContrairam <- c(vetorContrairam, populacao - min(simulacao$S))
  vetorDuracao <- c(vetorDuracao, sum(simulacao$I >= 1))
}

hist(vetorMaximo, breaks = 30, main="Distribuição", xlab="Número máximo de pessoas infectadas")

mediaMaximoPessoasInfectadas <- mean(vetorMaximo)
mediaTotalPessoasContrairam <- mean(vetorContrairam)
mediaDuracaoEpidemia <- mean(vetorDuracao)

sprintf("Média do número máximo de pessoas infectadas simultaneamente: %f", mediaMaximoPessoasInfectadas) # 1322.360000
sprintf("Média do total de pessoas que contraíram a doença: %f", mediaTotalPessoasContrairam) # 8545.250000
sprintf("Média da duração total da epidemia (dias com I >= 1): %f", mediaDuracaoEpidemia) # 262.090000


#############
# 4)
#############

f <- function(x) {
  return(-x^2 + 10*x - 16) # raízes 2 e 8, maximo y = 9 
}

g <- function(x) {
  return(-2*x^2 + 28*x - 80) # raízes 4 e 10, máximo y = 18 
}

set.seed(123)
n <- 1000

# Limites do retângulo de simulação
xmin <- 2
xmax <- 10
ymin <- 0
ymax <- 18

# Geração dos pontos aleatórios
x <- runif(n, xmin, xmax)
y <- runif(n, ymin, ymax)

# Contagem dos pontos dentro da região
dentro <- 0

for (i in 1:n) {
  if (y[i] <= f(x[i]) && y[i] <= g(x[i])) {
    dentro <- dentro + 1
  }
}

# Estimativa da área
area_retangulo <- (xmax - xmin) * (ymax - ymin)
area_estimada <- area_retangulo * dentro / n

cat("Pontos dentro da região:", dentro, "\n") # 168 
cat("Área estimada:", area_estimada, "m²\n") # 24.192 m2

# Identificar os pontos dentro da região
dentro_regiao <- (y <= f(x)) & (y <= g(x))

# Plotar as funções
curve(f(x), from = xmin, to = xmax,
      col = "blue", lwd = 2,
      ylim = c(0, ymax),
      xlab = "x (m)", ylab = "y (m)",
      main = "Estimativa de área por Monte Carlo")

curve(g(x), from = xmin, to = xmax, col = "orange", lwd = 2, add = TRUE)

# Plotar os pontos fora da região
points(x[!dentro_regiao], y[!dentro_regiao], col = "red", pch = 16, cex = 0.5)

# Plotar os pontos dentro da região
points(x[dentro_regiao], y[dentro_regiao], col = "darkgreen", pch = 16, cex = 0.5)

legend("topright",
       legend = c("f(x)", "g(x)", "Dentro da região", "Fora da região"),
       col = c("blue", "orange", "darkgreen", "red"),
       lty = c(1, 1, NA, NA),
       pch = c(NA, NA, 16, 16),
       lwd = c(2, 2, NA, NA),
       bty = "n")

