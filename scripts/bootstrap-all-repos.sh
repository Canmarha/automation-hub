#!/usr/bin/env bash
set -euo pipefail

OWNER="Canmarha"

repos=(
  "Canmarha.github.io"
  "starter-workflows"
  "vscode"
  "pinokio-brain"
  "call-center-ai"
  "openmoxie"
  "Kawaii-CLI"
  "GitHub-Web-IDE"
  "pinokio"
  "opencode-auto"
  "github-mcp-server"
)

for repo in "${repos[@]}"; do
  echo "Processing $repo"

  if ! gh repo view "$OWNER/$repo" >/dev/null 2>&1; then
    echo "Repo not found: $OWNER/$repo"
    continue
  fi

  gh repo clone "$OWNER/$repo" -- --depth 1 >/dev/null 2>&1 || true
  cd "$repo" || continue

  mkdir -p .github/workflows

  case "$repo" in
    "Canmarha.github.io")
      cp ../templates/ci-pages.yml .github/workflows/ci.yml
      ;;
    "pinokio-brain"|"workspace")
      cp ../templates/ci-powershell.yml .github/workflows/ci.yml
      ;;
    "call-center-ai"|"openmoxie"|"Kawaii-CLI"|"cross-platform-python-gui")
      cp ../templates/ci-python.yml .github/workflows/ci.yml
      ;;
    *)
      cp ../templates/ci-typescript.yml .github/workflows/ci.yml
      ;;
  esac

  git add .github/workflows/ci.yml
  git diff --cached --quiet || git commit -m "chore: add GitHub Actions CI" || true
  git push || true

  cd ..
done

echo "Bootstrap complete"
