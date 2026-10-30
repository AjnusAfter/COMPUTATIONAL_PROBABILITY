

set.seed(42)
nsamples <- 1000000
plano <- character(nsamples)
faixa <- character(nsamples)
sinistro <- logical(nsamples)

for (i in 1:nsamples) {
  
  u <- runif(1) # Sorteia o plano
  if (u <= 0.60) {
    plano[i] <- "A"
  } else {
    plano[i] <- "B"
  }
  
  u <- runif(1) # Sorteia a faixa etária de acordo com o plano
  if (plano[i] == "A") {
    if (u <= 0.30) {
      faixa[i] <- "Ate30"
    } else {
      faixa[i] <- "Acima30"
    }
  } else {
    if (u <= 0.50) {
      faixa[i] <- "Ate30"
    } else {
      faixa[i] <- "Acima30"
    }
  }
  
  u <- runif(1) # Sorteia a ocorrência de sinistro
  if (plano[i] == "A" && faixa[i] == "Ate30") {
    sinistro[i] <- u <= 0.03
  }
  if (plano[i] == "A" && faixa[i] == "Acima30") {
    sinistro[i] <- u <= 0.015
  }
  if (plano[i] == "B" && faixa[i] == "Ate30") {
    sinistro[i] <- u <= 0.06
  }
  if (plano[i] == "B" && faixa[i] == "Acima30") {
    sinistro[i] <- u <= 0.04
  }
}

# P(B | Sinistro)
p1 <- sum(plano == "B" & sinistro) / sum(sinistro)
print(p1)

# P(Até 30 anos | Sinistro)
p2 <- sum(faixa == "Ate30" & sinistro) / sum(sinistro)
print(p2)

# P(B | Sinistro e Até 30 anos)
p3 <- sum(plano == "B" & faixa == "Ate30" & sinistro) / sum(faixa == "Ate30" & sinistro)
print(p3)
