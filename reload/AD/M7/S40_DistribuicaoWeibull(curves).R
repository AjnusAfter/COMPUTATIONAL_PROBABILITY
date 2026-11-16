# "𝛽 é chamado parâmetro de forma e descreve a forma da distribuição e caracteriza o modo de
# falha: β < 1 indica uma taxa de falha decrescente; e β > 1 indica uma taxa de falha crescente.

# 𝛿(η?) é chamado parâmetro de escala. Ele estica ou comprime a distribuição, fornecendo uma estimativa 
# da "vida característica" do produto, que é o tempo em que 63,2% dos equipamentos terão falhado."

eta <- 6000 
x   <- 0:12500

for (i in 1:4)
{
  panel.first = grid()
  curve(
    dweibull(x, ifelse(i<4, 0.5*i,1+i), eta),
    0,
    12500,
    main = "Distribuição Weibull",
    ylab = "f(x)",
    col  = ifelse(i<4, 1+i, 2+i),
    add  = (i>1),           # CRIA gráfico só uma vez, depois sobrepõe as curvas
    ylim = c(0, 5e-4),
    type = "l"
  )
}

# "β maior ⟹ menos falhas iniciais, maior vida útil típica.
#  β menor ⟹ mais falhas prematuras, menor durabilidade."