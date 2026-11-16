df = 12

# P(x1 <= X <= x2) = 0.95 | x1 = ? x2 = ?
# P(x1 <= X <= x2) = P(X <= x2) - P(X <= x1) = 0.95
# para P(X <= x2) = 0.98 (arbitrário); P(X <= x1) = 0.03

x2 <- qchisq(0.98, df); sprintf("x2: %.6f", x2)
x1 <- qchisq(0.03, df); sprintf("x1: %.6f", x1)

# confirmando
pchisq(pXltx2, df) - pchisq(pXltx1, df)