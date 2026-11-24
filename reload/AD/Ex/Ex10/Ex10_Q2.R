TMC = 1/1
TMA = 1/2
n  = 4
TT  = 24000 # minutos 

# A
simulador <-function(n, TMC, TMA, TT)
{
  tempo <- 0
  total.atendimento <- 0
  total.atendimento.realizado <- 0
  tempo.atendimento <- rep(0,n)
  
  while (tempo < TT)
  {
    tempo <- tempo + rexp(1, TMC)
    total.atendimento <- total.atendimento + 1
    
    for (i in 1:n)
    {
      if (tempo.atendimento[i] < tempo)
      {
        tempo.atendimento[i] <- tempo + rexp(1, TMA)
        total.atendimento.realizado <- total.atendimento.realizado + 1
        break
      }
    }
  }
  
  return (c(total.atendimento.realizado, total.atendimento - total.atendimento.realizado))
}

simulador(n, TMC, TMA, TT)

# B

nSamples <- 20
atendimentos <- c(0,0)

for (i in 1:nSamples)
{
  atendimentos <- atendimentos + simulador(n, TMC, TMA, TT)
}

media.atendimentos <- atendimentos / nSamples
print(media.atendimentos)