Once this repo is forked, go back to [lewagon/setup](https://github.com/lewagon/setup)

## Rappel Node & pnpm

Mac Intel sous macOS 26 : Homebrew n'a plus de bottles x86_64, il compile tout (LLVM inclus, plusieurs heures). Ne pas installer node ni pnpm via brew.

### Node — via nvm

- Installé avec [nvm](https://github.com/nvm-sh/nvm), dans `~/.nvm/versions/node/`
- Version par défaut : `lts/*` (Node 24 actuellement, conforme aux `.nvmrc` des projets)
- `zshrc` : nvm.sh chargé en lazy-load, mais le `bin` de la version la plus récente est ajouté au `PATH` au démarrage → `node` dispo partout sans ralentir le shell

Mise à jour :

```sh
nvm install --lts --reinstall-packages-from=current   # nouvelle LTS + globaux
nvm alias default lts/*
nvm ls                                                # vérifier
nvm uninstall <ancienne-version>                      # nettoyer
nvm cache clear
```

Globaux liés en local (`npm link`), à relier après changement de version :

- `dev-status` : `cd ~/Codes/aerial33/aerial-forge/apprentissage/payload-cms/exercices/201-access-control/dev-status && npm link`

### pnpm — standalone

- Installé avec le script officiel : `curl -fsSL https://get.pnpm.io/install.sh | sh -`
- Binaire autonome dans `~/Library/pnpm` (`PNPM_HOME`), indépendant de la version de Node
- Respecte le champ `packageManager` des projets
- Pas de corepack, pas de `npm i -g pnpm`, pas de brew

Mise à jour :

```sh
pnpm self-update
pnpm -v
which -a pnpm   # un seul résultat attendu : ~/Library/pnpm/bin/pnpm
```

⚠️ Ne pas relancer `pnpm setup` ni le script d'install tel quel : ils remplacent le symlink `~/.zshrc` par un fichier. Le bloc `PNPM_HOME` est déjà dans `zshrc`. Si c'est arrivé :

```sh
mv ~/.zshrc ~/.zshrc.bak && ln -s ~/Codes/aerial33/dotfiles/zshrc ~/.zshrc
```

Désinstallation : `rm -rf ~/Library/pnpm` + retirer le bloc `pnpm (standalone)` de `zshrc`.
