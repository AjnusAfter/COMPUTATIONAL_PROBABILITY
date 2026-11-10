# A
p = 0.08 # de er reprovado
n = 20

pPeloMenosUm <- 1 - dbinom(0, n, p)
pExatamenteDois <- dbinom(2, n, p)

probabilidade <- pExatamenteDois / pPeloMenosUm
print(probabilidade)

# -------------------------------------
# b) 0.2188594dbin
probabilidade <- dhyper(0, m = 6, n = 19, k = 5)
print(probabilidade)
# c) 0.009
probabilidade <- dgeom(2, prob = 0.9)
print(probabilidade)
# d) 0.00012, P(T>4)=(0.1)^4 = 0.0001
set.seed(123)
p <- 0.9
nsamples <- 100000
contador <- 0

for(i in 1:nsamples){
  t <- rgeom(1, p)  # falhas antes do sucesso
  if(t >= 4) { # verifica se demorou mais que 4 tentativas
    contador <- contador + 1
  }
}

probabilidade <- contador / nsamples # estimativa
print(probabilidade)