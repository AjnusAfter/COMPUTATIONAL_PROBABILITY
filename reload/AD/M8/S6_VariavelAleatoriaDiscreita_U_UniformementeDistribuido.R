#P(X = xj) = pj;   j = 0,1 ...;    j∑ pj = 1

transforma_U <- function(U, x, p)
{
  
  F <- cumsum(p)
  
  indices <- vapply(U, function(u)
  {
    which(u < F)[1]
  }, integer(1))
  
  return(x[indices])
}

set.seed(123)

x <- 0:3
p <- c(0.1, 0.2, 0.3, 0.4)

U <- runif(10000)

X <- transforma_U(U, x, p)

hist(U,
     breaks = seq(0, 1, length.out = 11),
     col = "springgreen3",
     border = "springgreen3",
     main = "",
     xlab = "",
     ylab = "",
     xlim = c(0, 1))