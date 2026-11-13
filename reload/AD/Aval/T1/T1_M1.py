#######
# Q1
#######

import random

def simular_arquitetura_microsservicos(num_transacoes = 10000, seed = 123):
    # Configura a semente para reprodutibilidade
    random.seed(seed)
    
    sucessos_primeira_tentativa = 0
    sucessos_globais = 0
    custo_total_inconsistencia = 0.0
    
    # Probabilidades de falha transacional por requisição de cada serviço.
    p_falha_G = 0.02
    p_falha_I = 0.08
    p_falha_P = 0.05

    MAX_TENTATIVAS = 3  # Tentativa inicial + 2 tentativas adicionais (retry).
    CUSTO_INCONSISTENCIA = 150.0 # Custo por inconsistência.

    for _ in range(num_transacoes):
        # Avaliação do gateway.
        tentativas_G = 0
        sucesso_G = False
        while (tentativas_G < MAX_TENTATIVAS):
            tentativas_G += 1
            if (random.random() >= p_falha_G):
                sucesso_G = True
                break
        # Se o Gateway falhar definitivamente, a transação morre no início.
        if (not sucesso_G):
            continue

        # Avaliação do pagamento.
        tentativas_P = 0
        sucesso_P = False
        while (tentativas_P < MAX_TENTATIVAS):
            tentativas_P += 1
            if (random.random() >= p_falha_P):
                sucesso_P = True
                break
        # Se o Pagamento falhar definitivamente, a transação é cancelada sem custo.
        if not sucesso_P:
            continue

        # Avaliação do inventário.
        tentativas_I = 0
        sucesso_I = False
        while (tentativas_I < MAX_TENTATIVAS):
            tentativas_I += 1
            if (random.random() >= p_falha_I):
                sucesso_I = True
                break

        # Verifica se ocorreu na primeira tentativa globalmente (G, P e I passaram de primeira).
        if ((tentativas_G == 1) and (tentativas_P == 1) and (tentativas_I == 1)):
            sucessos_primeira_tentativa += 1

        if (sucesso_I):
            # Sucesso global, todos os três serviços responderam.
            sucessos_globais += 1
        else:
            # Inconsistência crítica, P já foi processado com sucesso, mas I falhou definitivamente.
            custo_total_inconsistencia += CUSTO_INCONSISTENCIA

    # Cálculo dos indicadores.
    prob_primeira_tentativa = (sucessos_primeira_tentativa / num_transacoes) * 100
    prob_global_sucesso = (sucessos_globais / num_transacoes) * 100
    custo_medio_esperado = custo_total_inconsistencia / num_transacoes

    # Resultados.
    print(f"a) Probabilidade de sucesso na 1ª tentativa: {prob_primeira_tentativa:.2f}%")
    print(f"b) Probabilidade global de sucesso (com retry): {prob_global_sucesso:.2f}%")
    print(f"c) Custo fixo médio esperado por transação: R$ {custo_medio_esperado:.2f}")

simular_arquitetura_microsservicos()

#######
# Q2
#######

import random

