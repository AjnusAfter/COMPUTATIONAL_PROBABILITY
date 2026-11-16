# α > 0 (parâmetro de forma)
# 𝛽> 0 (parâmetro de taxa)
# 𝜃> 0 (parâmetro de escala, equivalente ao inverso do parâmetro de taxa 𝛽)
# Média da distribuição é dada por 𝛼/𝛽 = 𝛼*𝜃, e a sua variância é 𝛼/𝛽^2 = 𝛼*𝜃^2

# Variância (σ^2): mede a dispersão dos valores em relação à média, usando os desvios ao quadrado.
# Desvio-padrão (σ): é a raiz quadrada da variância.

mean = 2000 # reais
sd   = 400  # reais
var  = sd^2

# A
# a*t = 2000; a = 2000/t
# sqrt(a*t**2) = 400; (2000/t)*(t**2) = 16000; 2000/t = 16000/t**2; 2000 = 16000/t; 2000*t = 16000; 
t = 80
# a = 2000/t; a = 2000/80; 
a = 25
# b = 1/t; 
b = 1/80


# B P(X>2300)
1 - pgamma(2300, a, b)


# C mediana desta distribuição Gama
qgamma(0.5, a, b)