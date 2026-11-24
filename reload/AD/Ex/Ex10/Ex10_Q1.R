# 1
lambda <- 10 # por hora

# A
dpois(7, lambda)

# B
lambda6min <- lambda / 10
1 - dpois(0, lambda6min)

# C
tempo.esperado <- 1 / lambda
print(tempo.esperado)

# D
1 - pexp(15/60, lambda)

# E 
par(mfrow = c(1,2))

# O gráfico da Distribuição Poisson modela o NÚḾERO DE EVENTOS em um intervalo de tempo fixo.
intervalo <- 0:40
barplot(names.arg=intervalo,
        height=dpois(intervalo, lambda),
        col = 3,
        border = 1,
        main = "Número de chamadas por hora - Distribuição Poisson",
        xlab = "Número de chamadas (k)",
        ylab = "P(X = k)")

# O gráfico da Distribuição Exponencial modela O TEMPO entre dois eventos consecutivos.
t <- seq(0, 1, length.out = 1000)
ft <- lambda*exp(-lambda*t)
plot(t,
     ft,
     type = "l",
     col = 4,
     main = "Tempo entre chamadas - Distribuição Exponencial",
     xlab = "Tempo entre chamadas (horas)",
     ylab = "Densidade de probablildade",
     lwd = 2)


# F
t5 <- 5/60    # horas
t15 <- 15/60  # horas

# P(T > 15 | T > 5) = P(T > 15 inter T > 5) / P(T > 5) = P(T > 15) / P(T > 5)
pTmaior15 <- 1 - pexp(t15, lambda)
pTmaior5  <- 1 - pexp(t5, lambda)

probabilidadeF <- pTmaior15 / pTmaior5
print(probabilidadeF)

# "falta de memória:" o tempo esperado NÃO influencia o tempo que falta esperar
# oposto de 'esperar ônibus chegar'