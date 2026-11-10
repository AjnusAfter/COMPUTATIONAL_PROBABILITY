BR_DESTRO = 8
IT_DESTRO = 7
BR = 10
IT = 10

SELECTED = 7
BR_SELECTED = 3
IT_SELECTED = 4

# A

#D: os 3 BR são destros
#E: os 3 IT são destros
#F: pelo menos um nadador entre os 7 não é destro

# P(F) = 1 - P(D)*P(E)

# P(D) = P(X=3)
PD <- dhyper(BR_SELECTED, BR_DESTRO, BR-BR_DESTRO, BR_SELECTED)

# P(E) = P(X=4)
PE <- dhyper(IT_SELECTED, IT_DESTRO, IT-IT_DESTRO, IT_SELECTED)

PF <- 1 - PD*PE

print(paste0("Probabilidade de pelo menos um não ser destro = ", PF))


# B
nSamples <- 10000
count.pelo.menos.um.nao.destro <- 0

for (i in 1:nSamples)
{
  n.nao.destros.BR <- rhyper(1, 2, 8, 3)
  
  n.nao.destros.IT <- rhyper(1, 3, 7, 4)
  
  if (n.nao.destros.BR + n.nao.destros.IT > 0)
  {
    count.pelo.menos.um.nao.destro <- count.pelo.menos.um.nao.destro+1
  }
}

prob.pelo.menos.um.nao.destro <- count.pelo.menos.um.nao.destro / nSamples
print(prob.pelo.menos.um.nao.destro)