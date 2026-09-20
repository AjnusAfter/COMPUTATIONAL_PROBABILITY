raio1 <- 1
raio2 <- 1
numeroAmostras <- 100000
contDentroAreaCultivada <- 0

for (i in 1:numeroAmostras) {
  
  x <- runif(1)
  y <- runif(1)
  
  distancia1 <- sqrt((x - 0)^2 + (y - 0)^2)
  
  distancia2 <- sqrt((x - 1)^2 + (y - 1)^2)
  
  if ((distancia1 <= raio1) & (distancia2 <= raio2)) {
    contDentroAreaCultivada <- contDentroAreaCultivada + 1
  }
  
}

pDentroAreaCultivada <- contDentroAreaCultivada / numeroAmostras

areaTotal <- 1

areaCultivada = pDentroAreaCultivada * areaTotal

aduboPorQuilometro <- 200

numeroMeses <- 12

quantidadeAdubo <- areaCultivada * aduboPorQuilometro * numeroMeses

print(paste0("Quantidade (kg) = ", quantidadeAdubo))


