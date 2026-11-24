
# chamadas por hora
lambda <- 10

# a) 
probabilidadeA <- dpois(7, lambda)

# b)
# 6 minutos = 0.1 horas
lambda6minutos <- lambda * 0.1
probabilidadeB <- 1 - dpois(0, lambda6minutos)

# c) Tempo médio entre chamadas em horas
tempoMedio <- 1 / lambda

# d)
# 15 minutos = 0.25 horas; exponencial com taxa lambda
probabilidadeD <- 1 - pexp(0.25, lambda)

# e)

# O gráfico da Distribuição Poisson modela o número de eventos em um intervalo de tempo fixo.
intervalo <- 0:40
distribuicaoPoisson <- dpois(intervalo, lambda)
barplot(height = distribuicaoPoisson,
        names.arg = intervalo,
        col = "mediumseagreen",
        border = "black",
        main = "Número de chamadas por hora - Distribuição Poisson",
        xlab = "Número de chamadas (k)",
        ylab = "P(X = k)")

# O gráfico da Distribuição Exponencial modela o tempo entre dois eventos consecutivos.
t <- seq(0, 1, length = 1000)  
ft <- lambda * exp(-lambda * t)
plot(t, ft, type = "l", col="blue",
     main = "Tempo entre chamadas - Distribuição Exponencial",
     xlab = "Tempo entre chamadas (horas)",
     ylab = "Densidade de probabilidade")

# f)
t15 <- 15 / 60 # ajustando para horas
t5 <- 5 / 60   # ajustando para horas

# Cálculo da probabilidade condicional
# P(T > 15 | T > 5) = P(T > 15 inter T > 5) / P(T > 5) =  P(T > 15) / P(T > 5)
maior15 <- 1 - pexp(t15, lambda)
maior5  <- 1 - pexp(t5, lambda)

# Probabilidade condicional
probabilidadeF <- maior15 / maior5

# A distribuição exponencial possui a propriedade de "falta de memória", ou seja, o tempo já esperado não influencia o tempo que ainda falta esperar.
