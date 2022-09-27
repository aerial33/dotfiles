# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.

# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi

export STARSHIP_CONFIG=~/Codes/aerial33/dotfiles/starship.toml

ZSH=$HOME/.oh-my-zsh
POWERLEVEL9K_MODE='awesome-fontconfig'

# You can change the theme with another one:
#   https://github.com/robbyrussell/oh-my-zsh/wiki/themes
# ZSH_THEME="powerlevel10k/powerlevel10k"
# ZSH_THEME=random
# ZSH_THEME_RANDOM_CANDIDATES=("robbyrussell" "agnoster" "miloshadzic")


# Useful plugins for Rails development with Sublime Text
plugins=(
  gitfast
  brew
  rbenv
  node
  themes
  last-working-dir
  common-aliases
  zsh-syntax-highlighting
  zsh-autosuggestions
  history-substring-search
  git
  colored-man-pages
  zsh-nvm
  alias-finder
  web-search
  pyenv
)

# Prevent Homebrew from reporting - https://github.com/Homebrew/brew/blob/master/share/doc/homebrew/Analytics.md
export HOMEBREW_NO_ANALYTICS=1

# Actually load Oh-My-Zsh
source "${ZSH}/oh-my-zsh.sh"

# Rails and Ruby uses the local `bin` folder to store binstubs.
# So instead of running `bin/rails` like the doc says, just run `rails`
export PATH="./bin:${PATH}:/usr/local/sbin"
# PATH="$HOME/.bin:/usr/local/sbin:$PATH"


# Store your own aliases in the ~/.aliases file and load the here.
[[ -f "$HOME/.aliases" ]] && source "$HOME/.aliases"

# Highlighter-independent settings
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)
ZSH_HIGHLIGHT_STYLES[cursor]='bg=blue'

ZSH_HIGHLIGHT_STYLES[commandseparator]='fg=red'
ZSH_HIGHLIGHT_STYLES[reserved-word]='fg=red'
ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=red'

ZSH_HIGHLIGHT_PATTERNS=('rm -rf *' 'fg=white,bold,bg=red')

# Encoding stuff for the terminal
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"
DEFAULT_USER=$USER


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


# export PYENV_ROOT="$HOME/.pyenv"
# export PATH="$PATH:$PYENV_ROOT/shims"
# eval "$(pyenv init --path)"

eval "$(starship init zsh)"

