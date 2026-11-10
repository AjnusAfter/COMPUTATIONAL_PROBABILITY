p = 0.15
n = 10

# A
dbinom(1, n, p)
dbinom(0, n, p)
pbinom(1, n, p)

# B
nSamples <- 10000

count.com.defeito <- 0; freq.com.defeito <- rep(0, n)
count.sem.defeito <- 0
for (i in 1:nSamples)
{
  count.com.defeito <- rbinom(1, n, p)
  
  if (count.com.defeito > 0)
  {
    freq.com.defeito[count.com.defeito] <- freq.com.defeito[count.com.defeito]+1
  }
  else
  {
    count.sem.defeito <- count.sem.defeito+1
  }
}

sprintf("P(1 peça defeituosa): %.4f", freq.com.defeito[1] / nSamples)
sprintf("P(0 peça defeituosa): %.4f", count.sem.defeito / nSamples)
sprintf("P(menos de 2 peças defeituosas): %.4f", (count.sem.defeito + freq.com.defeito[1]) / nSamples)

set.seed(123)
x <- rbinom(nSamples, n, p)
mean(x==1)
mean(x==0)
mean(x<2)

# C
x <- 0:n
prob <- dbinom(x, n, p)

plot(
  x,
  prob,
  main = "Distribuição Binomial (n = 10, p = 0.15)",
  xlab = "Número de defeituosas",
  ylab = "Probabilidade",
  lwd  = 3,
  type = "h",
  col  = "blue"
)

# D
N = 20
m = 5
n = 15
k = 3

dhyper(2, m, n, k)
1 - (dhyper(0, m, n, k) + dhyper(1, m, n, k))
sum(dhyper(2:k, m, n, k))
dhyper(0, m, n, k)

# E
nSamples <- 10000
count.com.defeito <- 0; freq.defeitos <- rep(0:m)
count.sem.defeito <- 0
for (i in 1:nSamples)
{
  count.com.defeito <- rhyper(1 , m, n, k)
  
  if (count.com.defeito > 0)
  {
    freq.defeitos[count.com.defeito] <- freq.defeitos[count.com.defeito]+1
  }
  else
  {
    count.sem.defeito <- count.sem.defeito+1
  }
}

sprintf("P(2 lâmpadas defeituosas): %.4f", freq.defeitos[2] / nSamples)
sprintf("P(2 lâmpadas ou mais defeituosas): %.4f", sum(freq.defeitos[2:m]) / nSamples)
sprintf("P(nenhuma ser defeituosa): %.4f", count.sem.defeito / nSamples)

set.seed(123)
x <- rhyper(nSamples, m, n, k)
mean(x==2)
mean(x>=2)
mean(x==0)