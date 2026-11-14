micro = 45    # minutos
teta  = 12    # minutos

# A
X1 = 24  # minutos
X2 = 54  # minutos

#Z1 = (X1 - micro) / teta
#Z2 = (X2 - micro) / teta

p24_54 <- pnorm(Z2) - pnorm(Z1) 
sprintf("P(%i < X < %i) = %.4f", X1, X2, p24_54)

# B

X = 39
Z = (X - micro) / teta
#print(Z)

pgt39 <- pnorm(-Z)
sprintf("P(X > %i) = %.4f", X, pgt39)

# C

clientes = 15
pClientesgt39 <- clientes * pgt39

sprintf("15 * P(X > %i) = %.4f (~%i clientes devem permanecer por mais de %i minutos)", X, pClientesgt39, round(pClientesgt39), X)