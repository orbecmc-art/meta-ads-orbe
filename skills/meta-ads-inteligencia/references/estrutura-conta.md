# Estrutura de conta · consolidar até doer

> Verificado em 18/08/2026 · v1.0 · volatilidade: baixa

O sistema aprende por volume de evento por unidade de aprendizado. Toda divisão de conjunto criada por conforto de leitura de relatório rouba aprendizado do modelo e cria sobreposição de leilão contra a própria conta.

## Padrão de estrutura (2026)

- **Uma campanha por objetivo de negócio.** Não por público, não por criativo, não por "teste".
- **Orçamento no nível de campanha.** Advantage+ ligado nas três seções (orçamento, público, posicionamento). Ver a tabela liga/desliga em `estado-da-arte-2026.md`.
- **Poucos conjuntos, muitos anúncios.** O teste acontece no nível do criativo, não na multiplicação de conjuntos.

## Quando separar conjunto (as únicas razões válidas)

Só separe quando houver **diferença econômica real** entre os grupos:

1. Margem diferente entre linhas de produto ou serviço.
2. Ticket diferente que muda o CPA aceitável.
3. Geografia com custo de operação ou logística diferente.
4. Exigência regulatória ou de compliance distinta (ex.: saúde com regras de conselho profissional).

Segmentar por criativo ou por "público frio versus quente" em 2026 é herança de 2019. Se alguém pedir essa separação, explique o custo (aprendizado dividido, leilão sobreposto) antes de executar.

**Detecção de sobreposição:** rodar `ads_insights_auction_ranking_benchmarks` mensalmente. Quando a ferramenta recomendar consolidação, consolide. É benchmark first-party, gratuito e usa o grupo de pares real da conta.

## Exclusão de posicionamento é decisão com custo

Em 2026 ela desliga o Advantage+ da seção inteira. Pedido de "tirar Audience Network" recebe primeiro a demonstração do custo, depois a decisão do cliente registrada por escrito.

## Convenção de nomenclatura

Padrão sugerido (ajuste ao que a equipe já usa, mas nunca opere sem convenção):

```
Campanha:  [CLIENTE] · [OBJETIVO] · [AAAA-MM]
Conjunto:  [RAZÃO ECONÔMICA DA SEPARAÇÃO] · [GEO se houver]
Anúncio:   [FORMATO] · [ÂNGULO/GANCHO] · [vNN] · [AAAA-MM-DD]
```

Exemplos:
- `Clinica X · Cadastros · 2026-08`
- `Implante (ticket alto) · GYN`
- `video · oferta-direta · v03 · 2026-08-18`

Regras: o nome do anúncio identifica formato e ângulo sem abrir a peça; a versão permite rastrear iteração; nada de nome tipo "teste final 2 AGORA VAI".

## Fase de aprendizado

Sai da fase de aprendizado com cerca de 50 conversões por semana no conjunto. Consequências práticas:

- Conjunto que nunca atinge esse volume vive em aprendizado limitado; a solução costuma ser consolidar conjuntos ou subir um degrau no evento de otimização (ver `sinal-capi.md`), não aumentar lance.
- Evite reset desnecessário: mudança significativa de orçamento (acima de ~20%/dia), público ou criativo dominante reinicia aprendizado. Agrupe mudanças; não faça microajuste diário.

## Checklist antes de subir campanha nova

1. Sinal auditado (`sinal-capi.md`): CAPI, EMQ, volume do evento.
2. Objetivo de negócio definido e evento de otimização compatível com o volume da conta.
3. Estrutura mínima: 1 campanha, 1 conjunto (ou os poucos justificados), orçamento de campanha.
4. Criativos suficientes para o piso semanal (ver `criativo-copy.md`).
5. Nomenclatura aplicada.
6. Destino pós-clique revisado: página carrega rápido no mobile, formulário curto, promessa do anúncio bate com a página. Em 2026 o gargalo de lead gen está depois do clique, não no leilão.
7. Criação nasce **pausada**. Ativação segue as regras de autonomia do SKILL.md.
