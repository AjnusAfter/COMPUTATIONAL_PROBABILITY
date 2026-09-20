
nsamples <- 100000
contA <- 0
contB <- 0
moeda <- c("CA","CO")

for (i in 1:nsamples) {
  
  face1 <- sample(moeda, 1, prob = c(2/5, 3/5))
  face2 <- sample(moeda, 1, prob = c(2/5, 3/5))
  face3 <- sample(moeda, 1, prob = c(2/5, 3/5))
  
  if (((face1 == "CA") & (face2 == "CO")) | ((face1 == "CO") & (face2 == "CA"))) {
    contA <- contA + 1
  }
  
  if ((face2 == "CO") & (face3 == "CO")) {
    contB <- contB + 1
  }

}

PA <- contA / nsamples
print(PA)

PB <- contB / nsamples
print(PB)

