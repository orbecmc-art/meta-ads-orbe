# Estado da arte da plataforma · 2026

> Verificado em 22/11/2026 · v1.1 · volatilidade: alta (revisar a cada release da Marketing API)

Só fonte primária: posts oficiais da Meta, papers, documentação e release de resultados. Revisar a cada release da Marketing API.

## O motor por baixo do leilão foi reescrito

Entre 2024 e 2026 a Meta trocou retrieval, ranking e modelo de fundação. Nada disso aparece no Gerenciador, mas define para quem o anúncio é entregue.

**Andromeda (retrieval, confirmado).** Seleciona os candidatos a anúncio entre dezenas de milhões antes do ranking. A Meta reporta 6% de ganho em recall e 8% em qualidade de anúncio em segmentos selecionados. O post oficial diz de forma explícita que o sistema foi construído para absorver o crescimento de criativos gerados por IA. É daí que vem a pressão por volume: o motor diferencia mais peças do que qualquer equipe produz. Fonte: Engineering at Meta, 02/12/2024.

**GEM (modelo de fundação, confirmado).** Modelo em escala de LLM que treina sobre engajamento e conteúdo de anúncio e destila conhecimento para centenas de modelos menores. Q2/25: +5% de conversões no Instagram, +3% no Feed do Facebook. Q4/25, com o dobro de GPUs: +3,5% de cliques no Facebook, +1% de conversão no Instagram. Fontes: post GEM (11/2025), Meta Newsroom (01/2026).

**Lattice (ranking, confirmado).** Arquitetura multi-domínio e multi-objetivo que consolida sinais fragmentados entre superfícies. Paper no KDD 2026: 10% de receita em métrica de topo, 6% de taxa de conversão, 20% de economia de infra. A Meta confirmou publicamente 12% de aumento em qualidade de anúncio atribuído ao Lattice. Fontes: arXiv 2512.09200, Meta Newsroom.

**MARM (inferência, confirmado).** Roteamento adaptativo: em vez de um modelo único para toda requisição, a Meta alinha complexidade de modelo ao contexto e à intenção da pessoa. Entrou no Instagram no Q4/25: +3% conversões, +5% CTR nos usuários alvo. É o que está por trás da variação de performance entre posicionamentos que muita conta nota sem explicação. Fonte: Engineering at Meta, 31/03/2026.

**Atualizações de outubro de 2026 (Engineering at Meta).**

- **GEM virou um modelo central único (13/10/2026).** A Meta abandonou modelos separados por superfície. Um só modelo prevê clique e conversão juntos em todas as superfícies e objetivos, e o que ele aprende onde sobra clique transfere para onde falta conversão. Ganho publicado no último ano, nos usuários alvo: +5,8% de conversão no Facebook, +4,1% no Instagram, +1,6% em conversão fora da plataforma.
- **Andromeda pontua o inventário inteiro (28/10/2026).** Mais de 1 bilhão de anúncios avaliados por segundo num único servidor, 100 vezes a geração de 2024, e +2,4% de conversão no Facebook desde 2025. O post aponta a causa: as ferramentas generativas fizeram os anunciantes criarem centenas de milhões de anúncios novos.
- Lattice e MARM não tiveram post novo entre agosto e novembro de 2026.

Fontes: engineering.fb.com/2026/10/13/ml-applications/generative-ads-model-gem-scaling-frontier-ads-ai · engineering.fb.com/2026/10/28/ml-applications/meta-andromeda-next-gen-ads-retrieval-gpu-co-design

**Consequência prática:** o sistema aprende por volume de sinal e diferencia por volume de criativo. Otimização manual de lance e recorte fino de público renderam lugar para: sinal limpo entrando (ver `sinal-capi.md`) e criativo variado saindo (ver `criativo-copy.md`). Os posts de outubro reforçam o ponto: o sistema já avalia o inventário inteiro, então recorte manual de público para "ajudar o algoritmo" compete com ele.

**Cuidado com o UTIS.** Circula em blog de ferramenta e em conteúdo brasileiro que o UTIS seria o quarto pilar do stack de anúncios. O post oficial da Meta (14/01/2026) trata de recomendação orgânica de Reels do Facebook, não de leilão de anúncio. Estratégia de mídia "otimizada para UTIS" é construção em cima de inferência de blog. Mesma régua para qualquer "número mágico de criativos do Andromeda": a Meta nunca publicou número. O único dado com amostra declarada é da Motion (ver `criativo-copy.md`).

## Atribuição: a régua mudou em 03/03/2026

A Meta reescreveu como uma conversão é creditada. Contas que continuaram lendo só click-through viram queda aparente de resultado sem queda real de venda.

