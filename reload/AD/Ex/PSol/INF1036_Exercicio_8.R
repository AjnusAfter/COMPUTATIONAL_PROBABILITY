#######################
# 1)
#######################

par(mfrow = c(1, 2))
x <- 0:12
fx <- dpois(x, 3)
plot(main = "Distribuição",
     x,
     fx,
     type = "h",
     xlab = "X",
     ylab = "f(x)",
     ylim = c(0, 0.25),
     lwd=4
)
axis(1, at=x, labels = x)
#axis(2, labels = x )
abline(v=seq(1,12), lty=3,lwd = 1)
grid(nx = NULL, ny = NULL, lty = 3, lwd = 1, col = "gray")
text(x, fx, round(fx, 2), cex = 1.2, pos = 3)

Fx <- ppois(x, 3)
plot(main = "Poisson (taxa = 3 / Km)",
     x,
     Fx,
     type = "s",
     xlab = "X",
     ylab = "F(x)",
     ylim = c(0, 1.2)     
)
abline(v=seq(1,12), lty=3,lwd = 1)
grid(nx = NULL, ny = NULL, lty = 3, lwd = 1, col = "gray")
par(mfrow = c(1, 1))

#######################
# 2)
######################

# a)
# a.1)
dbinom (3, 10, 0.1)

# a.2)
1 - pbinom (2, 10, 0.1)

# a.3)
pbinom (4, 10, 0.1)

# b)
vetor.probabilidade <- dbinom (0:10, 10, 0.1)
vetor.probabilidade

# c)
nsamples <- 1000000
namostra <- 10; cont.defeituoso <- 0; nmouses.sem.defeito <- 0; nmouses.defeituoso <- rep(0, 10)
for (i in 1:nsamples) {
  cont.defeituoso <- 0
  for (j in 1:namostra) { # seleciono 10 peças
    mouses.selecionado.defeituoso <- sample(c(T, F), 1, prob = c(0.1, 0.9))
    if (mouses.selecionado.defeituoso) {
      cont.defeituoso <- cont.defeituoso + 1
    }
  }
  if (cont.defeituoso > 0) { # nmouses.defeituoso[i] contém o total de peças i defeituosos
    nmouses.defeituoso[cont.defeituoso] <- nmouses.defeituoso[cont.defeituoso] + 1 
  } else {
    nmouses.sem.defeito <- nmouses.sem.defeito + 1 
  }
}

# c.1)
prob.tres.defeituoso <- nmouses.defeituoso[3]/nsamples
print(prob.tres.defeituoso)

# c.2)
prob.mais.dois.defeituosos <- sum(nmouses.defeituoso[3:10])/nsamples # filtro no vetor
print(prob.mais.dois.defeituosos)

# c.3)
prob.maximo.quatro.defeituosos <- (nmouses.sem.defeito + sum(nmouses.defeituoso[1:4]))/nsamples
print(prob.maximo.quatro.defeituosos)

#######################
# 3)
######################

# a)
dgeom (3, 0.85)

# b)
dgeom (0, 0.85) + dgeom (1, 0.85) + dgeom (2, 0.85) + dgeom (3, 0.85) 

# c)
nsamples <- 10000000
n.bem.sucedida <- 0; n.mal.sucedida <- rep(0, 100)
for (i in 1:nsamples) {
  regulagem <- rgeom(1, 0.85) # uso de rgeom com prob = 0.85 e pegando uma observação
  if (regulagem > 0) {
    n.mal.sucedida[regulagem] <- n.mal.sucedida[regulagem] + 1 
  } else {
    n.bem.sucedida <- n.bem.sucedida + 1 
  }
}
# 0.0033581
prob.ao.menos.quatro <- 1 - (n.bem.sucedida + sum(n.mal.sucedida[1:2])) / nsamples
print(prob.ao.menos.quatro)
# ou 0.0033581
prob.ao.menos.quatro <- sum(n.mal.sucedida[3:100]) / nsamples
print(prob.ao.menos.quatro)

# Para conferir
1 - (dgeom (0, 0.85) + dgeom (1, 0.85) + dgeom (2, 0.85))

###########################
# 4)
###########################

# a)

#D: os 3 nadadores selecionados da Brasil são destros.
#E: os 4 nadadores selecionados da Itália são destros.
#F: pelo menos um aluno entre os 7 selecionados não é destro.

#P(F) = 1 - P(D)*P(E)

# Cálculo da probabilidade de D:
#Seja X: número de nadadores destros entre os 3 selecionados da Brasil. X~Hgeom(8;10,3), M = 8, N = 10, n = 3
# P(D) = P(X=3)
PD <- dhyper(3, 8, 2, 3) # m = 8, n = 2 e k = 3. Quero que os 3 sejam destros.

# Cálculo da probabilidade de E:
#Seja X: número de nadadores destros entre os 4 selecionados da Itália. X~Hgeom(7;10,4), M = 7, N = 10, e n = 4
# P(E) = P(X=4)
PE <- dhyper(4, 7, 3, 4) # m = 7, n = 3 e k = 4. Quero que os 4 sejam destros.

# Então
PF <- 1 - PD*PE
print(paste0("Probabilidade de pelo menos um não ser destro = ", PF))

# b)
nsamples <- 100000 # número de simulações 
namostra.A <- 3 # número de nadadores selecionados da Brasil
namostra.B <- 4  # número de nadadores selecionados da Itália
cont.nao.destro.A <- 0 # número de nadadores destros na Brasil
cont.nao.destro.B <- 0 # número de nadadores destros na Itália
cont.pelomenos.um.nao.destro <- 0

for (i in 1:nsamples) {
  
  cont.nao.destro.A <- 0 
  cont.nao.destro.B <- 0 
  
  aluno.selecionado.destro <- sample(c(T,T,T,T,T,T,T,T,F,F), namostra.A, replace = F)  # 0.8 e 0.2, pois são 8 destros em 10 nadadores.
  for (j in 1:length(aluno.selecionado.destro)) {
    if (aluno.selecionado.destro[j] == FALSE) {
      cont.nao.destro.A <- cont.nao.destro.A + 1
    }
  }
  
  aluno.selecionado.destro <- sample(c(T,T,T,T,T,T,T,F,F,F), namostra.B, replace = F) # 0.7 e 0.3, pois são 7 destros em 10 nadadores. 
  for (j in 1:length(aluno.selecionado.destro)) {
    if (aluno.selecionado.destro[j] == FALSE) {
      cont.nao.destro.B <- cont.nao.destro.B + 1
    }
  }
  
  if ((cont.nao.destro.A + cont.nao.destro.B) > 0) { # pelo menos uma pessoa nao é destra
    cont.pelomenos.um.nao.destro <- cont.pelomenos.um.nao.destro + 1    
  }
  
}
probabilidade <- cont.pelomenos.um.nao.destro / nsamples
print(paste0("Probabilidade de pelo menos um não ser destro = ", probabilidade))


