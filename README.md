# Meta Ads Orbe · Plugin (v2.1.0)

Três skills que trabalham juntas:

| Skill | O que faz | Distribuição |
|---|---|---|
| `meta-ads-inteligencia` | Analisa, diagnostica e planeja. Só leitura. | Livre (equipe, clientes, externos) |
| `meta-ads-operacao` | Executa em conta real via MCP: cria, edita, ativa, pausa. | Restrita. Editar o bloco CONFIGURAÇÃO antes de instalar |
| `meta-ads-atualizar` | Mantém o conhecimento vivo: busca fontes primárias e propõe diffs. | Junto com a inteligência |

## Instalação

**Claude Code (plugin completo):** copiar a pasta `meta-ads-orbe/` para o marketplace/diretório de plugins, ou cada pasta de `skills/` para `~/.claude/skills/`.

**Claude Desktop:** Customize > Skills > Upload, uma pasta de skill por vez.

**Claude.ai (projeto):** subir as pastas de skill no conhecimento do projeto. Para distribuir só a análise, subir apenas `meta-ads-inteligencia/`.

## Regras de distribuição

- O zip `meta-ads-inteligencia-v2.zip` é a versão de circulação livre: não contém a skill de operação.
- Antes de dar a skill de operação a alguém, revisar o bloco CONFIGURAÇÃO no topo do SKILL.md dela (tetos de orçamento, contas somente leitura).
- Conhecimento fica em `meta-ads-inteligencia/references/`; a operação referencia esses arquivos e não os duplica. Atualizou uma vez, valeu para as duas.

## Manutenção

Pedir "atualiza a skill de Meta Ads" aciona a rotina da `meta-ads-atualizar`. Cadência sugerida: quinzenal (changelog da API, 5 min), mensal (rodada completa), trimestral (benchmarks no release da Meta).

Verificado em 18/08/2026. Documento vivo.

## Changelog

- **2.1.0 (03/11/2026):** `meta-ads-operacao` ganha o ciclo de acompanhamento 3+7. Toda otimização agenda checagem em 3 dias e leitura em 7 dias; se a checagem de 3 dias otimizar de novo, a de 7 dias é cancelada e o ciclo recomeça.

- **2.1.0 (21/11/2026):** sincronizacao com o OpenBot via GitHub verificada (teste de atualizacao automatica).
