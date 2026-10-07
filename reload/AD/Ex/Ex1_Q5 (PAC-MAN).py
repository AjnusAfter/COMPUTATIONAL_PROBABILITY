#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Wed Oct  7 09:16:46 2026

@author: jn
"""

import random

random.seed(123)

N                       = 11    # linhas = colunas = 11      
pacman_posInicial       = [1,1]
nPastilhas              = 4
nFantasmas              = 3
redGhost_posInicial     = [1,N]
greenGhost_posInicial   = [N,1]
blueGhost_posInicial    = [N,N]
nSamples                = 1000

vitorias                = 0


# para movimento aleatório dentro do labirinto
def mover(posicao, dimensao):
    # direções possíveis: cima, baixo, esquerda, direita
    direcoes = [(-1,0),(1,0),(0,-1),(0,1)]
    
    # posição recebida/inicial
    (x, y) = posicao
    
    # loop
    while True:
        # sorteia direção
        (dx, dy) = random.choice(direcoes)
        (nx, ny) = x + dx, y + dy           # DE-PARA posição inicial -> direção sorteada
        
        # se não sair do mapa
        if (1 <= nx) and (nx <= dimensao) and (1 <= ny) and (ny <= dimensao):
            # retorna posição para onde se moveu
            return (nx, ny)
            

# gera posições únicas de pastilhas (exceto [1,1])
def gerarPastilhas(nPastilhas, dimensao):
    # inicializa set de posições
    posicoes = set()
    
    # enquanto menos posições criadas que número de pastilhas
    while len(posicoes) < nPastilhas:
        # gera posição (x,y) aleatória
        pos = (random.randint(1, dimensao), random.randint(1, dimensao))
        
        # se for posição válida para pastilha
        if pos != (1,1):
            # atribui posição à pastilha
            posicoes.add(pos)
    
    # retorna lista de posições das pastilhas
    return list(posicoes)


# para cada jogo/partida/simulação
for _ in range(nSamples):
    # seta posições iniciais na fase
    pacman    = pacman_posInicial
    ghosts    = [redGhost_posInicial, greenGhost_posInicial, blueGhost_posInicial]
    pastilhas = gerarPastilhas(nPastilhas, N) 
    
    # inicializa set de pastilhas coletadas
    coleta = set()
    
    # loop do jogo (tem break, calma :v)
    while True:
        # movimenta o Pac-Man
        pacman = mover(pacman, N)
        
        # se está na mesma posição/coletou alguma pastilha
        if pacman in pastilhas:
            # adiciona ao set de pastilhas coletadas
            coleta.add(pacman)
            # remove do set de pastilhas no mapa
            pastilhas.remove(pacman)
            
        # se coletou todas as pastilhas (vem 1o no código: prioridade)
        if len(coleta) == nPastilhas:
            # WIN
            vitorias+=1
            break
        
        # movimenta os fantasmas
        ghosts = [mover(f, N) for f in ghosts]
        
        # se ghost está na mesma posição/come Pac-Man
        if pacman in ghosts:
            # LOSE
            break

        
#calcula e imprime probabilidade de Vitória        
probDeVitoria = vitorias / nSamples
print(f"Probabilidade de Vitória estimada: {probDeVitoria:.4f}")    # 0.100
            
        
    



