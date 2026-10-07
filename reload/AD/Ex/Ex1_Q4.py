#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Tue Oct  6 03:59:11 2026

@author: jn

"""

import random
import math

random.seed(123)

# Parâmetros
companhia_voosDiarios          = 20
areonave_capacidadePassageiros = 180
passagensVendidas              = 190
taxaVoluntarios                = 0.25
compVoluntaria                 = 1000
compForcada                    = 2500
nDias                          = 100
probComparecer_low             = 0.90 
probComparecer_high            = 0.95
#perfis                        = ["executivo", "lazer", "conexão", "etc"]

nVoos                          = nDias * companhia_voosDiarios


# Pré-alocação dos vetores
presentesTotal                 = [0]     * nVoos
countRealocadosEmbarcados      = [0]     * nVoos
novosEmbarcados                = [0]     * nVoos
excedentes                     = [0]     * nVoos
voluntarios                    = [0]     * nVoos
forcados                       = [0]     * nVoos
custos                         = [0]     * nVoos
overbooking                    = [False] * nVoos

# fila de espera inicial
filaDeEspera = 0

# pra cada vôo nos nDias
for voo in range(nVoos):
    # Sorteio de presença:
    
    probs = []
    # pra cada passagem vendida
    for _ in range(passagensVendidas):
        # calcula a probabilidade do passageiro aparecer
        probComparecer = random.uniform(probComparecer_low, probComparecer_high)
        # registra a probabilidade do passageiro aparecer
        probs.append(probComparecer)
    
    presentesNovos = 0
    # pra cada probabilidade do passageiro aparecer
    for prob in probs:
        # sorteia um valor
        sorteio = random.random()
        
        # se valor está dentro da probabilidade (i.e probabilidade aconteceu)
        if sorteio < prob:
            # contabiliza que passageiro (novo) compareceu
            presentesNovos+=1
    
    # totalPresentes    = filaDeEspera + presentesNovos
    totalPresentes      = filaDeEspera + presentesNovos
    # registra total de Presentes no vôo
    presentesTotal[voo] = totalPresentes
    
    # se sobrar passageiro
    if totalPresentes > areonave_capacidadePassageiros:
        # assentos disponíveis          = capacidade
        aeronave_assentosDisponiveis    = areonave_capacidadePassageiros
        
        # traz e embarca fila de espera
        countRealocadosEmbarcados[voo]  = filaDeEspera
        # calcula assentos restantes
        aeronave_assentosRestantes      = aeronave_assentosDisponiveis - countRealocadosEmbarcados[voo]
        
        # calcula quantos embarcam
        novosEmbarcados[voo]            = min(presentesNovos, aeronave_assentosRestantes)
        # calcula quantos sobram
        excedentes[voo]                 = presentesNovos - novosEmbarcados[voo]
        
        # excedentes: calcula quantos saem voluntários, ou à força 💀
        voluntarios[voo] = math.floor(excedentes[voo] * taxaVoluntarios)
        forcados[voo]    = excedentes[voo] - voluntarios[voo]
        
        # calcula custos para remanejar passageiros neste vôo
        custos[voo] = voluntarios[voo] * compVoluntaria + forcados[voo] * compForcada
        
        # contabiliza fila de Espera final
        filaDeEspera = voluntarios[voo] + forcados[voo]
        
        # registra que teve overbooking
        overbooking[voo] = True
        
    # se não sobrar passageiro
    else:
        countRealocadosEmbarcados[voo] = filaDeEspera           # registra que ninguém realocado (fila de espera vazia)
        novosEmbarcados[voo]           = novosEmbarcados        # registra passageiros que apareceram/embarcaram
        excedentes[voo]                = 0                      # registra nenhum excedente
        voluntarios[voo]               = 0                      # registra nenhum realocado voluntário
        forcados[voo]                  = 0                      # registra nenhum realocado forçado
        custos[voo]                    = 0                      # registra nenhum custo adicional no vôo
        filaDeEspera                   = 0                      # registra ninguém na fila de espera
        overbooking[voo]               = False                  # registra que não ouve overbooking
        

# Estatísticas
print("Resultados da Simulação:")        
print(f"Taxa média de overbooking {(sum(overbooking) / len(overbooking)) * 100:.2f}%")
print(f"Custo total: R$ {sum(custos):.2f} ")
print(f"Custo médio diário das compensações: R$ {sum(custos) / nDias:.2f}")
print(f"Quantos passageiros foram realocados voluntariamente: {sum(voluntarios)}")
print(f"Quantos passageiros foram realocados opressivamente: {sum(forcados)}")

print("\nBÔNUS:")
print(f"Média de passageiros por vôo: {math.floor(sum(presentesTotal) / len(presentesTotal))}")
print(f"Total de excedentes: {sum(excedentes)}")





"""
--------------------------------------------------------------------------------------------------------------------------------------------------
embarcados = 0
if embarcados > areonave_capacidadePassageiros:
    filaDeEspera=[]
    passageirosExcedentes = ["bob", "teresa", "mary", "etc"]
    
    for p in range(len(passageirosExcedentes)):
        filaDeEspera.append(passageirosExcedentes[p])

filaDeEspera_parte_voluntario_naoEmbarcaPor = {
    (0.25, True,  1000), 
    (0.75, False, 2500)}        
"""

"tanto voluntários quanto forçados entram na fila de espera para embarcar no próximo voo, com prioridade sobre os passageiros originais do voo." 


# calcule: 
# a taxa média de overbooking; 
# o custo total 
# e o custo médio diário das compensações; 
# quantos passageiros foram realocados voluntariamente 
# e quantos foram forçados.
    
    

