# Changelog

## 2026-03-22 — Modernisation workflow JS/Node + Docker + Cursor

### `zshrc`
- Supprimé tout le code Powerlevel10k commenté
- Plugins retirés : `rbenv`, `node`, `themes`, `zsh-nvm`
- `zsh-nvm` remplacé par un lazy-load manuel de nvm → démarrage shell quasi-instantané
- pyenv : consolidation des deux blocs PATH/init en un seul
- Ajouté `export EDITOR="cursor"` et `export VISUAL="cursor"`

### `aliases`
- Supprimé `alias lc='colorls'` (doublon avec eza)
- Ajouté alias éditeur : `c='cursor'`
- Ajouté aliases Docker :
  - `dc='docker compose'`
  - `dps` — liste les conteneurs avec nom/statut/ports
  - `dlog='docker logs -f'`
  - `dexec='docker exec -it'`
- Ajouté aliases Node/npm :
  - `ni='npm install'`
  - `nr='npm run'`
  - `nrd='npm run dev'`
  - `nrb='npm run build'`
  - `pn='pnpm'`
- Ajouté aliases GitHub CLI :
  - `ghpr='gh pr create'`
  - `ghprl='gh pr list'`
  - `ghprv='gh pr view --web'`

### `gitconfig`
- `editor` : `code` → `cursor`
- Alias `m` : `checkout master` → `checkout main`
- Alias `sweep` : corrigé pour ignorer `main` et `master` (plus hardcodé sur `master`)
- Ajouté `[core] autocrlf = input`
- Ajouté `[pull] rebase = true`
- Ajouté `[fetch] prune = true`
- Ajouté `[push] autoSetupRemote = true`
- Ajouté `[diff] algorithm = histogram`
- Ajouté `[merge] conflictstyle = zdiff3`
- Ajouté `[rerere] enabled = true`

### `starship.toml`
- Ajouté module `[docker_context]` — affiché uniquement si Dockerfile/docker-compose présent
- Ajouté module `[package]` — affiche la version npm du projet courant

### `install.sh`
- Remplacé `zsh-syntax-highlighting` par `fast-syntax-highlighting`
  - Ancien repo : `github.com/zsh-users/zsh-syntax-highlighting`
  - Nouveau repo : `github.com/zdharma-continuum/fast-syntax-highlighting`
