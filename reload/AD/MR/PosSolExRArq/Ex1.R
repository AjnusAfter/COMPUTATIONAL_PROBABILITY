# a)

totalCombinacoes <- 2 * 6
print(totalCombinacoes)

# b)

nsamples <- 10000000
contB <- 0

for (i in 1:nsamples) {
  
  faceMoeda <- sample(c("CA","CO"), 1, prob = c(1/2, 1/2))
  faceDado <- sample(c("1","2","3","4","5","6"), 1, prob = c(1/6, 1/6, 1/6, 1/6, 1/6, 1/6))

  if ((faceMoeda == "CA") & (faceDado == "4")) {
    contB <- contB + 1
  }
  
}

PB <- contB / nsamples
print(PB)

# c)

nsamples <- 10000000
contC <- 0

for (i in 1:nsamples) {
  
  faceMoeda <- sample(c("CA","CO"), 1, prob = c(2/3, 1/3))
  faceDado <- sample(c("1","2","3","4","5","6"), 1, prob = c(1/6, 1/6, 1/6, 1/6, 1/6, 1/6))
  
  if ((faceMoeda == "CA") & (faceDado == "4")) {
    contC <- contC + 1
  }
  
}

PC <- contC / nsamples
print(PC)
