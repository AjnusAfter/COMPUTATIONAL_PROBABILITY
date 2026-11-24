# Ele diz que, sob condições gerais, a distribuição das médias amostrais se aproxima de uma distribuição Normal quando o tamanho da amostra aumenta, mesmo que a população original não tenha distribuição Normal.
# Exemplo em R
# Vamos considerar uma população com distribuição Exponencial, cuja distribuição original não é Normal.

set.seed(123)

n <- 30       # Tamanho de cada amostra
N <- 10000    # Número de amostras

medias <- numeric(N)

for (i in 1:N) {
  X <- rexp(n, rate = 2)
  medias[i] <- mean(X)
}

hist(medias, probability = TRUE, breaks = 50,
     main = "Teorema do Limite Central",
     xlab = "Médias amostrais")

curve(dnorm(x, mean = 0.5, sd = sqrt(0.25/n)),
      add = TRUE, col = "red", lwd = 2)

grid()


# O que está acontecendo?
#
# 1. rexp(n, rate = 2) gera uma amostra de 30 valores de uma
#    distribuição Exponencial com taxa λ = 2.
#
# 2. mean(X) calcula a média dos 30 valores gerados.
#
# 3. Repetimos esse processo 10.000 vezes, obtendo 10.000 médias
#    amostrais.
#
# 4. Construímos um histograma dessas médias para observar sua
#    distribuição.
#
# Por que a curva Normal aparece?
#
# A distribuição Exponencial utilizada possui:
#
# E(X) = 1/λ = 1/2 = 0,5
#
# Var(X) = 1/λ² = 1/2² = 0,25
#
# Pelo Teorema do Limite Central (TLC), quando o tamanho da amostra
# aumenta, a distribuição das médias amostrais se aproxima de uma
# distribuição Normal, com média igual a E(X) e variância igual a
# Var(X)/n.
#
# Neste exemplo, como n = 30:
#
# X̄ ≈ N(0,5; 0,25/30)
#
# Resultado esperado:
#
# O histograma das 10.000 médias amostrais terá formato
# aproximadamente Normal, embora os valores originais tenham sido
# gerados a partir de uma distribuição Exponencial.