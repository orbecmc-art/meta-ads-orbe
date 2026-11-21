# Estado da arte da plataforma · 2026

> Verificado em 18/08/2026 · v1.0 · volatilidade: alta (revisar a cada release da Marketing API)

Levantamento verificado em 18/08/2026, só com fonte primária (posts oficiais da Meta, papers, release de resultados). Revisar a cada release da Marketing API.

## O motor por baixo do leilão foi reescrito

Entre 2024 e 2026 a Meta trocou retrieval, ranking e modelo de fundação. Nada disso aparece no Gerenciador, mas define para quem o anúncio é entregue.

**Andromeda (retrieval, confirmado).** Seleciona os candidatos a anúncio entre dezenas de milhões antes do ranking. A Meta reporta 6% de ganho em recall e 8% em qualidade de anúncio em segmentos selecionados. O post oficial diz de forma explícita que o sistema foi construído para absorver o crescimento de criativos gerados por IA. É daí que vem a pressão por volume: o motor diferencia mais peças do que qualquer equipe produz. Fonte: Engineering at Meta, 02/12/2024.

**GEM (modelo de fundação, confirmado).** Modelo em escala de LLM que treina sobre engajamento e conteúdo de anúncio e destila conhecimento para centenas de modelos menores. Q2/25: +5% de conversões no Instagram, +3% no Feed do Facebook. Q4/25, com o dobro de GPUs: +3,5% de cliques no Facebook, +1% de conversão no Instagram. Fontes: post GEM (11/2025), Meta Newsroom (01/2026).

**Lattice (ranking, confirmado).** Arquitetura multi-domínio e multi-objetivo que consolida sinais fragmentados entre superfícies. Paper no KDD 2026: 10% de receita em métrica de topo, 6% de taxa de conversão, 20% de economia de infra. A Meta confirmou publicamente 12% de aumento em qualidade de anúncio atribuído ao Lattice. Fontes: arXiv 2512.09200, Meta Newsroom.

**MARM (inferência, confirmado).** Roteamento adaptativo: em vez de um modelo único para toda requisição, a Meta alinha complexidade de modelo ao contexto e à intenção da pessoa. Entrou no Instagram no Q4/25: +3% conversões, +5% CTR nos usuários alvo. É o que está por trás da variação de performance entre posicionamentos que muita conta nota sem explicação. Fonte: Engineering at Meta, 31/03/2026.

**Consequência prática:** o sistema aprende por volume de sinal e diferencia por volume de criativo. Otimização manual de lance e recorte fino de público renderam lugar para: sinal limpo entrando (ver `sinal-capi.md`) e criativo variado saindo (ver `criativo-copy.md`).

**Cuidado com o UTIS.** Circula em blog de ferramenta e em conteúdo brasileiro que o UTIS seria o quarto pilar do stack de anúncios. O post oficial da Meta (14/01/2026) trata de recomendação orgânica de Reels do Facebook, não de leilão de anúncio. Estratégia de mídia "otimizada para UTIS" é construção em cima de inferência de blog. Mesma régua para qualquer "número mágico de criativos do Andromeda": a Meta nunca publicou número. O único dado com amostra declarada é da Motion (ver `benchmarks.md`).

## Atribuição: a régua mudou em 03/03/2026

A Meta reescreveu como uma conversão é creditada. Contas que continuaram lendo só click-through viram queda aparente de resultado sem queda real de venda.

- **Click-through, agora mais estreito.** Conta conversão em 1 ou 7 dias após um *link click*. Antes contava qualquer clique. Uma fatia do que aparecia aqui migrou para engage-through.
- **Engage-through, a janela nova.** 1 dia após uma ação de clique que não seja link click: curtida, compartilhamento, salvamento. Em vídeo, conta a partir de 5 segundos de reprodução (a janela caiu de 10 para 5 segundos).
- **View-through.** 1 dia após a impressão. Segue igual.

A coluna Resultados soma as janelas ativas. Comparar duas contas com modelos diferentes na mesma planilha produz conclusão errada, e a própria Meta avisa isso.

