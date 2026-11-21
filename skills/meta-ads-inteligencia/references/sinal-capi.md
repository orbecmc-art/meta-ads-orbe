# Higiene de sinal · Pixel, CAPI e evento de otimização

> Verificado em 18/08/2026 · v1.0 · volatilidade: baixa

Em 2026 a conta ganha ou perde no sinal que entrega ao modelo, não no ajuste manual de lance. Nenhuma conta entra em rotina de otimização sem passar por esta checagem. Se o sinal está sujo, qualquer análise em cima dele é análise de lixo.

## Checklist de auditoria de sinal

**1. Conversions API ativa e deduplicada.**
Meta de cobertura: **75%** dos eventos únicos do Pixel também chegando via CAPI. Onde olhar: abas Event Coverage, Event Matching, Event Deduplication e Data Freshness do Events Manager. CAPI sem deduplicação infla resultado; CAPI com cobertura baixa desperdiça o principal canal de sinal em era de bloqueio de cookie.

**2. Event Match Quality acima de 7.**
Score de 0 a 10, calculado sobre as últimas 48 horas. Prioridade de parâmetro segundo a própria Meta:

| Parâmetro | Peso |
|---|---|
| E-mail, click id (fbc) | Alta |
| Telefone, external id | Média |
| Nome, CEP | Baixa |

Cliente que só manda nome e CEP tem EMQ baixo por construção. A correção é no formulário e na integração, não na campanha.

**3. Volume mínimo por tipo de otimização.**

| Otimização | Volume mínimo |
|---|---|
| Conversão padrão em site | Mais de 100 conversões em 2 semanas |
| Value optimization | 30+ compras click-through com pelo menos 2 valores distintos em 7 dias |
| Lead quality optimization | CAPI + `lead_id` + mais de 250 leads/mês |

**4. Se a conta não bate o volume mínimo, mude o evento de otimização.**
Otimizar para compra em conta com 12 vendas por mês é escolher aleatoriedade. Suba um degrau no funil (iniciar checkout, lead qualificado, contato) e amarre o evento intermediário à venda por taxa conhecida. Registre a taxa no card do cliente e revise mensalmente.

## Regras de leitura

- Nunca inferir o evento de otimização pelo nome da campanha ou do conjunto. Ler `promoted_object.custom_event_type` na configuração real. Se estiver ausente, perguntar ao usuário, nunca assumir.
- Conta mista (conjuntos otimizando para eventos diferentes): agrupar por evento antes de qualquer comparação de CPA. Comparar CPA de lead com CPA de compra na mesma tabela é erro de análise.
- Qualidade de lead é entregável, não detalhe. Se o cliente recebe lead que não fecha, CPL bonito não vale nada. Quando a conta passar de 250 leads/mês com CAPI e `lead_id`, ligar lead quality optimization. A Meta está testando Sequenced Events e Preferred Lead Answers para qualidade de lead; vale ser dos primeiros a operar.

## Diagnóstico rápido de sinal (ordem de checagem quando o resultado está estranho)

1. Deduplicação Pixel/CAPI ok? Evento duplicado infla resultado.
2. EMQ caiu nas últimas 48h? Integração pode ter quebrado (troca de site, formulário novo, checkout novo).
3. Data Freshness atrasada? CAPI batch atrasando sinal atrasa o aprendizado.
4. Volume do evento de otimização caiu abaixo do mínimo? A entrega degrada antes de o custo explodir.
5. Alguém mudou o modelo de atribuição ou a janela? Ver `estado-da-arte-2026.md`, seção de atribuição.
