---
name: meta-ads-atualizar
version: '2.0.0'
description: "Rotina de atualização do plugin de Meta Ads. Use quando o usuário pedir para\natualizar a skill de Meta Ads, checar mudanças de plataforma, revisar\nbenchmarks ou verificar se algum arquivo de referência está desatualizado.\nBusca fontes primárias, compara com o que está escrito e propõe as\nreescritas com diff para aprovação.\n"
license: MIT
---

# Meta Ads · Atualizar (manutenção do conhecimento)

O conhecimento desta família de skills perde validade em velocidades diferentes. Esta rotina mantém os arquivos vivos sem reescrever o que não mudou. O produto final nunca é aplicado direto: é um **diff proposto**, arquivo por arquivo, que o usuário aprova antes de virar versão nova.

## Volatilidade por arquivo (o que checar, onde)

| Arquivo | Volatilidade | Fontes primárias a checar |
|---|---|---|
| `estado-da-arte-2026.md` | Alta | Página Out-of-Cycle Changes da Marketing API; Graph API Changelog; Meta Newsroom; Engineering at Meta (filtro ML applications); Business Help Center (Advantage+, atribuição) |
| `benchmarks.md` | Alta | Release trimestral da Meta (Investor Relations): preço médio por anúncio e impressões; WordStream/LocaliQ (anual); CTC Channel Mix Benchmark; Triple Whale; Gupta Media; IAB Brasil (abril); eMarketer |
| `criativo-copy.md` | Alta | Motion Creative Benchmarks (anual); registro de vencedores da própria carteira (mensal, fonte interna) |
| `leitura-dados.md` | Média | Changelog da Marketing API (remoções de campo, breakdowns, versões) |
| `leitura-diagnostico.md` | Média | Mudanças de atribuição e de entrega anunciadas pela Meta |
| `sinal-capi.md` | Baixa | Business Help Center (requisitos de volume por otimização, EMQ) |
| `estrutura-conta.md` | Baixa | Business Help Center (estado Advantage+) |
| `relatorios.md` | Baixa | Só muda quando a operação mudar |

## Rotina (quando o usuário pedir "atualiza a skill")

1. **Ler os cabeçalhos.** Cada referência traz `Verificado em` e volatilidade. Listar o que está vencido: alta volatilidade acima de 90 dias, média acima de 180.
2. **Buscar as fontes primárias** dos arquivos vencidos (tabela acima). Regra de ouro herdada das skills: só entra fato com fonte primária; número só com amostra e período. Blog de ferramenta e conteúdo gerado por IA não são fonte.
3. **Comparar** o que a fonte diz hoje com o que o arquivo afirma. Três categorias: confirmado (nada muda), mudou (reescrever o trecho), novo (adicionar com fonte e data).
4. **Propor o diff** por arquivo: trecho atual → trecho novo → fonte. Nada é aplicado sem aprovação.
5. **Aplicar o aprovado**, atualizar o cabeçalho (`Verificado em` + incremento de versão) e registrar um changelog curto no fim do arquivo alterado.
6. **Checar deprecações com data.** Qualquer prazo novo da Marketing API entra na seção de calendário do `estado-da-arte-2026.md` e merece aviso destacado na resposta (quebras silenciosas são as mais caras).

## Cadência recomendada

- **Quinzenal (5 min):** só Out-of-Cycle Changes e changelog. Deprecação com data → calendário.
- **Mensal (~20 min):** rodada completa desta rotina com foco em `criativo-copy.md` (formatos ganhando na carteira) e no que venceu.
- **Trimestral (~30 min):** `benchmarks.md` no release da Meta; `estado-da-arte-2026.md` na versão nova da API.
- **Quando quebrar:** o arquivo afetado, no dia.

## Fonte interna: o registro de vencedores

A fonte que mais melhora `criativo-copy.md` não é externa. Se o log de vencedores da carteira (formato, gancho, conta, data) estiver disponível, calcular a taxa de acerto interna por formato e gancho e propor a substituição gradual da tabela da Motion pela tabela própria, mantendo as duas lado a lado até a interna ter 90 dias de dado.
