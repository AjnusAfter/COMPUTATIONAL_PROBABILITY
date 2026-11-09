p = 0.85

# A
dgeom(3, p)

# B
# método 1
dgeom(0, p) + dgeom(1, p) + dgeom(2, p) + dgeom(3, p)

# método 2
ans=0
for (i in 0:3)
{
  ans = ans + dgeom(i, p) 
}
print(ans)

# método 3
pgeom(3, p)

# equivalem?
all.equal(dgeom(0, p) + dgeom(1, p) +dgeom(2, p) + dgeom(3, p), ans, pgeom(3, p))


# C
nSamples <- 10000
n.sem.falhas <- 0; freq.falhas <- rep(0, 100)
for (i in 1:nSamples)
{
  count.falhas.ate.sucesso <- rgeom(1, p)
  
  if (count.falhas.ate.sucesso > 0)
  {
    freq.falhas[count.falhas.ate.sucesso] <- freq.falhas[count.falhas.ate.sucesso]+1
  }
  else
  {
    n.sem.falhas <- n.sem.falhas+1
  }
}

# método 1
prob.ao.menos.quatro.tentativas.m1 <- 1 - (n.sem.falhas + sum(freq.falhas[1:2])) / nSamples 
print(prob.ao.menos.quatro.tentativas)

# método 2
prob.ao.menos.quatro.tentativas.m2 <- sum(freq.falhas[3:100]) / nSamples
print(prob.ao.menos.quatro.tentativas)

# confirmação
prob.ao.menos.quatro.tentativas.conf <- 1 - (dgeom (0, p) + dgeom (1, p) + dgeom (2, p))
print(prob.ao.menos.quatro.tentativas)

# equivalem?
all.equal(prob.ao.menos.quatro.tentativas.m1, prob.ao.menos.quatro.tentativas.m2, prob.ao.menos.quatro.tentativas.conf)