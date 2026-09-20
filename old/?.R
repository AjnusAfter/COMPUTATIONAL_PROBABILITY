# Simulação Pac-Man 11x11
# 1000 execuções, semente 123

set.seed(123)

n_linhas <- 11
n_colunas <- 11
n_sim <- 1000
n_pastilhas <- 4

# Movimentos possíveis: cima, baixo, esquerda, direita
movimentos <- matrix(
  c(-1,  0,
    1,  0,
    0, -1,
    0,  1),
  ncol = 2,
  byrow = TRUE
)

# Função para verificar se uma posição está dentro do labirinto
posicao_valida <- function(pos) {
  pos[1] >= 1 && pos[1] <= n_linhas &&
    pos[2] >= 1 && pos[2] <= n_colunas
}

# Movimento aleatório do Pac-Man
mover_pacman <- function(pos) {
  possiveis <- list()
  
  for (i in 1:nrow(movimentos)) {
    nova_pos <- pos + movimentos[i, ]
    
    if (posicao_valida(nova_pos)) {
      possiveis[[length(possiveis) + 1]] <- nova_pos
    }
  }
  
  possiveis[[sample(length(possiveis), 1)]]
}

# Movimento aleatório dos fantasmas
# Fantasmas não podem ocupar a posição [1,1]
mover_fantasma <- function(pos) {
  possiveis <- list()
  
  for (i in 1:nrow(movimentos)) {
    nova_pos <- pos + movimentos[i, ]
    
    if (posicao_valida(nova_pos) &&
        !(nova_pos[1] == 1 && nova_pos[2] == 1)) {
      possiveis[[length(possiveis) + 1]] <- nova_pos
    }
  }
  
  possiveis[[sample(length(possiveis), 1)]]
}

# Simula uma partida
simular_partida <- function() {
  
  # Posição inicial do Pac-Man
  pacman <- c(1, 1)
  
  # Posições iniciais dos fantasmas
  fantasmas <- matrix(
    c(1, 11,
      11, 1,
      11, 11),
    ncol = 2,
    byrow = TRUE
  )
  
  # Todas as posições possíveis para pastilhas
  # Aqui removemos a posição inicial do Pac-Man
  posicoes <- expand.grid(linha = 1:n_linhas, coluna = 1:n_colunas)
  posicoes <- posicoes[!(posicoes$linha == 1 & posicoes$coluna == 1), ]
  
  # Sorteia 4 posições distintas para as pastilhas
  idx <- sample(1:nrow(posicoes), n_pastilhas, replace = FALSE)
  pastilhas <- as.matrix(posicoes[idx, ])
  
  coletadas <- rep(FALSE, n_pastilhas)
  
  repetir <- TRUE
  
  while (repetir) {
    
    # 1. Pac-Man se move
    pacman <- mover_pacman(pacman)
    
    # 2. Pac-Man coleta pastilha, se houver
    for (i in 1:n_pastilhas) {
      if (!coletadas[i] &&
          pacman[1] == pastilhas[i, 1] &&
          pacman[2] == pastilhas[i, 2]) {
        coletadas[i] <- TRUE
      }
    }
    
    # Prioridade: se coletou todas as pastilhas, vence antes da captura
    if (all(coletadas)) {
      return(TRUE)
    }
    
    # 3. Fantasmas se movem
    for (i in 1:nrow(fantasmas)) {
      fantasmas[i, ] <- mover_fantasma(fantasmas[i, ])
    }
    
    # 4. Verifica captura
    for (i in 1:nrow(fantasmas)) {
      if (fantasmas[i, 1] == pacman[1] &&
          fantasmas[i, 2] == pacman[2]) {
        return(FALSE)
      }
    }
  }
}

# Executa as simulações
resultados <- replicate(n_sim, simular_partida())

# Probabilidade estimada de vitória
probabilidade_vitoria <- mean(resultados)

cat("Número de simulações:", n_sim, "\n")
cat("Vitórias do Pac-Man:", sum(resultados), "\n")
cat("Derrotas do Pac-Man:", n_sim - sum(resultados), "\n")
cat("Probabilidade estimada de vitória:", probabilidade_vitoria, "\n")