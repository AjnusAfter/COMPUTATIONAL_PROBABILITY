nSamples <- 100000

contSemDefeito <- 0
contComDefeito <- 0

contSemManutencao <- 0
contComManutencao <- 0

contSemManutencaoSemDefeito <- 0
contSemManutencaoComDefeito <- 0
contComManutencaoSemDefeito <- 0
contComManutencaoComDefeito <- 0

contSemManutencaoComDefeitoC1 <- 0
contComManutencaoComDefeitoC1 <- 0
contSemManutencaoComDefeitoC2 <- 0
contComManutencaoComDefeitoC2 <- 0
contSemManutencaoComDefeitoC3 <- 0
contComManutencaoComDefeitoC3 <- 0
contSemManutencaoComDefeitoC4 <- 0
contComManutencaoComDefeitoC4 <- 0

for (i in 1:nSamples)
{
  workwork_efetuaManutencao <- sample(c(T,F), 1, prob = c(0.4, 0.6))
  
  if (workwork_efetuaManutencao == T)
  {
    contComManutencao <- contComManutencao +1
    
    apresentouDefeitoC1 <- sample(c("C1","SD"), 1, prob = c(0.04, 0.96))
    apresentouDefeitoC2 <- sample(c("C2","SD"), 1, prob = c(0.04, 0.96))
    apresentouDefeitoC3 <- sample(c("C3","SD"), 1, prob = c(0.03, 0.97))
    apresentouDefeitoC4 <- sample(c("C4","SD"), 1, prob = c(0.03, 0.97))
    
    if (apresentouDefeitoC1 == "C1")
    {
          contComManutencaoComDefeitoC1 <- contComManutencaoComDefeitoC1 +1
    }
    if (apresentouDefeitoC2 == "C2")
    {
      contComManutencaoComDefeitoC2 <- contComManutencaoComDefeitoC2 +1
    }
    if (apresentouDefeitoC3 == "C3")
    {
      contComManutencaoComDefeitoC3 <- contComManutencaoComDefeitoC3 +1
    }
    if (apresentouDefeitoC4 == "C4")
    {
      contComManutencaoComDefeitoC4 <- contComManutencaoComDefeitoC4 +1
    }
    
    if ((apresentouDefeitoC1 == "SD") && (apresentouDefeitoC2 == "SD") && (apresentouDefeitoC3 == "SD") && (apresentouDefeitoC4 == "SD"))
    {
      contComManutencaoSemDefeito <- contComManutencaoSemDefeito +1
    }
    else
    {
      contComManutencaoComDefeito <- contComManutencaoComDefeito +1
    }
  }
  else
  {
    contSemManutencao <- contSemManutencao +1
    
    apresentouDefeitoC1 <- sample(c("C1","SD"), 1, prob = c(0.04, 0.96))
    apresentouDefeitoC2 <- sample(c("C2","SD"), 1, prob = c(0.04, 0.96))
    apresentouDefeitoC3 <- sample(c("C3","SD"), 1, prob = c(0.06, 0.94))
    apresentouDefeitoC4 <- sample(c("C4","SD"), 1, prob = c(0.06, 0.94))
    
    if (apresentouDefeitoC1 == "C1")
    {
      contSemManutencaoComDefeitoC1 <- contSemManutencaoComDefeitoC1 +1
    }
    if (apresentouDefeitoC2 == "C2")
    {
      contSemManutencaoComDefeitoC2 <- contSemManutencaoComDefeitoC2 +1
    }
    if (apresentouDefeitoC3 == "C3")
    {
      contSemManutencaoComDefeitoC3 <- contSemManutencaoComDefeitoC3 +1
    }
    if (apresentouDefeitoC4 == "C4")
    {
      contSemManutencaoComDefeitoC4 <- contSemManutencaoComDefeitoC4 +1
    }
    
    if ((apresentouDefeitoC1 == "SD") && (apresentouDefeitoC2 == "SD") && (apresentouDefeitoC3 == "SD") && (apresentouDefeitoC4 == "SD"))
    {
      contSemManutencaoSemDefeito <- contSemManutencaoSemDefeito +1
    }
    else
    {
      contSemManutencaoComDefeito <- contSemManutencaoComDefeito +1
    }
  }
}

contSemDefeito <- contComManutencaoSemDefeito + contSemManutencaoSemDefeito
contComDefeito <- contComManutencaoComDefeito + contSemManutencaoComDefeito

#ai
print(sprintf("Probabilidade de apresentar defeito: %f", contComDefeito / nSamples))

#aii
print(sprintf("Probabilidade de sem manutenção apresentar defeito: %f", contSemManutencaoComDefeito / contSemManutencao))

#aiii
print(sprintf("Probabilidade de com manutenção apresentar defeito: %f", contComManutencaoComDefeito / contComManutencao))

#bi
print(sprintf("Probabilidade de ter sido feita manutenção dado que apresentou o defeito C1: %f", contComManutencaoComDefeitoC1/(contComManutencaoComDefeitoC1 + contSemManutencaoComDefeitoC1)))

#bii
print(sprintf("Probabilidade de ter sido feita manutenção dado que apresentou o defeito C3: %f", contComManutencaoComDefeitoC3/(contComManutencaoComDefeitoC3 + contSemManutencaoComDefeitoC3)))

# defeitos <- c(C1,C2,C3,C4)
# probsSManutencao <- c(0.4, 0.4, 0.6, 0.6)
# probsCManutencao <- c(0.4, 0.4, 0.3, 0.3)
# nSamples <- 1000000
# 
# equipamento <- sample(defeitos, 1, prob=probsSManutencao)

