import random

def simular_carteira_atuarial(num_segurados=1000, anos=15,
                             taxa_juros=0.05, seed=123):

    # Configura a semente para reprodutibilidade.
    random.seed(seed)

    # Estados: 1 = Ativo, 2 = Inválido, 3 = Óbito.
    # Limites acumulados das probabilidades de transição.

    # Matriz P1 - Anos 1 a 5
    transicoes_p1 = {
        1: [(0.85, 1), (0.97, 2), (1.00, 3)],
        2: [(0.08, 1), (0.80, 2), (1.00, 3)],
        3: [(1.00, 3)]
    }

    # Matriz P2 - Anos 6 a 10
    transicoes_p2 = {
        1: [(0.82, 1), (0.95, 2), (1.00, 3)],
        2: [(0.06, 1), (0.75, 2), (1.00, 3)],
        3: [(1.00, 3)]
    }

    # Matriz P3 - Anos 11 a 15
    transicoes_p3 = {
        1: [(0.78, 1), (0.93, 2), (1.00, 3)],
        2: [(0.04, 1), (0.70, 2), (1.00, 3)],
        3: [(1.00, 3)]
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

        # Seleciona a matriz de transição correspondente ao ano.
        if ano <= 5:
            transicoes = transicoes_p1
        elif ano <= 10:
            transicoes = transicoes_p2
        else:
            transicoes = transicoes_p3

        fator_desconto = 1.0 / ((1.0 + taxa_juros) ** ano)

        invalidos_no_ano = 0
        obitos_no_ano = 0

        proximos_estados = []

        for i in range(num_segurados):

            estado_atual = estados_atuais[i]

            if estado_atual == 3:
                # Se já está morto, permanece morto.
                proximos_estados.append(3)
                continue

            # Sorteio para transição de estado.
            r = random.random()

            proximo_estado = estado_atual

            for prob, dest in transicoes[estado_atual]:
                if r <= prob:
                    proximo_estado = dest
                    break

            proximos_estados.append(proximo_estado)

            # Contabiliza os segurados inválidos e os novos óbitos.
            if proximo_estado == 2:
                invalidos_no_ano += 1

            elif proximo_estado == 3:
                obitos_no_ano += 1

        estados_atuais = proximos_estados

        # Registra o número de segurados vivos ao final do ano 10.
        if ano == 10:
            vivos_ano_10 = sum(
                1 for estado in estados_atuais if estado != 3
            )

        # Cálculo dos custos nominais e a valor presente no ano.
        gasto_invalidez_ano = (
            invalidos_no_ano * BENEFICIO_INVALIDEZ
        )

        gasto_obito_ano = (
            obitos_no_ano * INDENIZACAO_OBITO
        )

        gasto_total_ano = (
            gasto_invalidez_ano + gasto_obito_ano
        )

        custo_invalidez_nominal += gasto_invalidez_ano
        custo_invalidez_vp += (
            gasto_invalidez_ano * fator_desconto
        )

        custo_obito_nominal += gasto_obito_ano
        custo_obito_vp += (
            gasto_obito_ano * fator_desconto
        )

        fluxo_caixa_anual[ano] = gasto_total_ano

    # Encontra o ano com maior fluxo de saída de caixa.
    ano_pico_caixa = max(
        fluxo_caixa_anual,
        key=fluxo_caixa_anual.get
    )

    # Calcula o valor presente dos fluxos dos anos 11 a 15,
    # considerando como data de referência o final do ano 10.
    vp_fluxos_futuros_ano_10 = 0.0

    for ano in range(11, anos + 1):

        fator_desconto_ano_10 = (
            1.0 / ((1.0 + taxa_juros) ** (ano - 10))
        )

        vp_fluxos_futuros_ano_10 += (
            fluxo_caixa_anual[ano] * fator_desconto_ano_10
        )

    # Reserva Matemática média por segurado vivo.
    if vivos_ano_10 > 0:
        reserva_media_ano_10 = (
            vp_fluxos_futuros_ano_10 / vivos_ano_10
        )
    else:
        reserva_media_ano_10 = 0.0

    # Resultados.
    print(
        f"a) Custo Total de Invalidez (Nominal): "
        f"R$ {custo_invalidez_nominal:,.2f}"
    )

    print(
        f"   Custo Total de Invalidez (Valor Presente): "
        f"R$ {custo_invalidez_vp:,.2f}"
    )

    print(
        f"b) Custo Total de Óbitos (Nominal): "
        f"R$ {custo_obito_nominal:,.2f}"
    )

    print(
        f"   Custo Total de Óbitos (Valor Presente): "
        f"R$ {custo_obito_vp:,.2f}"
    )

    print(
        f"c) Ano com maior fluxo de saída de caixa: "
        f"Ano {ano_pico_caixa}"
    )

    print(
        f"d) Reserva matemática média por segurado vivo: "
        f"R$ {reserva_media_ano_10:,.2f}"
    )


simular_carteira_atuarial()