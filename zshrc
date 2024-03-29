# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


ZSH=$HOME/.oh-my-zsh
POWERLEVEL9K_MODE='awesome-fontconfig'

# You can change the theme with another one:
#   https://github.com/robbyrussell/oh-my-zsh/wiki/themes
ZSH_THEME="powerlevel10k/powerlevel10k"
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
  sublime
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



# # configuation powerlevel9K shell
# POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(custom_apple_icon root_indicator dir dir_writable vcs)
# POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status time rvm battery)
# POWERLEVEL9K_PROMPT_ON_NEWLINE=true
# POWERLEVEL9K_PROMPT_ADD_NEWLINE=true


# POWERLEVEL9K_DIR_HOME_BACKGROUND=24
# POWERLEVEL9K_DIR_HOME_FOREGROUND=255
# POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND=024
# POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND=255

# POWERLEVEL9K_VCS_GIT_GITHUB_ICON='\uF408 '
# # POWERLEVEL9K_BATTERY_ICON='\uf1e6 '

# # battery
# # POWERLEVEL9K_BATTERY_LOW_BACKGROUND='none'
# POWERLEVEL9K_BATTERY_LOW_FOREGROUND='001'
# POWERLEVEL9K_BATTERY_CHARGING_FOREGROUND='076'
# POWERLEVEL9K_BATTERY_CHARGED_FOREGROUND='076'
# POWERLEVEL9K_BATTERY_DISCONNECTED_FOREGROUND='003'
# POWERLEVEL9K_BATTERY_LOW_THRESHOLD=15
# POWERLEVEL9K_BATTERY_VERBOSE=true
# POWERLEVEL9K_BATTERY_STAGES=''

# # POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR=''
# # POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR_ICON="\ue0b0"
# # POWERLEVEL9K_LEFT_SUBSEGMENT_SEPARATOR_ICON="\ue0b1"

# # Configuration icon and multiline
# POWERLEVEL9K_CUSTOM_APPLE_ICON="echo -e '\uf179' "
# POWERLEVEL9K_CUSTOM_APPLE_ICON_BACKGROUND=234
# POWERLEVEL9K_CUSTOM_APPLE_ICON_FOREGROUND=255
# POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="\u256d\u2500 "
# POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="\u2570\uf460 "
# # POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="\ue0C0  "

# # Configuration format date et heure
# POWERLEVEL9K_TIME_FORMAT="%D{\ue383 %H:%M \uf073 %d.%m.%Y}"

# #connection server distant
# POWERLEVEL9K_SSH_ICON='\uf68c'

# # definition du segment du prompt
# if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
#   POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(custom_apple_icon ssh context root_indicator dir dir_writable)
# else
#   POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(custom_apple_icon root_indicator dir dir_writable vcs)
# fi

# # configuration root indice
# POWERLEVEL9K_ROOT_ICON='\uf198 '
# POWERLEVEL9K_ROOT_INDICATOR_BACKGROUND=196
# POWERLEVEL9K_ROOT_INDICATOR_FOREGROUND=232

# #configuration status
# POWERLEVEL9K_STATUS_OK_BACKGROUND=232
# POWERLEVEL9K_STATUS_OK_FOREGROUND=46
# POWERLEVEL9K_STATUS_ERROR_BACKGROUND=232
# POWERLEVEL9K_STATUS_ERROR_FOREGROUND=196
# # POWERLEVEL9K_STATUS_VERBOSE=false

# POWERLEVEL9K_RVM_FOREGROUND=160
# POWERLEVEL9K_RUBY_ICON='\ue791'
# export PYENV_ROOT="$HOME/.pyenv"
# export PATH="$PATH:$PYENV_ROOT/shims"
# eval "$(pyenv init --path)"

