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
passageiro_ProbEmbarque_low    = 0.90 
passageiro_ProbEmbarque_high   = 0.95
perfis                         = ["executivo", "lazer", "conexão", "etc"]
nDias                          = 100

nVoos           = nDias * companhia_voosDiarios
taxaVoluntarios = 0.25
compVoluntaria  = 1000
compForcada     = 2500


# Pré-alocação dos vetores
presentesTotal            = [0]     * nVoos
countRealocadosEmbarcados = [0]     * nVoos
novosEmbarcados           = [0]     * nVoos
excedentes                = [0]     * nVoos
voluntarios               = [0]     * nVoos
forcados                  = [0]     * nVoos
custos                    = [0]     * nVoos
overbooking               = [False] * nVoos

# fila de espera inicial
filaDeEspera = 0


for voo in range(nVoos):
    #Sorteio de presença
    
    probs = []
    for _ in range(passagensVendidas):
        probComparecer = random.uniform(0.90, 0.95)
        probs.append(probComparecer)
    
    presentesNovos = 0
    
    for prob in probs:
        sorteio = random.random()
        
        if sorteio < prob:
            presentesNovos+=1
    
    totalPresentes      = filaDeEspera + presentesNovos
    presentesTotal[voo] = totalPresentes
    
    # se sobrar passageiro
    if totalPresentes > areonave_capacidadePassageiros:
        # disponíveis                   = capacidade
        aeronave_assentosDisponiveis    = areonave_capacidadePassageiros
        
        # traz e embarca fila de espera
        countRealocadosEmbarcados[voo]  = filaDeEspera
        aeronave_assentosRestantes      = aeronave_assentosDisponiveis - countRealocadosEmbarcados[voo]
        
        # calcula quantos sobram
        novosEmbarcados[voo]            = min(presentesNovos, aeronave_assentosRestantes)
        excedentes[voo]                 = presentesNovos - novosEmbarcados[voo]
        
        # excedentes: quantos saem voluntário, ou à força 💀
        voluntarios[voo] = math.floor(excedentes[voo] * taxaVoluntarios)
        forcados[voo] = excedentes[voo] - voluntarios[voo]
        
        # calcula custos para remanejar passageiros neste vôo
        custos[voo] = voluntarios[voo] * compVoluntaria + forcados[voo] * compForcada
        
        # fila de Espera final
        filaDeEspera = voluntarios[voo] + forcados[voo]
        
        # teve overbooking
        overbooking[voo] = True
        
    # se não sobrar passageiro
    else:
        countRealocadosEmbarcados[voo] = filaDeEspera
        novosEmbarcados[voo] = novosEmbarcados
        excedentes[voo] = 0
        voluntarios[voo] = 0
        forcados[voo] = 0
        custos[voo]
        fila = 0
        overbooking[voo] = False
        


# Estatísticas
print("Resultados da Simulação:")        
print(f"Taxa média de overbooking {(sum(overbooking) / len(overbooking)) * 100:.2f}%")
print(f"Custo total: R$ {sum(custos):.2f} ")
print(f"Custo médio diário das compensações: R$ {sum(custos) / nDias:.2f}")
print(f"Quantos passageiros foram realocados voluntariamente: {sum(voluntarios)}")
print(f"Quantos passageiros foram realocados opressivamente: {sum(forcados)}")

print("\nBÔNUS:")


        
        
        
        
    
    


"""
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
    
    

