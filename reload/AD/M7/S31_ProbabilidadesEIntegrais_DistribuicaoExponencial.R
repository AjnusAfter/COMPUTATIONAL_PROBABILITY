lambda = 1/600

# P(X >= 300) ?

funcao.exponencial <- function(x)
{
  fx <- ifelse (x < 0, 0, lambda * exp(-lambda*x))
  return (fx)
}

integrate (funcao.exponencial, 300, +Inf)

1 - pexp(300, lambda)