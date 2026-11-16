mean = 81 # reais
sd   = 19
var  = sd^2
n    = 49

# A média da distribuição de amostras é igual à média da população.
m.dist = mean

# O erro padrão da média é igual ao desvio padrão populacional dividido pela raiz quadrada de 𝑛.
se = sd/sqrt(n)

# Já que o tamanho da amostra é maior que 30, a distribuição 
# das amostras pode ser aproximada por uma distribuição normal com:

curve(
  dnorm(x, m.dist, se),
  70,
  90,
  main = "Distribuição",
  ylab = "Probabilidade",
  col = 2
)