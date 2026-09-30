# GitHub Automation Hub

This repository is the central automation and workflow template hub for the `Canmarha` GitHub account.

This repo is designed to work with the upstream official source:

- <https://github.com/actions/starter-workflows>

## What this repo does

- syncs with the upstream official starter workflows repo
- provides reusable workflow templates for different repo types
- makes it easy to apply a one-click CI/CD bootstrap to active repos
- keeps GitHub Actions free and separate from Copilot usage

## Included workflow templates

- `templates/ci-typescript.yml`
- `templates/ci-python.yml`
- `templates/ci-powershell.yml`
- `templates/ci-security.yml`
- `templates/ci-release.yml`
- `templates/ci-pages.yml`

## Bootstrap

Run the bootstrap workflow manually from the GitHub Actions tab or run locally:

```bash
chmod +x scripts/bootstrap-all-repos.sh
./scripts/bootstrap-all-repos.sh
