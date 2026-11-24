par(mfrow = c(1, 3),
    bg = "black",
    fg = "white",
    col.axis = "white",
    col.lab = "white",
    col.main = "white",
    mar = c(4, 4, 3, 1))

x <- seq(0, 1, length.out = 100)
fx <- function(x) 3*x**2
Fx <- function(x) x**3

curve(fx,
      from = 0,
      to = 1,
      main = "Função densidade f(x) = 3x²",
      xlab = "x",
      ylab = "f(x)",
      xlim = c(-0.1,1.1),
      ylim = c(0.0,3.5),
      col  = 4,
      lwd  = 2,
      tck = 0,
      yaxs = "i",
      las = 1
    )
grid(col = "gray30", lty = 1)

curve(Fx,
      from = 0,
      to   = 1,
      main = "Função Acumulada F(X) = x³",
      xlab = "x",
      ylab = "F(x)",
      #xlim = c(-0.1:1.5),
      ylim = c(0.0, 1.1),
      col  = 3,
      lwd  = 2,
      tck = 0,
      yaxs = "i",
      las = 1,
)
grid(col = "gray30", lty = 1)

curve(Fx,
      from = 0,
      to   = 1,
      ylim = c(0.0:1.05),
      col = 3,
      main = "Acumulada F(x) e sua inversa F^-1(y)",
      xlab = "x ou y",
      ylab = "F(x) ou F^-1(y)",
      lwd = 2,
      xaxs = "i",
      yaxs = "i",
      las = 1,
)
grid(col = "gray30", lty = 1)

Fx_Inv <- function(x) x**(1/3)
curve(Fx_Inv,
      from = 0,
      to   = 1,
      add = TRUE,
      col  = 2,
      lwd = 2
)  

abline(a = 0, b = 1, col = "white", lty = 2)

# Legenda
legend("topleft",
       legend = c(expression(F(x) == x^3),
                  expression(F^{-1}(y) == y^{1/3}),
                  "y = x"),
       col = c("limegreen", "red", "white"),
       lty = c(1, 1, 2),
       lwd = c(2, 2, 1),
       bg = "black",
       text.col = "white",
       cex = 0.7)
