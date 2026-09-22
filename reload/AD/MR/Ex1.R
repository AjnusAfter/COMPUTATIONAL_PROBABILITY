#a

totalCombinacoes = 2 * 6
print(totalCombinacoes)

#b
#analítica
fisicoQuatro = (1/2) * (1/6)
print(fisicoQuatro)

#simulação
nSamples <- 100000
contB <- 0
  
for (i in 1:nSamples)
{
  faceMoeda <- sample(c("CA", "CO"), 1, prob=c(1/2, 1/2))
  faceDado <- sample(c("1","2","3","4","5","6"), 1, prob=c(1/6,1/6,1/6,1/6,1/6,1/6))
  
  if ((faceMoeda == "CA") & (faceDado == "4"))
  {
    contB <- contB + 1
  }
}

PB <- contB / nsamples
print(PB)

#c
#analítica
fisicoQuatroWeird = (2/3) * (1/6)
print(fisicoQuatroWeird)

#simulação
nSamples <- 100000
contC <- 0

for (i in 1:nSamples)
{
  faceMoeda = sample(c("CA","CO"), 1, prob=c(2/3,1/3))
  faceDado = sample(c("1","2","3","4","5","6"), 1, prob=c(1/6,1/6,1/6,1/6,1/6,1/6))
  
  if ((faceMoeda == "CA") & (faceDado == "4"))
  {
    contC <- contC + 1
  }
}

PC <- contC / nSamples
print(PC)