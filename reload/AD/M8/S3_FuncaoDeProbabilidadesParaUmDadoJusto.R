par(oma = c(0, 0, 3, 0),
    mfrow = c(1,2),
    bg = "black",
    fg = "white",
    col.axis = "white",
    col.lab = "white",
    col.main = "white"
    )

x <- 1:6
p <- rep(1/6, 6)
F <- cumsum(p)

plot(x,
     p,
     main = "Função de Probabilidade",
     xlab = "Face do dado",
     ylab = "Probabilidade",
     lwd = 2,
     type = "h",
     xlim = c(0, 7),
     ylim = c(0, 0.220),
     col  = "deepskyblue",
     xaxs = "i",
     yaxs = "i",
     tck = 0,
     yaxt = "n")

axis(2,
     at = seq(0, 0.20, by = 0.025),
     labels = sprintf("%.3f", seq(0, 0.20, by = 0.025)),
     las = 1,
     tck = 0)

grid(lty = 1,
     lwd = 0.7,
     col = "gray50")

abline(h = seq(0, 0.20, by = 0.025),
       lty = 1,
       col = "gray")

points(x,
       p,
       pch = 19,
       col = "deepskyblue",
       cex = 1.3)

text(x,
     p + 0.011,
     labels = sprintf("%.2f", p),
     col = "white")


plot(0:7,
     c(0, F, 1),
     main = "Função de Acumulada de Probabilidade",
     xlab = "Face do dado",
     ylab = "Probabilidade Acumulada",
     lwd  = 2,
     type = "s",
     col  = "springgreen3",
     xaxs = "i",
     yaxs = "i",
     xlim = c(0, 7),
     ylim = c(0, 1.1),
     tck = 0,
     las = 1)

grid(lty = 1,
     lwd = 0.7,
     col = "gray50")

# Colore apenas o trecho de 0 a 1
segments(0, 0, 1, 0, col = "springgreen3", lwd = 2)

points(x, 
       F,
       pch = 21,
       bg = "springgreen3",
       col = "white",
       cex = 1.3)

text(x,
     F + 0.04,
     labels = sprintf("%.2f", F),
     col = "white")


mtext("Distribuição de Probabilidades para um Dado Justo",
      side = 3,
      outer = TRUE,
      line = 1,
      cex = 1.3,
      font = 2)