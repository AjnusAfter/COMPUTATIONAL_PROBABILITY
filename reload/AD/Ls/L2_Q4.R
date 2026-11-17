lambda <- 2

# A
EX <- integrate(
  function(x) x * dexp(x, rate=lambda),
  0, Inf
)$value

print(EX)


# B
EX2 <- integrate(
  function(x) x^2 * dexp(x, rate=lambda),
  0, Inf
)$value

VarX <- EX2 - EX^2

print(VarX)