def simular_carteira_atuarial(num_segurados = 1000, anos = 15, taxa_juros = 0.05, seed = 123):
    # Configura a semente para reprodutibilidade.
    random.seed(seed)

    # Estados: 1 = Ativo, 2 = Inválido, 3 = Óbito.
    # Limites acumulados das probabilidades de transição a partir de cada estado.
    transicoes = {
        1: [(0.85, 1), (0.97, 2), (1.00, 3)],  # Ativo -> Ativo (85%), Inválido (12%), Óbito (3%)
        2: [(0.08, 1), (0.80, 2), (1.00, 3)],  # Inválido -> Ativo (8%), Inválido (72%), Óbito (20%)
        3: [(1.00, 3)]                         # Óbito -> Óbito (100% - estado absorvente)
    }

    # Inicializa todos os segurados no Estado 1 (Ativo).
    estados_atuais = [1] * num_segurados

    custo_invalidez_nominal = 0.0
    custo_invalidez_vp = 0.0
    custo_obito_nominal = 0.0
    custo_obito_vp = 0.0

    fluxo_caixa_anual = {}

    # Número de segurados vivos ao final do ano 10.
    vivos_ano_10 = 0
    
    # Custos unitários dos benefícios.
    BENEFICIO_INVALIDEZ = 20000.0
    INDENIZACAO_OBITO = 100000.0

    # Iniciando a simulação da coorte atuarial.
    for ano in range(1, anos + 1):
        fator_desconto = (1.0 / ((1.0 + taxa_juros) ** ano))
        invalidos_no_ano = 0
        obitos_no_ano = 0

        proximos_estados = []

        for i in range(num_segurados):
            estado_atual = estados_atuais[i]

            if (estado_atual == 3):
                # Se já está morto, permanece morto.
                proximos_estados.append(3)
                continue

            # Sorteio para transição de estado usando números aleatórios básicos.
            r = random.random()
            proximo_estado = estado_atual

            for prob, dest in transicoes[estado_atual]:
                if r <= prob:
                    proximo_estado = dest
                    break

            proximos_estados.append(proximo_estado)

            # Contabiliza os segurados inválidos e os óbitos ocorridos no ano.
            if (proximo_estado == 2):
                invalidos_no_ano += 1
            elif (proximo_estado == 3):                
                obitos_no_ano += 1 

        estados_atuais = proximos_estados

        # Registra o número de segurados vivos ao final do ano 10.
        if (ano == 10):
            vivos_ano_10 = sum(1 for estado in estados_atuais if estado != 3)
                    
        # Cálculo dos custos nominais e a valor presente no ano.
        gasto_invalidez_ano = invalidos_no_ano * BENEFICIO_INVALIDEZ
        gasto_obito_ano = obitos_no_ano * INDENIZACAO_OBITO
        gasto_total_ano = gasto_invalidez_ano + gasto_obito_ano

        custo_invalidez_nominal += gasto_invalidez_ano
        custo_invalidez_vp += gasto_invalidez_ano * fator_desconto

        custo_obito_nominal += gasto_obito_ano
        custo_obito_vp += gasto_obito_ano * fator_desconto

        fluxo_caixa_anual[ano] = gasto_total_ano

    # Encontra o ano com maior fluxo de saída de caixa.
    ano_pico_caixa = max(fluxo_caixa_anual, key=fluxo_caixa_anual.get)

    vp_fluxos_futuros_ano_10 = 0.0
    
    for ano in range(11, anos + 1):
        fator_desconto_ano_10 = 1.0 / ((1.0 + taxa_juros) ** (ano - 10))
        vp_fluxos_futuros_ano_10 += fluxo_caixa_anual[ano] * fator_desconto_ano_10

    reserva_media_ano_10 = vp_fluxos_futuros_ano_10 / vivos_ano_10
    
    # Resultados.    
    print(f"a) Custo Total de Invalidez (Nominal): R$ {custo_invalidez_nominal:,.2f}")
    print(f"   Custo Total de Invalidez (Valor Presente): R$ {custo_invalidez_vp:,.2f}")
    print(f"b) Custo Total de Óbitos (Nominal): R$ {custo_obito_nominal:,.2f}")
    print(f"   Custo Total de Óbitos (Valor Presente): R$ {custo_obito_vp:,.2f}")
    print(f"c) Ano com maior fluxo de saída de caixa: Ano {ano_pico_caixa}")
    print(f"d) Reserva matemática média por segurado vivo: R$ {reserva_media_ano_10:,.2f}")

simular_carteira_atuarial()

#######
# Q3
#######

import random
import math
import matplotlib.pyplot as plt

def calcular_benford_teorico():
    """Calcula a frequência esperada para cada algarismo de 1 a 9 segundo a Lei de Benford."""
    frequencias = {}
    for d in range(1, 10):
        # P(D = d) = log10(1 + 1/d).
        frequencias[d] = math.log10(1.0 + (1.0 / d))
    return frequencias

def simular_processo_a(n=10000):
    """Item b: Gera 10.000 valores pelo Processo A (uniforme de 1 a 1.000.000) e calcula frequências relativas."""
    contagem = {d: 0 for d in range(1, 10)}
    for _ in range(n):
        valor = random.uniform(1.0, 1000000.0)
        digito = int(str(valor)[0])
        contagem[digito] += 1

    # Retorna frequências relativas (proporção de 0 a 1)
    return {d: contagem[d] / n for d in range(1, 10)}

def simular_processo_b(n=10000):
    """Item c: Gera 10.000 valores pelo Processo B (produto de 10 números uniformes de 1 a 10)."""
    contagem = {d: 0 for d in range(1, 10)}
    for _ in range(n):
        produto = 1.0
        for _ in range(10):
            produto *= random.uniform(1.0, 10.0)
        digito = int(str(produto)[0])
        contagem[digito] += 1

    return {d: contagem[d] / n for d in range(1, 10)}

