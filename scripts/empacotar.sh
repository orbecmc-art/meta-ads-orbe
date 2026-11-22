#!/usr/bin/env bash
# Gera os dois zips da versão atual em dist/:
#   meta-ads-orbe-vX.Y.Z.zip        plugin completo (inclui a operação, distribuição restrita)
#   meta-ads-inteligencia-vX.Y.zip  só a inteligência, para circulação livre
set -euo pipefail
cd "$(dirname "$0")/.."
V=$(python3 -c "import json;print(json.load(open('.claude-plugin/plugin.json'))['version'])")
VM=${V%.*}
rm -rf dist && mkdir -p dist/stage/meta-ads-orbe
tar --exclude=./.git --exclude=./dist --exclude=./scripts --exclude=./.gitignore -cf - . | tar -xf - -C dist/stage/meta-ads-orbe
rm -f dist/stage/meta-ads-orbe/.claude-plugin/marketplace.json
(cd dist/stage && zip -rq "../meta-ads-orbe-v$V.zip" meta-ads-orbe -x '*.DS_Store')
(cd dist/stage/meta-ads-orbe/skills && zip -rq "../../../meta-ads-inteligencia-v$VM.zip" meta-ads-inteligencia -x '*.DS_Store')
rm -rf dist/stage
ls -1 dist
