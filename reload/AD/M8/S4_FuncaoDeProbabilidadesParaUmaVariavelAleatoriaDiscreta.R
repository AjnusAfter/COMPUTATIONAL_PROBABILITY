par(oma = c(0, 0, 3, 0),
    mfrow = c(1,2),
    bg = "black",
    fg = "gray50",
    col.axis = "white",
    col.lab = "white",
    col.main = "white"
)

x <- 1:4
p <- c(0.20, 0.15, 0.25, 0.40)
F <- cumsum(p)

plot(x,
     p,
     main = "Função de Probabilidade",
     xlab = "Valor de x",
     ylab = "Probabilidade",
     lwd = 2,
     type = "h",
     xlim = c(0, 5),
     ylim = c(0, 0.5),
     col  = "deepskyblue",
     xaxs = "i",
     yaxs = "i",
     tck = 0,
     las = 1
     )

grid(lty = 1,
     lwd = 0.7,
     col = "gray50")

points(x,
       p,
       pch = 19,
       col = "deepskyblue",
       cex = 1.3)

text(x,
     p + 0.025,
     labels = sprintf("%.2f", p),
     col = "white")


plot(0:5,
     c(0, F, 1),
     main = "Função de Acumulada de Probabilidade",
     xlab = "Valor de x",
     ylab = "Probabilidade Acumulada",
     lwd  = 2,
     type = "s",
     col  = "springgreen3",
     xaxs = "i",
     yaxs = "i",
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


mtext("Distribuição de Probabilidades de uma variável aleatória discreta",
      side = 3,
      outer = TRUE,
      line = 1,
      cex = 1.3,
      font = 2,
      col = "white")