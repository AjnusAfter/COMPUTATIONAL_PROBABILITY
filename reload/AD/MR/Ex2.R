
nSamples = 1000000
contA <- 0
contB <- 0

for (i in 1:nSamples)
{
  moedaRed = sample(c("CA","CO"), 1, prob=c(2/5,3/5))
  moedaGreen = sample(c("CA","CO"), 1, prob=c(2/5,3/5))
  moedaBlue = sample(c("CA","CO"), 1, prob=c(2/5,3/5))
  
  # (((moedaRed == "CA") & (moedaGreen == "CO")) | ((moedaRed == "CO") & (moedaGreen == "CA")))
  if (moedaRed != moedaGreen)
  {
    contA <- contA + 1
  }
  
  # if ((moedaGreen == "CO") & (MoedaBlue == "CO"))
  if ((moedaGreen == "CO") & (moedaBlue == moedaGreen))
  {
    contB <- contB + 1
  }
}

PA = contA / nSamples
PB = contB / nSamples

sprintf("P(A): %f", PA)
sprintf("P(B): %f", PB)