def calcular_erro_medio_absoluto(obs, esperado):
    """Item f: Calcula o erro médio absoluto entre as frequências observadas e as de Benford."""
    soma_erros = 0.0
    for d in range(1, 10):
        soma_erros += abs(obs[d] - esperado[d])
    return soma_erros / 9.0

def executar_simulacao(num_repeticoes=100, n=10000, seed=123):
    """Item g: Repete 100 vezes os Processos A e B e calcula os erros médios absolutos."""
    random.seed(seed)
    benford = calcular_benford_teorico()

    erros_a = []
    erros_b = []

    for _ in range(num_repeticoes):
        rel_a = simular_processo_a(n)
        rel_b = simular_processo_b(n)        
        erros_a.append(calcular_erro_medio_absoluto(rel_a, benford))
        erros_b.append(calcular_erro_medio_absoluto(rel_b, benford))

    media_erro_a = sum(erros_a) / len(erros_a)
    media_erro_b = sum(erros_b) / len(erros_b)

    return {
        "erros_a": erros_a,
        "erros_b": erros_b,
        "media_erro_a": media_erro_a,
        "media_erro_b": media_erro_b
    }

# Configuração da semente e execução principal.
random.seed(123)
benford_teorico = calcular_benford_teorico()
freq_a = simular_processo_a(10000)
freq_b = simular_processo_b(10000)
erro_a = calcular_erro_medio_absoluto(freq_a, benford_teorico)
erro_b = calcular_erro_medio_absoluto(freq_b, benford_teorico)
simulacoes = executar_simulacao(100, 10000, 123)

# Resultados.
print("\na) Frequências Esperadas (Lei de Benford):")
for d, p in benford_teorico.items():
    print(f"   Dígito {d}: {p * 100:.2f}%")

print("\nb) Frequência relativa Processo A:")
for d, p in freq_a.items():
    print(f"   Dígito {d}: {p * 100:.2f}%")
    
print("\nc) Frequência relativa Processo B:")
for d, p in freq_b.items():
    print(f"   Dígito {d}: {p * 100:.2f}%")

print("\nf) Resumo dos Erros (Única Execução):")
print(f"   Processo A: {erro_a:.5f}")
print(f"   Processo B: {erro_b:.5f}")

print("\ng) Resultados das 100 repetições de Monte Carlo:")
print(f"   Erro Médio Global das 100 repetições (Processo A): {simulacoes['media_erro_a']:.5f}")
print(f"   Erro Médio Global das 100 repetições (Processo B): {simulacoes['media_erro_b']:.5f}")

# Gráficos d, e, g.
digitos = list(range(1, 10))
esp_vals = [benford_teorico[d] for d in digitos]
obs_a_vals = [freq_a[d] for d in digitos]
obs_b_vals = [freq_b[d] for d in digitos]

plt.figure(figsize=(15, 4))

# Gráfico d: Processo A vs Benford.
plt.subplot(1, 3, 1)
plt.scatter(digitos, obs_a_vals, color='red', label='Observado (Proc A)')
plt.plot(digitos, esp_vals, color='blue', linestyle='--', label='Benford Teórico')
plt.title('Item d: Processo A vs Benford')
plt.xlabel('Dígito')
plt.ylabel('Frequência')
plt.legend()
plt.grid(True)

# Gráfico e: Processo B vs Benford.
plt.subplot(1, 3, 2)
plt.scatter(digitos, obs_b_vals, color='green', label='Observado (Proc B)')
plt.plot(digitos, esp_vals, color='blue', linestyle='--', label='Benford Teórico')
plt.title('Item e: Processo B vs Benford')
plt.xlabel('Dígito')
plt.ylabel('Frequência')
plt.legend()
plt.grid(True)

# Gráfico g: Dispersão dos Erros Médios Absolutos nas 100 repetições.
plt.subplot(1, 3, 3)
plt.scatter(range(1, 101), simulacoes['erros_a'], color='red', alpha=0.5, label='Proc A (Erros)')
plt.scatter(range(1, 101), simulacoes['erros_b'], color='green', alpha=0.5, label='Proc B (Erros)')
plt.title('Item g: Erros em 100 Repetições')
plt.xlabel('Repetição')
plt.ylabel('Erro Médio Absoluto (E)')
plt.legend()
plt.grid(True)

plt.tight_layout()
plt.show()