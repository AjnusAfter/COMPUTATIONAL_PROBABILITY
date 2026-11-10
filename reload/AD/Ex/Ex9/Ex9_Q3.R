# A
set.seed(123)

nSamples <- 10000
lambda <- 30/7

dia1 <- rpois(nSamples, lambda)
dia2 <- rpois(nSamples, lambda)
dia3 <- rpois(nSamples, lambda)
dia4 <- rpois(nSamples, lambda)
dia5 <- rpois(nSamples, lambda)

itemA <- mean(
  dia1 > 3 &
  dia2 > 3 &
  dia3 > 3 &
  dia4 > 3 &
  dia5 > 3
)

print(itemA)

# B
set.seed(123)

nSamples <- 10000
lambda <- 30/7

dia1 <- rpois(nSamples, lambda)
dia2 <- rpois(nSamples, lambda)
dia3 <- rpois(nSamples, lambda)
dia4 <- rpois(nSamples, lambda)
dia5 <- rpois(nSamples, lambda)

itemB <- mean(
  dia1 > 3 |
    dia2 > 3 |
    dia3 > 3 |
    dia4 > 3 |
    dia5 > 3
)

print(itemB)