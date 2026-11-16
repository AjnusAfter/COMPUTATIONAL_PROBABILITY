# "𝛽 é chamado parâmetro de forma e descreve a forma da distribuição e caracteriza o modo de
# falha: β < 1 indica uma taxa de falha decrescente; e β > 1 indica uma taxa de falha crescente.

# 𝛿 é chamado parâmetro de escala. Ele estica ou comprime a distribuição, fornecendo uma estimativa 
# da "vida característica" do produto, que é o tempo em que 63,2% dos equipamentos terão falhado."

# 1
b = 1/2
g = 6000

# A P(X >= 6500)
1 - pweibull(6500, b, g)

# B P(Z <= 6500)
pweibull(6500, b, g)

x <- 0:8000
curve( 
  dweibull (x, 0.5, 6000),
  0,
  8000
)