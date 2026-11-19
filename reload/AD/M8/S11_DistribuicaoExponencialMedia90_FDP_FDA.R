par(oma = c(0, 0, 3, 0),
    mfrow = c(1,2),
    bg = "black",
    fg = "gray50",
    col.axis = "white",
    col.lab = "white",
    col.main = "white",
    mar = c(6.5, 4.5, 3, 1)    # <- margem inferior maior
)

media <- 90
lambda = 1/media
x <- seq(0, 450, length.out = 50)
fx <- dexp(x, lambda)
Fx <- pexp(x, lambda)

plot(x,
     fx,
     main = "Função densidade de Probabilidade",
     xlab = "Tempo",
     ylab = "Densidade",
     lwd = 2,
     type = "n",
     xlim = c(0, 450),
     ylim = c(0, 0.0125),
     col  = 4,
     xaxs = "i",
     yaxs = "i",
     tck = 0,
     las = 1,
     xaxt = "n",          # <- desliga o eixo x padrão
)

# eixo x de 50 em 50
axis(1, 
     at = seq(0, 450, by = 50), 
     tck = 0,
     col = "gray50", 
     col.axis = "white")

grid(nx = 9, 
     ny = NULL, 
     lty = 1, 
     lwd = 0.7, 
     col = "gray25")

# área embaixo da curva
polygon(c(x, rev(x)),
        c(fx, rep(0,length(x))),
        col = adjustcolor(4, alpha.f = 0.30),
        border = NA)

# curva
lines(x, 
      fx, 
      col = 4, 
      lwd= 2)

# Linha tracejada na média
abline(v = media, lty = 2, col = "gray70")
text(media + 5, 0.0095, labels = "média = 90",
     col = "white", adj = 0, cex = 0.8)

box(col = "gray50")



plot(x,
     Fx,
     main = "Função de de Distribuição Acumulada",
     xlab = "Tempo",
     ylab = "Probabilidade Acumulada",
     lwd  = 2,
     type = "n",
     col  = "springgreen3",
     xaxs = "i",
     yaxs = "i",
     xlim = c(0, 450),
     ylim = c(0, 1.05),
     tck = 0,
     xaxt = "n",          # <- desliga o eixo x padrão
)

# eixo x de 50 em 50
axis(1, 
     at = seq(0, 450, by = 50), 
     tck = 0,
     col = "gray50", 
     col.axis = "white")

grid(nx = 9, 
     ny = NULL, 
     lty = 1, 
     lwd = 0.7, 
     col = "gray25")

# Curva
lines(x, Fx, col = "springgreen3", lwd = 2)

# Linha tracejada na média
abline(v = media, lty = 2, col = "gray70")

# Ponto em P(X <= 90)
p90 <- pexp(media, rate = lambda)
points(media, p90,
       pch = 21,
       bg  = "springgreen3",
       col = "white",
       cex = 1.6)

text(media + 5, p90 + 0.04,
     labels = sprintf("P(X \u2264 90) \u2248 %.2f", p90),
     col = "white", adj = 0, cex = 0.8)

box(col = "gray50")

# Fórmula da transformada inversa (abaixo do gráfico da direita)
mtext(expression(X == F^{-1}*(U)),
      side = 1, line = 5, cex = 1.3, col = "white")


mtext("Distribuição Exponencial de uma variável aleatória como vida média 90 (λ = 1/90)",
      side = 3,
      outer = TRUE,
      line = 1,
      cex = 1.3,
      font = 2,
      col = "white")