- **Click-through, agora mais estreito.** Conta conversão em 1 ou 7 dias após um *link click*. Antes contava qualquer clique. Uma fatia do que aparecia aqui migrou para engage-through.
- **Engage-through, a janela nova.** 1 dia após uma ação de clique que não seja link click: curtida, compartilhamento, salvamento. Em vídeo, conta a partir de 5 segundos de reprodução (a janela caiu de 10 para 5 segundos).
- **View-through.** 1 dia após a impressão. Segue igual.
- **O rollout ainda não terminou (nov/2026).** A Meta mantém o aviso de que algumas contas usam as versões anteriores de click-through e engage-through. Duas contas do mesmo cliente podem estar em réguas diferentes.

A coluna Resultados soma as janelas ativas. Comparar duas contas com modelos diferentes na mesma planilha produz conclusão errada, e a própria Meta avisa isso.

**Atribuição incremental** saiu do laboratório: a Meta reporta +24% de conversões incrementais contra a atribuição padrão no rollout do Q4/25, e não publicou número novo desde então. Restrições que pegam: não aceita controle de lance, o modelo não muda depois de publicar e não há dado antes de 01/04/2025.

**Custom attribution.** Terceiro modelo: você manda sua lógica de crédito por conversão via CAPI ou parceiro (Adobe, Northbeam, Rockerbox, Triple Whale) e a entrega da Meta otimiza por ela. Só em campanha nova, objetivo de vendas otimizando compra, lance de maior valor ou maior volume, e 1 a 2 semanas recebendo sinal antes de liberar. Conta de cadastro ou mensagem não usa hoje.

O custo de adotar incremental ou custom: os números caem de patamar e param de ser comparáveis com o histórico. Essa conversa acontece com o cliente **antes** da mudança na conta, nunca depois.

Fontes: Business Help Center 460276478298895 (modelos), 1521407946215030 (custom), 644554008179419 (incremental).

## Advantage+ deixou de ser um tipo de campanha e virou um estado

Quem escolhe Vendas, Promoção de App ou Cadastros cai direto no setup Advantage+. Não existe mais escolha binária; existe liga e desliga por seção.

| Seção | Fica ligado quando | Desliga quando | Leitura recomendada |
|---|---|---|---|
| Orçamento | Orçamento de campanha, com um ou vários conjuntos | Múltiplos conjuntos sem orçamento de campanha | Ligado é o padrão. Orçamento por conjunto só com motivo escrito |
| Público | Configurações entram como sugestão | Você marca "limitar ainda mais o alcance" e desmarca "usar como sugestão" | Dá para subir idade mínima até 25 e excluir público personalizado sem desligar. Use isso antes de restrição dura |
| Posicionamento | Advantage+ placements ativo | Você exclui qualquer posicionamento ou desativa mobile/desktop | Excluir posicionamento em 2026 custa mais caro que o desconforto de aparecer em Audience Network |

Controles em nível de conta não afetam o estado Advantage+ da campanha. Nada é tecnicamente obrigatório; o que a Meta faz é condicionar as otimizações mais avançadas ao uso conjunto de público, posicionamento e orçamento Advantage+. Fonte: Business Help Center (tabela reconfirmada em 22/11/2026).

Se o cliente pedir "tira o Audience Network", a resposta é mostrar o custo da exclusão (desliga o Advantage+ da seção inteira), não obedecer em silêncio.

**O que mudou em volta da tabela (out e nov/2026):**

- **Setup recomendado em todos os objetivos.** O fluxo Advantage+ está chegando a tráfego, reconhecimento e engajamento. As opções manuais continuam disponíveis.
- **Campaign score de 0 a 100 na criação.** Nota por campanha, enquanto ela é montada, que sobe conforme você aplica recomendações. É diferente do Opportunity Score, que é da conta. A Meta avisa que nota alta não prevê performance: tratar como lista de sugestões, não como meta.
- **Expansão de dispositivo ligada por padrão (v27.0).** Conjunto novo de Vendas que segmenta por dispositivo ou sistema nasce com `device = 1`. Para manter só os dispositivos escolhidos, mandar `device = 0`. Conjuntos existentes não mudam. Passa a valer em todas as versões por volta de fevereiro de 2027.
- **Lookalike sem país na criação (v27.0).** O público semelhante passa a entregar nas localizações do conjunto.
- **Product showcase pode ligar sozinho (v27.0)** quando a Meta acha um conjunto de produtos do catálogo que casa com o anúncio. Desligar com `product_extensions.enroll_status = OPT_OUT`. Só afeta conta com catálogo.
- **Creative audience pairing (19/10/2026).** Opt-in por conjunto: idade e gênero saem do conjunto e vão para o criativo, como persona por anúncio ou por imagem e vídeo. Fala com perfis diferentes dentro do mesmo conjunto, sem abrir um conjunto por perfil.

