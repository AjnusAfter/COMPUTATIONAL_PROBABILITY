
#1

LCG <- function(seed, a, c, M, nSamples)
{
  x <- seed
  u <- NULL
  
  for (i in 1:nSamples)
  {
    nx <- (a*x+c) %% M
    u <- c(u, as.double(nx) / as.double(M))
    x <- nx
  }
  
  return (u)
}

connect <- function(service)
{
  valor_G = -1
  valor_P = -1
  valor_I = -1
  if (service == "G")
  {
    valor_G = sample(GU, 1)
    print (valor_G)
    if (valor_G < 0.02)
    {
      return ("falhou_G") 
    }
    return ("passou_G")
  }
  else if (service == "P")
  {
    if (sample(PU, 1) < 0.05)
    {
      return ("falhou_P")
    }
    return ("passou_P")
  }
  else if (service == "I")
  {
    if (sample(IU, 1) < 0.08)
    {
      return ("falhou_I")
    }
    return ("passou_I")
  }
  
}

a <- 39373
c <- 0
M <- 2^31 -1
x0 <- 123
nSamples <- 10000
custo <-0
falhou_G <- FALSE
falhou_P <- FALSE
falhou_I <- FALSE
abort_G <- FALSE
abort_P <- FALSE
abort_I <- FALSE
abort_G_count <- 0
abort_P_count <- 0
abort_I_count <- 0
total_sucesso_count <- 0
sucesso_com_falhas_count <- 0
custoMedio <- 0

GU <- LCG(x0, a, c, M, nSamples)
print(GU)
PU <- LCG(x0, a, c, M, nSamples)
print(PU)
IU <- LCG(x0, a, c, M, nSamples)
print(IU)


for (i in 1:nSamples)
{
  
  if (connect("G") == "falhou_G")
  {
    falhou_G <- TRUE
    if (connect("G") == "falhou_G")
    {
      falhou_G <- TRUE
      if (connect("G") == "falhou_G")
      {
        abort_G <- TRUE
        abort_G_count = abort_G_count + 1
      }
      
    }
  }
  
  if (connect("P") == "falhou_P")
  {
    falhou_P <- TRUE
    if (connect("P") == "falhou_P")
    {
      falhou_P <- TRUE
      if (connect("P") == "falhou_P")
      {
        abort_P <- TRUE
        abort_P_count <- abort_G_count + 1
      }
    }
  }
  
  if (connect("I") == "falhou_I")
  {
    falhou_I <- TRUE
    if (connect("I") == "falhou_I")
    {
      falhou_I <- TRUE
      if (connect("I") == "falhou_I")
      {
        abort_I <- TRUE
        custo <- custo + 150
        abort_I_count =  abort_I_count + 1
      }
    }
  }
  
  if (falhou_G == FALSE && falhou_P == FALSE && falhou_I == FALSE && abort_G == FALSE && abort_P == FALSE && abort_I == FALSE)
  {
    total_sucesso_count = total_sucesso_count + 1
  }
  
  if (falhou_G == TRUE || falhou_P == TRUE || falhou_I == TRUE && abort_G == FALSE && abort_P == FALSE && abort_I == FALSE)
  {
    sucesso_com_falhas_count = sucesso_com_falhas_count + 1
  }
}

probTotalSucesso = total_sucesso_count / nSamples
probSucessoComFalhas = sucesso_com_falhas_count / nSamples
custoMedio <- custo / nSamples

#print(total_sucesso_count)
#print(nSamples)

#A
print("Probabilidade de Sucesso Total:")
print(probTotalSucesso)

#b
print("Probabilidade de Sucesso com Falhas:")
print(probSucessoComFalhas)
      
#C
print("Custo Médio por transação:")
print(custoMedio)


