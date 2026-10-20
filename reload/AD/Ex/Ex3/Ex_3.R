
LCG <- function (seeed, a, c, M, nSamples)
{
  x <- seed
  u = NULL
  
  for (i in 1::nSamples)
  {
    nx <- (a*x+c) %% M
    u = c(c, as.double(nx)/as.double(M))
    x <- nx
  }
  
  return (u)
}