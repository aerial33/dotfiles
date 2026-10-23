DISABLE_AUTO_TITLE="true"
export STARSHIP_CONFIG=~/Codes/aerial33/dotfiles/starship.toml
# -------------------------
# ENV BASICS
# -------------------------
# Encoding
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
DEFAULT_USER=$USER

# Editor
export EDITOR="cursor"
export VISUAL="cursor"

# -------------------------
# PATH (ordre important)
# -------------------------
export PATH="$HOME/.local/bin:$PATH"
export PATH="./bin:$PATH"

# Rails and Ruby uses the local `bin` folder to store binstubs.
# So instead of running `bin/rails` like the doc says, just run `rails`
# export PATH="./bin:${PATH}:/usr/local/sbin"

ZSH=$HOME/.oh-my-zsh

plugins=(
  gitfast
  git
  last-working-dir
  common-aliases
  fast-syntax-highlighting
  zsh-autosuggestions
  history-substring-search
  colored-man-pages
  alias-finder
  web-search
)

# Prevent Homebrew from reporting - https://github.com/Homebrew/brew/blob/master/share/doc/homebrew/Analytics.md
export HOMEBREW_NO_ANALYTICS=1

# Actually load Oh-My-Zsh
source "${ZSH}/oh-my-zsh.sh"





# fast-syntax-highlighting — surcharges (après OMZ)
# Préfixe = thème actif (vide avec le thème intégré « default », ex. « free » après fast-theme).
() {
  local p=${FAST_THEME_NAME-}
  FAST_HIGHLIGHT_STYLES[${p}commandseparator]='fg=red'
  FAST_HIGHLIGHT_STYLES[${p}reserved-word]='fg=red'
  FAST_HIGHLIGHT_STYLES[${p}unknown-token]='fg=red'
}
# z-sy-h : style « cursor » + motif « rm -rf * » — pas d’équivalent direct dans F-Sy-H ; crochets via FAST_HIGHLIGHT[use_brackets] (défaut 1).



export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@3)"
# Load rbenv if installed (to manage your Ruby versions)
export PATH="${HOME}/.rbenv/bin:${PATH}" # Needed for Linux/WSL
type -a rbenv > /dev/null && eval "$(rbenv init -)"

# Store your own aliases in the ~/.aliases file and load the here.
[[ -f "$HOME/.aliases" ]] && source "$HOME/.aliases"

# -------------------------
# PYENV (lazy-ish propre)
# -------------------------
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init --path)"
  eval "$(pyenv init -)"
fi

# -------------------------
# NVM (lazy load clean)
# -------------------------
export NVM_DIR="$HOME/.nvm"

# node le plus récent dans le PATH dès le démarrage, sans charger nvm.sh
_nvm_node_dirs=("$NVM_DIR"/versions/node/v*(N/nOn))
(( ${#_nvm_node_dirs} )) && export PATH="${_nvm_node_dirs[1]}/bin:$PATH"
unset _nvm_node_dirs

load_nvm() {
  [ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"
}

nvm() {
  unset -f nvm node npm npx 2>/dev/null
  load_nvm
  nvm "$@"
}

node() { unset -f node; load_nvm; node "$@"; }
npm()  { unset -f npm;  load_nvm; npm "$@"; }
npx()  { unset -f npx;  load_nvm; npx "$@"; }


eval "$(starship init zsh)"

# opencode
export PATH=/Users/fouad/.opencode/bin:$PATH

autoload -Uz add-zsh-hook

_otty_short_title_precmd() {
  print -Pn "\e]0;${${PWD/#$HOME/~}/#\~\//~ /}\a"
}

add-zsh-hook precmd _otty_short_title_precmd

# -------------------------
# pnpm (standalone)
# -------------------------
export PNPM_HOME="$HOME/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME/bin:"*) ;;
  *) export PATH="$PNPM_HOME/bin:$PATH" ;;
esac
