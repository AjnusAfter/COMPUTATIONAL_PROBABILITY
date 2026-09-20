######
# Q5)
######

import random

random.seed(123)

# Função para movimento aleatório dentro do labirinto
def mover(posicao, dimensao):
    # Direções possíveis: cima, baixo, esquerda, direita
    direcoes = [(-1,0), (1,0), (0,-1), (0,1)]
    x, y = posicao
    while True:
        dx, dy = random.choice(direcoes)
        nx, ny = x + dx, y + dy
        if (1 <= nx) and (nx <= dimensao) and (1 <= ny) and (ny <= dimensao):
            return (nx, ny)

# Gera posições únicas de pastilhas (exceto (1,1))
def gerarPastilhas(pastilhas, dimensao):
    posicoes = set()
    while len(posicoes) < pastilhas:
        pos = (random.randint(1, dimensao), random.randint(1, dimensao))
        if (pos != (1,1)):
            posicoes.add(pos)
    return list(posicoes)

N = 11
numeroPastilhas = 4
posicaoInicialFantasmas = [(1, N), (N, 1), (N, N)]
vitorias = 0
nsamples = 1000

for _ in range(nsamples):    
    pacman = (1,1)
    fantamas = posicaoInicialFantasmas[:]
    pastilhas = gerarPastilhas(numeroPastilhas, N)
    coleta = set()

    while True:
        # Movimenta o Pac-Man
        pacman = mover(pacman, N)
        
        # Verifica se coletou todas as pastilhas
        if pacman in pastilhas:
            coleta.add(pacman)
            
        if len(coleta) == numeroPastilhas:
            vitorias += 1
            break

        # Movimenta os fantasmas
        fantamas = [mover(f, N) for f in fantamas]
        
        # Verifica se Pac-Man foi capturado
        if pacman in fantamas:
            break

probabilidade = vitorias / nsamples
print(f"Probabilidade estimada: {probabilidade:.4f}") # 0.0100
