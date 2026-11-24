#a)

# Para calcular c realizamos a integral de f(x)
# no intervalo 0 a 4 e igualamos a 1.
# O valor encontrado para c é 1/2.

#b)

# Para achar F(x) realizamos a integral de f(x) no intervalo
# 0 a x (“antes de 0” → probabilidade 0; “depois de 4” → F(x) = 1).
# A F(x) encontrada é: 0, para x <= 0; x/2 - x^2/16, para 0 < x < 4; 1, para x >= 4

# c)

# P = F(1) − F(0.5) = 7/16 - 15/64 = 13/64
# P (0.5 <= X <= 1.0) = 13/64

# d)

# Valor esperado, E[X]
# Para encontrar E[X] realizamos a integral de 0 a 4 de x*f(x).
# E[X] = 4/3

# Variância, Var(X) = E[X^2] − (E[X])^2
# Para encontrar E[X^2] realizamos a integral de 0 a 4 de x^2*f(x).
# E[X^2] = 8/3
# E[X] já foi calculado anteriormente, logo:
# Var(X) = E[X^2] − (E[X])^2 = 8/3 - (4/3)^2 = 8/3 - 16/9 = 8/9
