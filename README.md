# Meta Ads Orbe · Plugin (v2.2.0)

Três skills que trabalham juntas:

| Skill | O que faz | Distribuição |
|---|---|---|
| `meta-ads-inteligencia` | Analisa, diagnostica e planeja, em qualquer setor. Só leitura. Módulos extras por nicho em `references/nichos/`. | Livre (equipe, clientes, externos) |
| `meta-ads-operacao` | Executa em conta real via MCP: cria, edita, ativa, pausa. | Restrita. Editar o bloco CONFIGURAÇÃO antes de instalar |
| `meta-ads-atualizar` | Mantém o conhecimento vivo: busca fontes primárias e propõe diffs. | Junto com a inteligência |

## Instalação

**Pelo repositório (recomendado).** Este repositório é também um marketplace (`.claude-plugin/marketplace.json`, nome `orbe`).

- Claude Code: `/plugin marketplace add orbecmc-art/meta-ads-orbe` e depois `/plugin install meta-ads-orbe@orbe`. Para atualizar: `/plugin marketplace update orbe`. Repositório privado exige que a pessoa tenha acesso de leitura e credencial do Git configurada (`gh auth login` e `gh auth setup-git`).
- Claude.ai e Cowork da organização: um Owner vai em Configurações da organização > Plugins e skills > Adicionar > Sincronizar do GitHub e escolhe este repositório. Exige repositório privado. Com sincronização automática ligada, todo push na `main` atualiza a equipe.

**Claude Code (cópia manual):** copiar a pasta do plugin para o diretório de plugins, ou cada pasta de `skills/` para `~/.claude/skills/`.

**Claude Desktop:** Customize > Skills > Upload, uma pasta de skill por vez.

**Claude.ai (projeto):** subir as pastas de skill no conhecimento do projeto. Para distribuir só a análise, subir apenas `meta-ads-inteligencia/`.

## Regras de distribuição

- O zip `meta-ads-inteligencia-vX.Y.zip` é a versão de circulação livre: não contém a skill de operação. Gerar com `scripts/empacotar.sh`.
- Antes de dar a skill de operação a alguém, revisar o bloco CONFIGURAÇÃO no topo do SKILL.md dela (tetos de orçamento, contas somente leitura).
- Conhecimento fica em `meta-ads-inteligencia/references/`; a operação referencia esses arquivos e não os duplica. Atualizou uma vez, valeu para as duas.

## Manutenção

Pedir "atualiza a skill de Meta Ads" aciona a rotina da `meta-ads-atualizar`. Cadência sugerida: quinzenal (changelog da API, 5 min), mensal (rodada completa), trimestral (benchmarks no release da Meta).

Fluxo no repositório: cada rodada aprovada vira um commit, com a versão nova em `.claude-plugin/plugin.json` e uma tag `vX.Y.Z`. Sem trocar a versão, o Claude Code não entrega a atualização. Se uma rodada trouxer erro, `git revert` desfaz só ela.

Verificado em 22/11/2026. Documento vivo.

## Changelog

- **2.2.0 (22/11/2026):** rodada de atualização. Corrige as tabelas da Motion em `criativo-copy.md` (números que não eram taxa de acerto, ganchos fora de ordem); entram o release Q3/26 da Meta, o WordStream 2026 completo, o tributo brasileiro de 2027, a Graph/Marketing API v27.0 e o calendário novo. Novo módulo extra `references/nichos/clinicas-medicas.md` (CFM e política de saúde da Meta). A operação ganha as regras de dispositivo e lookalike da v27.0. A rotina de atualização passa a exigir conferência de número lido em tabela de imagem. O repositório passa a ser marketplace (`marketplace.json`) e ganha `scripts/empacotar.sh`.
- **2.1.0 (03/11/2026):** `meta-ads-operacao` ganha o ciclo de acompanhamento 3+7. Toda otimização agenda checagem em 3 dias e leitura em 7 dias; se a checagem de 3 dias otimizar de novo, a de 7 dias é cancelada e o ciclo recomeça.

- **2.1.0 (21/11/2026):** sincronizacao com o OpenBot via GitHub verificada (teste de atualizacao automatica).
