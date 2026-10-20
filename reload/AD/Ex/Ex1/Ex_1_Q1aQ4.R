######
# Q1)
######

# a)

a <- 39373
c <- 0
M <- 2^31 - 1
x0 <- 3
#nsamples <- 10000
qtdPersonagens <- 10
nSamples <- qtdPersonagens * 3 # 3 atributos por personagem

LCG <- function(seed, a, c, M, nSamples)
{
  x <- seed
  u <- NULL
  
  for (i in 1:nSamples)
  {
    nx <- (a * x + c) %% M
    u <- c(u, as.double(nx)/as.double(M))
    x <- nx
  }
  
  return (u)
}

U <- LCG(x0, a, c, M, nSamples)

forcaLCG <- U[seq(1,nSamples, 3)] * (20-10) + 10
agilidadeforcaLCG <- U[seq(2,nSamples, 3)] * (15-5) + 5
inteligenciaLCG <- U[seq(3,nSamples, 3)] * (20-10) + 10

cat("forcaLCG:", forcaLCG, "\n")
cat("aglidadeforcaLCG:", agilidadeforcaLCG, "\n")
cat("inteligenciaLCG:", inteligenciaLCG, "\n")

# b)

forcaPadrao <- runif(10, min = 10, max = 20)
agilidadePadrao <- runif(10, min = 5, max = 15)
inteligenciaPadrao <- runif(10, min = 8, max = 18)

cat("forcaPadrao:", forcaPadrao, "\n")
cat("agilidadePadrao:", agilidadePadrao, "\n")
cat("inteligenciaPadrao:", inteligenciaPadrao, "\n")