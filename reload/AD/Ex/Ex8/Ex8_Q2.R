p = 0.1
n = 10

# A.1 (exatamente 3 mouses defeituosos)
dbinom(3, n, p)

#A.2 (mais de 2 mouses defeituosos)
1 - pbinom(2, n, p)

#A.3 (até 4 mouses defeituosos)
pbinom(4, n, p)


# B
vetor.probabilidade <- dbinom(0:10, n, p)
vetor.probabilidade

# bônus
plot(
  0:10,
  vetor.probabilidade,
  main = "Distribuição do número de mouses defeituosos",
  xlab = "Número de mouses defeituosos",
  ylab = "Probabilidade",
  type = "h",
  lwd = 3
)

# C
nSamples <- 1000000
count.com.defeito <- 0 
count.sem.defeito <- 0
freq.mouses.defeituosos <- rep(0, 10)
for (i in 1:nSamples)
{
  #sorteia quantos mouses de 10 são defeituosos
  count.com.defeito <- rbinom(1, n, p)
  
  if (count.com.defeito > 0)
  {
    freq.mouses.defeituosos[count.com.defeito] <- freq.mouses.defeituosos[count.com.defeito]+1
  }
  else
  {
    count.sem.defeito <- count.sem.defeito+1
  }
}

# C.1
prob.tres.defeituosos <- freq.mouses.defeituosos[3] / nSamples
print(prob.tres.defeituosos)

# C.2
prob.mais.de.dois.defeituosos <- sum(freq.mouses.defeituosos[3:10]) / nSamples
print(prob.mais.de.dois.defeituosos)

# C.2
prob.no.maximo.quatro.defeituosos <- (count.sem.defeito + sum(freq.mouses.defeituosos[1:4])) / nSamples
print(prob.no.maximo.quatro.defeituosos)




