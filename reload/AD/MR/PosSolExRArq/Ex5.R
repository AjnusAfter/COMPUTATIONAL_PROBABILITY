nsamples <- 10000
contsemdefeito <- 0
contcomdefeito <- 0
contcommanutencao <- 0
contsemmanutencao <- 0
contcommanutencaosemdefeito <- 0
contcommanutencaocomdefeito <- 0
contsemmanutencaosemdefeito <- 0
contsemmanutencaocomdefeito <- 0
contcommanutencaocomdefeitoC1 <- 0
contsemmanutencaocomdefeitoC1 <- 0
contcommanutencaocomdefeitoC2 <- 0
contsemmanutencaocomdefeitoC2 <- 0
contcommanutencaocomdefeitoC3 <- 0
contsemmanutencaocomdefeitoC3 <- 0
contcommanutencaocomdefeitoC4 <- 0
contsemmanutencaocomdefeitoC4 <- 0
for (i in 1:nsamples) {
  efetuamanutencao <- sample(c(T, F), 1, prob = c(0.4, 0.6))
  if (efetuamanutencao == T) {
    contcommanutencao <- contcommanutencao + 1
    apresentoudefeitoC1 <- sample(c("C1", "SD"), 1, prob = c(0.04, 0.96))
    apresentoudefeitoC2 <- sample(c("C2", "SD"), 1, prob = c(0.04, 0.96))
    apresentoudefeitoC3 <- sample(c("C3", "SD"), 1, prob = c(0.03, 0.97))
    apresentoudefeitoC4 <- sample(c("C4", "SD"), 1, prob = c(0.03, 0.97))
    
    if (apresentoudefeitoC1 == "C1") {
      contcommanutencaocomdefeitoC1 <- contcommanutencaocomdefeitoC1 + 1 
    }
    if (apresentoudefeitoC2 == "C2") {
      contcommanutencaocomdefeitoC2 <- contcommanutencaocomdefeitoC2 + 1 
    }
    if (apresentoudefeitoC3 == "C3") {
      contcommanutencaocomdefeitoC3 <- contcommanutencaocomdefeitoC3 + 1 
    }
    if (apresentoudefeitoC4 == "C4") {
      contcommanutencaocomdefeitoC4 <- contcommanutencaocomdefeitoC4 + 1 
    }
    
    if ((apresentoudefeitoC1 == "SD") && (apresentoudefeitoC2 == "SD") && (apresentoudefeitoC3 == "SD") && (apresentoudefeitoC4 == "SD")) {
      contcommanutencaosemdefeito <- contcommanutencaosemdefeito + 1
    } else {
      contcommanutencaocomdefeito <- contcommanutencaocomdefeito + 1
    }
    
  } else {
    contsemmanutencao <- contsemmanutencao + 1
    apresentoudefeitoC1 <- sample(c("C1", "SD"), 1, prob = c(0.04, 0.96))
    apresentoudefeitoC2 <- sample(c("C2", "SD"), 1, prob = c(0.04, 0.96))
    apresentoudefeitoC3 <- sample(c("C3", "SD"), 1, prob = c(0.06, 0.94))
    apresentoudefeitoC4 <- sample(c("C4", "SD"), 1, prob = c(0.06, 0.94))
    
    if (apresentoudefeitoC1 == "C1") {
      contsemmanutencaocomdefeitoC1 <- contsemmanutencaocomdefeitoC1 + 1 
    }
    if (apresentoudefeitoC2 == "C2") {
      contsemmanutencaocomdefeitoC2 <- contsemmanutencaocomdefeitoC2 + 1 
    }
    if (apresentoudefeitoC3 == "C3") {
      contsemmanutencaocomdefeitoC3 <- contsemmanutencaocomdefeitoC3 + 1 
    }
    if (apresentoudefeitoC4 == "C4") {
      contsemmanutencaocomdefeitoC4 <- contsemmanutencaocomdefeitoC4 + 1 
    }
    
    if ((apresentoudefeitoC1 == "SD") && (apresentoudefeitoC2 == "SD") && (apresentoudefeitoC3 == "SD") && (apresentoudefeitoC4 == "SD")) {
      contsemmanutencaosemdefeito <- contsemmanutencaosemdefeito + 1
    } else {
      contsemmanutencaocomdefeito <- contsemmanutencaocomdefeito + 1
    }  
  }
}

contsemdefeito <- contcommanutencaosemdefeito + contsemmanutencaosemdefeito
contcomdefeito <- contcommanutencaocomdefeito + contsemmanutencaocomdefeito

#ai
print(contcomdefeito/nsamples)

#aii
print(contsemmanutencaocomdefeito/contsemmanutencao)

#aiii
print(contcommanutencaocomdefeito/contcommanutencao)

#bi
print(contcommanutencaocomdefeitoC1/(contcommanutencaocomdefeitoC1 + contsemmanutencaocomdefeitoC1))

#bii
print(contcommanutencaocomdefeitoC3/(contcommanutencaocomdefeitoC3 + contsemmanutencaocomdefeitoC3))
