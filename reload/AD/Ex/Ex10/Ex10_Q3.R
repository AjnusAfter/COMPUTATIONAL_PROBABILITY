  fd <- function(x)
  {
    fx <- ifelse(0 <= x & x <= 4, c*(1-x/4), 0)
    return (fx)
  }

# A
  # 0|4 c*(1-x/4) dx = 1; c * 0|4 1-x/4 dx; c * [x -x/8]4,0 = 1; 
  # c*(4-4²/8) = 1 ... c = 1/2

# B
  # Fx:
  #  x <= 0      : 0
  #  0 <= x <= 4 : Integral de f(x): 1/2 - x/8 = x/2 - x²/16 
  #  x >= 4      : 1 

# C
  # P = F(1) - F(0.5) = 7/16 - 15/64 = 13/64
  # P(0.5 <= X <= 1.0) = 13/64

# D
  # Valor esperado, E[X]
  # Para encontrar E[X] realizamos a integral de 0 a 4 de x*f(x).
  # E[X] = 4/3
  
  # Variância = E[X²] - [E[X]²
  # E[X²] = 0|4 x²fx dx = 8/3
  # Var[x] = 8/3 - (4/3)^2 = 8/3 - 16/9 = 8/9