**Atribuição incremental** saiu do laboratório: a Meta reporta +24% de conversões incrementais contra a atribuição padrão no rollout do Q4. Existe também o modelo Custom, em que você entrega os dados da sua ferramenta e a entrega da Meta otimiza pela sua lógica. O custo de adotar qualquer um dos dois: os números caem de patamar e param de ser comparáveis com o histórico. Essa conversa acontece com o cliente **antes** da mudança na conta, nunca depois.

## Advantage+ deixou de ser um tipo de campanha e virou um estado

Quem escolhe Vendas, Promoção de App ou Cadastros cai direto no setup Advantage+. Não existe mais escolha binária; existe liga e desliga por seção.

| Seção | Fica ligado quando | Desliga quando | Leitura recomendada |
|---|---|---|---|
| Orçamento | Orçamento de campanha, com um ou vários conjuntos | Múltiplos conjuntos sem orçamento de campanha | Ligado é o padrão. Orçamento por conjunto só com motivo escrito |
| Público | Configurações entram como sugestão | Você marca "limitar ainda mais o alcance" e desmarca "usar como sugestão" | Dá para subir idade mínima até 25 e excluir público personalizado sem desligar. Use isso antes de restrição dura |
| Posicionamento | Advantage+ placements ativo | Você exclui qualquer posicionamento ou desativa mobile/desktop | Excluir posicionamento em 2026 custa mais caro que o desconforto de aparecer em Audience Network |

Controles em nível de conta não afetam o estado Advantage+ da campanha. Nada é tecnicamente obrigatório; o que a Meta faz é condicionar as otimizações mais avançadas ao uso conjunto de público, posicionamento e orçamento Advantage+. Fonte: Business Help Center.

Se o cliente pedir "tira o Audience Network", a resposta é mostrar o custo da exclusão (desliga o Advantage+ da seção inteira), não obedecer em silêncio.

## Calendário de prazos que quebram relatório e conta

- **03/08/2026 (em vigor).** Três breakdowns do Ads Insights viraram opt-in: `impression_device`, `hourly_stats_aggregated_by_audience_time_zone` e `frequency_value`. Requisição síncrona devolve vazio para quem não optou. Solução: optar no Gerenciador ou migrar para report job assíncrono.
- **27/08/2026.** Messenger Stories morre como posicionamento, removido de `messenger_positions` na v26.0 de forma silenciosa: a chamada continua passando, a entrega é que muda.
- **24/09/2026.** Retirada da Graph API v20.0.
- **06/10/2026.** Fim da Marketing API v24.0. Versão atual: v26.0 (29/07/2026).
- **27/10/2026.** 47 endpoints de Commerce Order Management removidos, sem substituto, em todas as versões. Afeta e-commerce com integração própria.
- **21/01/2027.** Retirada da v21.0.

Onde as quebras silenciosas aparecem primeiro: página de **Out-of-Cycle Changes** da Marketing API. Checar quinzenalmente.

## Superfícies novas de 2026

- **WhatsApp Status e Canais.** Na v26.0 ganharam carrossel de até 10 cards e otimização para Vendas, Cadastros e Engajamento. Mensagens pagas no WhatsApp passaram de US$ 2 bi de run-rate anual no Q4/25. É o canal com maior aderência cultural ao cliente brasileiro de serviço local, e ainda barato porque poucos anunciantes migraram.
- **Threads.** Rollout global em 21/01/2026. Formatos via API: imagem e vídeo 4:5, vídeo de 1.91:1 a 9:16, carrossel estático 1:1. Inventário novo costuma ter CPM abaixo da média por um período.
- **Meta Business Agent.** Lançado em 03/06/2026. Agente de IA que responde, recomenda produto do catálogo, agenda e qualifica lead no WhatsApp e Messenger. Mais de 1 milhão de negócios usando.

**Regra para superfície nova:** teste com 5% a 10% da verba, com hipótese escrita, verba teto e data de leitura definidas antes de subir. Nunca por realocação de campanha que está performando. Sem isso vira gasto de curiosidade.