Fontes: Business Help Center 906206294602874 e 3864826443789572 · Marketing API changelog v27.0 · Out-of-Cycle Changes 2026.

## Calendário de prazos que quebram relatório e conta

Versão atual: **v27.0, de 04/11/2026** (Graph API e Marketing API). As páginas antigas em `/docs/graph-api/changelog` ainda mostram v26.0. A fonte atualizada é `developers.facebook.com/documentation/ads-commerce/marketing-api/marketing-api-changelog`.

**Próximos prazos:**

- **21/01/2027.** Graph API v21.0 removida.
- **Por volta de fevereiro de 2027.** A Meta escreveu "cerca de 90 dias após 04/11, data a confirmar". Duas mudanças da v27.0 passam a valer em todas as versões: expansão de dispositivo ligada por padrão em conjunto novo de Vendas, e erro ao criar lookalike com país ou localização. Data cravada que circular por aí é cálculo de terceiro.
- **23/02/2027.** Marketing API v25.0 expira.
- **20/05/2027.** Graph API v22.0 removida.
- **v28.0, sem data.** Recursos legados da Graph API (requisição multi-ID, field alias, JSONP, batch assíncrono e outros) deixam de existir. Integração própria que usa algum deles migra antes.

**Já em vigor:**

- Desde 03/08/2026: os breakdowns `impression_device`, `hourly_stats_aggregated_by_audience_time_zone` e `frequency_value` exigem opt-in. Requisição síncrona devolve vazio para quem não optou.
- Desde o início de nov/2026: `total_video_consumption_rate` parou de retornar em todas as versões, sem substituto.
- Prazos de agosto, todos cumpridos: v20.0 saiu em 24/09; Commerce Order Management, Messenger Stories e os campos de estimativa de entrega saíram de todas as versões em 27/10; a Marketing API v24.0 saiu em 10/11 (a Meta mudou a data, que era 06/10).

Onde as quebras silenciosas aparecem primeiro: página de **Out-of-Cycle Changes** da Marketing API. Checar a cada quinze dias. Setembro de 2026 não teve entrada.

Fontes: blog da v27.0 (developers.facebook.com/blog/post/2026/11/04/introducing-graph-api-v27-and-marketing-api-v27) · Marketing API changelog · Out-of-Cycle Changes 2026.

## Superfícies novas de 2026

- **WhatsApp Status.** Aceita hoje reconhecimento, engajamento, tráfego, cadastros e vendas, com destino em site, WhatsApp e apps de mensagem. Regra dura: **para usar o WhatsApp Status é obrigatório incluir o posicionamento Instagram Stories.** Formato 9:16, some em 24 horas. Fica de fora: categoria especial, partnership ads e anúncio de catálogo Advantage+. Mensagens pagas no WhatsApp passaram de US$ 2 bi de run-rate anual no Q4/25. É o posicionamento mais perto de onde o cliente brasileiro já conversa, o que pesa para serviço local e para qualquer venda que fecha no WhatsApp. Fonte: Business Help Center 723817683917948.
- **Threads.** Rollout global em 21/01/2026. Formatos via API: imagem e vídeo 4:5, vídeo de 1.91:1 a 9:16, carrossel estático 1:1. Inventário novo costuma ter CPM abaixo da média por um período.
- **Meta Business Agent.** Lançado em 03/06/2026. Agente de IA que responde, recomenda produto do catálogo, agenda e qualifica lead no WhatsApp e Messenger. Mais de 1 milhão de negócios usando.
- **Vídeo na busca do Instagram (06/10/2026).** O posicionamento `ig_search` passou a aceitar vídeo único e carrossel de vídeo, em liberação gradual.
- **Formulário de cadastro com verificação de telefone por código (v27.0).** Campo `phone_otp_verification_type`: `NOT_ENABLED`, `OTP_REQUIRED` ou `OTP_OPTIONAL`. Para quem perde tempo comercial com telefone errado, é o filtro mais barato que existe. Ver `sinal-capi.md`.

**Regra para superfície nova:** teste com 5% a 10% da verba, com hipótese escrita, verba teto e data de leitura definidas antes de subir. Nunca por realocação de campanha que está performando. Sem isso vira gasto de curiosidade.

## Changelog

- **v1.1 (22/11/2026):** v27.0 e calendário novo; atualizações de GEM e Andromeda (out/2026); rollout de atribuição ainda em curso; custom attribution e restrições da incremental; mudanças em volta do Advantage+ (setup em todos os objetivos, campaign score, expansão de dispositivo, lookalike, product showcase, creative audience pairing); WhatsApp Status em funil completo; vídeo na busca do Instagram; verificação de telefone no formulário. Corrigido o ponteiro da Motion para `criativo-copy.md`.
- **v1.0 (18/08/2026):** versão inicial.
