par(oma = c(0, 0, 3, 0),
    mfrow = c(1,2),
    bg = "black",
    fg = "gray50",
    col.axis = "white",
    col.lab = "white",
    col.main = "white"
)

x <- 0:15
p <- dpois(x, 5)
F <- cumsum(p)

plot(x,
     p,
     main = "Função de Probabilidade da distribuição de Poisson (λ = 5)",
     xlab = "Número de ocorrências",
     ylab = "Probabilidade",
     lwd = 2,
     type = "h",
     xlim = c(-1, 16),
     ylim = c(0, 0.22),
     col  = "deepskyblue",
     xaxs = "i",
     yaxs = "i",
     tck = 0,
     las = 1,
     xaxt = "n"
)

axis(1, at = 0:15, labels = 0:15, tck = 0,)

grid(lty = 1,
     lwd = 0.7,
     col = "gray50")

abline(v = 0:15, col = "gray50", lty = 1, lwd = 0.7)

points(x,
       p,
       pch = 19,
       col = "deepskyblue",
       cex = 1.3)

text(x,
     p + 0.01,
     labels = sprintf("%.2f", p),
     col = "white",
     cex = 0.9)


plot(x,
     F,
     main = "Função de Acumulada de Probabilidade da distribuição de Poisson (λ = 5)",
     xlab = "Número de ocorrências",
     ylab = "Probabilidade Acumulada",
     lwd  = 2,
     type = "s",
     col  = "springgreen3",
     xaxs = "i",
     yaxs = "i",
     xlim = c(-1,16),
     ylim = c(0, 1.1),
     tck = 0,
     las = 1,
     xaxt = "n"
)

axis(1, at = 0:15, labels = 0:15)

grid(
     lty = 1,
     lwd = 0.7,
     col = "gray50")

abline(v = 0:15, col = "gray50", lty = 1, lwd = 0.7)

# Colore apenas o trecho de 0 a 1
segments(15, 1, 16, 1, col = "springgreen3", lwd = 2)

points(x, 
       F,
       pch = 21,
       bg = "springgreen3",
       col = "white",
       cex = 1.3)

text(x,
     F + 0.04,
     labels = sprintf("%.2f", F),
     col = "white",
     cex = 0.9)


mtext("Distribuição de Poisson com média λ = 5",
      side = 3,
      outer = TRUE,
      line = 1,
      cex = 1.3,
      font = 2,
      col = "white")