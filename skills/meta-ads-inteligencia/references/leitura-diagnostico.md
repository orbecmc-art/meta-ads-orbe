# Leitura de resultado e diagnóstico · sintoma, causa, ação

> Verificado em 22/11/2026 · v1.1 · volatilidade: média

Toda leitura termina numa decisão. As árvores abaixo existem para que dois gestores diferentes cheguem à mesma conclusão olhando os mesmos dados.

## Antes de qualquer diagnóstico: cheque a régua

1. **O modelo de atribuição mudou?** Desde 03/03/2026 parte das conversões migrou de click-through para engage-through. Quem lê só click-through vê queda que não existe. O rollout ainda não terminou (nov/2026): duas contas do mesmo cliente podem estar em réguas diferentes. Padronize o modelo por cliente e registre no card da conta.
2. **O sinal está limpo?** Rodar o diagnóstico rápido de `sinal-capi.md` antes de culpar criativo ou público.
3. **A comparação é justa?** Nunca comparar contas com modelos de atribuição diferentes na mesma tabela. Nunca comparar CPA de eventos de otimização diferentes. Nunca rodar teste A/B entre conjuntos com atribuições diferentes.

## Árvore 1 · "O resultado caiu"

```
CPL/CPA subiu
├── CPM subiu junto?
│   ├── Sim, em todas as campanhas → inflação de leilão ou sazonalidade.
│   │   Checar release da Meta e datas comerciais. Ação: revisar meta com o
│   │   cliente com dado na mão, não "otimizar" o inevitável.
│   ├── Sim, só numa campanha + frequência subindo → saturação de público.
│   │   Ação: criativo novo (ângulo novo, não versão), não público novo.
│   └── Sim, só numa campanha + frequência estável → pressão competitiva ou
│       qualidade de anúncio caindo. Ação: rodar auction ranking benchmark;
│       se qualidade caiu, o problema é a peça.
├── CPM estável mas CTR caiu → fadiga de criativo. Ver bandas abaixo.
├── CTR ok mas conversão da página caiu → o problema é pós-clique.
│   Ação: hora de gestor vai para página, formulário e atendimento, não
│   para lance. Decidir pelo dado da conta: o benchmark público oscila
│   (a conversão de lead gen caiu 11% na edição 2025 do WordStream e
│   subiu 10,6% na de 2026).
└── Tudo estável mas o número do Gerenciador caiu → suspeitar de régua:
    atribuição, deduplicação, integração quebrada. Ver sinal-capi.md.
```

## Árvore 2 · Fadiga de criativo (bandas de decisão)

| Estado | Critério | Ação |
|---|---|---|
| Urgente | CTR caiu mais de 20% do pico E frequência acima de 3,0 | Substituir agora. Pausar o anúncio (dentro da autonomia da skill) e acionar brief novo |
| Atenção | CTR caiu 10 a 20% do pico OU frequência entre 2,0 e 3,0 | Planejar substituição na próxima leva semanal |
| Saudável | CTR estável ou subindo, frequência abaixo de 2,0 | Manter. Se for vencedor, iterar ângulo |

Frequência de referência por objetivo: prospecção acima de 2,0 é alerta e acima de 3,0 é crítico; remarketing tolera até 4,0 (alerta) e 6,0 (crítico). A média móvel de 7 dias importa mais que o acumulado: pico de frequência nos últimos 3 dias prevê a queda de amanhã.

## Árvore 3 · Matar, manter ou escalar um anúncio

Pré-condição: o anúncio gastou o suficiente para ser julgado (referência: pelo menos 3x o CPA alvo sem converter, ou 2.000+ impressões para julgar CTR).

```
├── Gastou 3x o CPA alvo sem conversão → matar (pausar), registrar o ângulo
│   testado para não repetir.
├── CPA dentro do alvo e estável há 7+ dias → vencedor. Iterar: 2 a 3
│   variações do mesmo ângulo na próxima leva. Escalar orçamento da campanha
│   em degraus de até 20%/dia (acima disso reseta aprendizado).
├── CPA no limite, CTR bom → problema pós-clique ou de oferta. Testar página
│   antes de matar a peça.
└── Volume baixo demais para julgar → deixar rodar até o critério de gasto.
    Não decidir por ansiedade.
```

## Árvore 4 · Anomalia de CPM

Comparar o CPM atual contra a média móvel de 14 dias da própria conta (nunca contra "média de mercado" sem fonte). Alta acima de 20% é anomalia. Severidade: menor (até 25%), maior (25 a 50%), crítica (acima de 50%). Causas prováveis em ordem de frequência: saturação (frequência sobe junto), queda de qualidade de anúncio, pressão competitiva sazonal, público estreito demais. Q4 roda 30 a 50% acima da linha de base; não tratar sazonalidade como problema da conta.

## Rotinas de leitura

- **Semanal:** fadiga (árvore 2) em todos os anúncios ativos; decisão matar/manter/escalar (árvore 3); um teste de página a cada 15 dias por conta.
- **Mensal:** `ads_insights_industry_benchmark` e `ads_insights_auction_ranking_benchmarks` em toda conta. Conta fora do benchmark de pares entra em plano de recuperação com hipótese escrita.
- **Ao escalar verba:** rodar fadiga no dia seguinte. Gasto maior queima criativo mais rápido.

## O que não fazer

- Não "otimizar" mexendo em 3 coisas ao mesmo tempo. Uma mudança por hipótese, com data de leitura.
- Não pausar campanha inteira por pânico de 1 dia ruim. Janela mínima de leitura: 3 a 7 dias, conforme o volume.
- Não concluir causa sem evidência. Toda causa apontada vem com o dado que a sustenta na mesma frase.

## Changelog

- **v1.1 (22/11/2026):** aviso de rollout de atribuição ainda em curso; árvore 1 sem a regra geral tirada do WordStream 2025.
- **v1.0 (18/08/2026):** versão inicial.
