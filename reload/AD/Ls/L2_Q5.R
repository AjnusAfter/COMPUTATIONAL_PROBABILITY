# FDP
fdp <- function(x) 
{
  return(ifelse(0 <= x & x <= 1,
                3*x - 3*x^2/2, 0))
}

# A
EX <- integrate(function(x) x * fdp(x), 0, 1)$value

print(EX)


# B
EX2 <- integrate(function(x) x^2 * fdp(x), 0, 1)$value

VarX <- EX2 - EX^2

print(VarX)


# C
FDA <- function(x) 
{
  return(ifelse(x < 0, 0,
                ifelse(x < 1, (3*x^2-x^3)/2, 1)))
}

p <- FDA(0.5) - FDA(0.25)
print(p)