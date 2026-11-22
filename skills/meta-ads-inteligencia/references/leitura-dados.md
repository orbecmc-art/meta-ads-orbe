# Leitura de dados · disciplina que evita análise confiante e errada

> Verificado em 22/11/2026 · v1.1 · volatilidade: média

Vale para leitura via conector MCP da Meta e, no que couber, para CSV exportado do Gerenciador.

## Regras de leitura via API/MCP

1. **Valores monetários vêm em centavos (inteiro).** US$ 50 = 5000. Dividir por 100 antes de mostrar. Confirmar a **moeda da conta** nos detalhes da ad account antes de apresentar qualquer valor; nunca assumir USD ou BRL.
2. **Filtrar entidades sem entrega.** Por padrão, impressões > 0. A API de insights devolve dado de qualquer entidade que gastou no período, mesmo já pausada ou deletada; ao analisar performance atual, filtrar também por `effective_status` ativo.
3. **Paginar antes de calcular.** Nunca apresentar contagem de anúncios, breakdown por conjunto ou CPA até ter buscado todas as páginas. Se um conjunto parece ter só 1 anúncio, verificar se há mais páginas antes de concluir.
4. **Nunca inferir evento de otimização pelo nome.** Ler `promoted_object` na configuração real. Ausente = perguntar ao usuário.
5. **Janela padrão: últimos 7 dias**, comparados aos 7 anteriores. Janelas maiores só quando o volume pede. Listagens iniciais limitadas (10 entidades), aprofundando sob demanda.
6. **Breakdowns opt-in (desde 03/08/2026):** `impression_device`, `hourly_stats_aggregated_by_audience_time_zone` e `frequency_value` devolvem vazio em requisição síncrona para quem não optou. Resposta vazia nesses campos significa opt-in pendente ou necessidade de report job assíncrono, não "sem dado". Breakdown novo (05/11/2026): `pa_creator_ig_handle` agrupa resultado de partnership ads pelo @ do criador; não combina com outros breakdowns.
7. **Registrar o modelo de atribuição de toda extração.** Números de modelos diferentes não se comparam (ver `estado-da-arte-2026.md`).
8. **Benchmarks first-party antes de qualquer fonte externa:** `ads_insights_industry_benchmark`, `ads_insights_auction_ranking_benchmarks` e `ads_insights_performance_vs_peers` (percentil do conjunto contra a coorte; só comparar percentis dentro do mesmo conjunto). Grupo de pares real da conta, sem viés de fornecedor.
9. **Recomendações da plataforma** (opportunity score, campaign score e similares) entram como insumo, não como verdade: têm viés de gasto.
10. **Métrica morta:** `total_video_consumption_rate` parou de retornar em todas as versões no início de nov/2026, sem substituto. Relatório que dependia dela mostra vazio; não é queda de vídeo.
11. **Entrega fora do dispositivo escolhido** em conjunto novo de Vendas criado na v27.0 ou depois: ler `targeting_automation.individual_setting.device`. Valor 1 é a expansão ligada por padrão, não erro de configuração.

## Sequência padrão: auditoria de conta (só leitura)

1. Detalhes da conta (moeda, fuso, limites) + atividade recente (o que mudou e quem mudou).
2. Estrutura: campanhas, conjuntos, ads ativos, com paginação completa.
3. Sinal: dataset/pixel, qualidade, cobertura CAPI, EMQ (ver `sinal-capi.md`).
4. Performance 7/30 dias com os filtros corretos.
5. Benchmarks first-party.
6. Erros de entrega.
7. Saída no template de auditoria de `relatorios.md`. O plano de ação sai pronto para a skill de operação (ou um humano) executar.

## Sem MCP (fallback com CSV)

Tudo funciona com exportação do Gerenciador. Pedir as colunas conforme a tarefa: nome, gasto, impressões, CTR, CPC, frequência, resultados, CPA/ROAS, com breakdown diário para fadiga e por posicionamento/demografia quando o diagnóstico pedir. As mesmas árvores de `leitura-diagnostico.md` se aplicam; só muda a coleta.

## Changelog

- **v1.1 (22/11/2026):** breakdown `pa_creator_ig_handle`; terceira ferramenta first-party; campaign score; métrica `total_video_consumption_rate` removida; leitura da expansão de dispositivo da v27.0.
- **v1.0 (18/08/2026):** versão inicial.
