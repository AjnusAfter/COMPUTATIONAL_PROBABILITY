#a)

simulador <- function(n, TMC, TMA, TT) {
  retorno <- NULL
  total.atendimento <- 0
  total.atendimento.realizado <- 0
  tempo.atendimento <- rep(0, n)
  tempo <- 0
  while (tempo < TT) {
    tempo <- tempo + rexp(1, TMC) 
    total.atendimento <- total.atendimento + 1
    for (i in 1:n) {
      if (tempo.atendimento[i] < tempo) {
        tempo.atendimento[i] <- tempo + rexp(1, TMA)
        total.atendimento.realizado <- total.atendimento.realizado + 1
        break
      }
    }
  }
  retorno <- c(total.atendimento.realizado, total.atendimento - total.atendimento.realizado)
  return (retorno)
}

n <- 4
TMC <- 1
TMA <- 1/2
TT <- 24000
atendimento <- simulador(n, TMC, TMA, TT)
print(atendimento)

#b)

n <- 4
TMC <- 1
TMA <- 1/2
TT <- 24000
numero.simulacao <- 20
atendimento <- c (0, 0)

for (i in 1:numero.simulacao) {
  atendimento <- atendimento + simulador(n, TMC, TMA, TT)
}

media.atendimento <- atendimento / numero.simulacao
print(media.atendimento)

