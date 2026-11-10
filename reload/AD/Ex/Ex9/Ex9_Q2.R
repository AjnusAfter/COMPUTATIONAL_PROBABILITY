lambda_chegada <- 30/7 # por dia
#lambda_acesso  <- 1    # por dia

pNaoRespondaNumDia <- 1 - ppois(3, lambda_chegada)
print(pNaoRespondaNumDia)

# A
pNaoResponderTodos5 <- pNaoRespondaNumDia ^ 5
print(pNaoResponderTodos5)

# B
pRespondaNumDia <- ppois(3, lambda_chegada)
pResponderTodos5 <- pRespondaNumDia^5
pNaoResponderPeloMenosUmDia <- 1 - pResponderTodos5
print(pNaoResponderPeloMenosUmDia)