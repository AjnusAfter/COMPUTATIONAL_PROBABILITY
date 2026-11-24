
# A

# Número de dias simulados
n <- 10000

# Geração de variáveis uniformes
U <- runif(n, 0, 1)

# Geração da demanda diária (em milhares de unidades)
X <- (8 * U)^(1/3)

# Verificar em quantos dias a demanda excede o estoque disponível (1.2 mil unidades)
faltouProduto <- X > 1.2

# Estimar a probabilidade de falta de produto
probabilidade <- mean(faltouProduto)

cat("Estimativa de P(X > 1.2):", 
    round(probabilidade, 4), "\n")


# Possível solução 2

fx <- function(x)
{
  return ((3 * x^2) / 8)
}

a <- 1.2  # Limite inferior
b <- 2    # Limite superior

resultado <- integrate(fx, lower = a, upper = b)
print(resultado)

probabilidade <- resultado$value
erro <- resultado$abs.error

cat("Estimativa de P(X > 1.2):",
    round(probabilidade, 4),
    "Erro estimado:", erro, "\n")



# b) Simulação da operação por 30 dias

# Parâmetros
N <- 30                      # número de dias
S_max <- 2.0                 # estoque máximo (mil unidades)
R <- 1.4                     # quantidade reposta diariamente (mil unidades)
estoque <- 1.6               # estoque inicial (mil unidades)

demandaTotal <- 0
atendidaTotal <- 0
diasFalta <- 0

estoquesFinais <- numeric(N)
estoquesIniciais <- numeric(N)
demandas <- numeric(N)
atendimentos <- numeric(N)
naoAtendimentos <- numeric(N)

# Simulação para N dias
for (i in 1:N)
{
  # Gerando demanda aleatória via método da inversa
  U <- runif(1)
  demanda <- (8 * U)^(1/3)
  
  estoquesIniciais[i] <- estoque
  
  # Registrando a demanda
  demandaTotal <- demandaTotal + demanda
  demandas[i] <- demanda
  
  # Verificando o atendimento
  falta <- 0
  atendida <- 0
  
  if (demanda <= estoque)
  {
    atendida <- demanda
  }
  else
  {
    atendida <- estoque
    falta <- demanda - estoque
    diasFalta <- diasFalta + 1
  }
  
  atendimentos[i] <- atendida
  naoAtendimentos[i] <- falta
  atendidaTotal <- atendidaTotal + atendida
  
  # Atualizando o estoque
  estoque <- estoque - atendida
  estoque <- min(estoque + R, S_max)
  
  estoquesFinais[i] <- estoque
}


# c) Cálculo dos indicadores e custos

custoProdutoEstocagem <- 0.5 # custo por unidade estocada
custoProdutoNaoAtendido <- 5 # custo por unidade não atendida

taxaAtendimento <- atendidaTotal / demandaTotal
estoqueMedio <- mean(estoquesFinais)

# Custo de estocagem
estoquesIniciaisUnidade <- estoquesIniciais * 1000
custoEstocagem <- sum(estoquesIniciaisUnidade) * custoProdutoEstocagem

# Custo de não atendimento
naoAtendimentosUnidade <- naoAtendimentos * 1000
custoNaoAtendimento <- sum(naoAtendimentosUnidade) * custoProdutoNaoAtendido

# Custo total
custoTotal <- custoEstocagem + custoNaoAtendimento

# Resultados
cat("Taxa média de atendimento:",
    round(taxaAtendimento, 4), "\n")

cat("Dias com falta de produto:",
    diasFalta, "\n")

cat("Estoque médio final do dia:",
    round(estoqueMedio, 3), "mil unidades\n")

cat("Custo estocagem: R$",
    round(custoEstocagem, 2), "\n")

cat("Custo não atendimento: R$",
    round(custoNaoAtendimento, 2), "\n")

cat("Custo total: R$",
    round(custoTotal, 2), "\n")


# d) Gráfico de acompanhamento

x <- 1:30
y1 <- estoquesFinais
y2 <- demandas
y3 <- atendimentos

# Criando o gráfico
plot(x, y1,
     type = "l",
     col = "blue",
     ylim = range(c(y1, y2, y3)),
     xlab = "Dias",
     ylab = "Quantidade (mil unidades)",
     main = "Gráfico de acompanhamento")

lines(x, y2, col = "red")
lines(x, y3, col = "green")

# Adicionando legenda
legend("topright",
       legend = c("Estoque final do dia",
                  "Demanda diária",
                  "Atendimento diário"),
       col = c("blue", "red", "green"),
       lty = 1)

grid()
