# fx <- function(x)
# {
#   return ifelse(x>=a & x<=b, k, 0)
# }


# # A  
# # A integral da função
# # S| f(x)dx = 1
# integrate(fx, -Inf, +Inf) = 1

# # Como a densidade só é diferente de zero entre a e b:
# integrate(k, a, b) = 1

# # isolando
# k(b-a) = 1
k <- 1/(b-a)


# B
# # A esperança de uma variável contínua é:
# micro = E(X) = integrate(x*fx, -Inf, +Inf)
# 
# # substituindo:
# micro = integrate(x*(1/(b-a)), a, b)
# micro = (1/(b-a)) * [(x^2)/2]|b,a
# micro = (1/(b-a)) * [(x^2)/2]|b,a = (1/(b-a)) * [b²/2 - a²/2] = (1/(b-a)) * ((b²- a²)/2) = (b²- a²)/2(b-a) = (b+a)*(b-a)/2(b-a)
micro = (a+b)/2


# C
# F(x) = P(X<=x) = -Inf|x f(t)dt

# x < a: Como a densidade é zero antes de a:
# f(x) = 0 -> F(x) = 0
Fx = 0

# a < x < b:
# F(x) = a|x k dt = a|x 1/(b-a) dt = 1/(b-a) * a|x 1 dt = (x-a)/(b-a)
Fx = (x-a)/(b-a)

# x > b: toda a probabilidade já foi acumulada
Fx = 1


Fx <- function(x)
{
  return (ifelse(x < a, 0, 
                 ifelse(x <= b, (x-a)/(b-a), 1)))
}

# testando
a <- 30; b <- 50
Fx(c(a-1, a, (a+b)/2, b, b+1))
