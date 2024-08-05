# this prevents tmux from moaning,
# has to e on the top of the file
export TERM="xterm-256color"

alias vim="nvim"

export PATH="/usr/local/mysql/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="${HOME}/bin:$PATH"

export BUNDLER_EDITOR=/usr/local/bin/code

alias swt="osascript -e 'tell app \"System Events\" to tell appearance preferences to set dark mode to not dark mode'"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# rbenv init
eval "$(rbenv init - zsh)"

# scmpuff init
eval "$(scmpuff init -s)"

# Homebrew on Apple Silicon
path=('/opt/homebrew/bin' $path)
export PATH

# Rails aliases
alias -g RET='RAILS_ENV=test'
alias rc='rails console'
alias rdm='rails db:migrate'
alias rdmd='rails db:migrate:down'
alias rdmr='rails db:migrate:redo'
alias rdms='rails db:migrate:status'
alias ru='rails runner'
alias hv="hivemind"

# git aliases
alias g='git'
alias ga='git add'
alias gaa='git add --all'
alias gam='git am'
alias gama='git am --abort'
alias gamc='git am --continue'
alias gamscp='git am --show-current-patch'
alias gams='git am --skip'
alias gap='git apply'
alias gapt='git apply --3way'
alias gbs='git bisect'
alias gb='git branch'
alias gba='git branch --all'
alias gbd='git branch --delete'
alias gbD='git branch --delete --force'


# Volta init
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

export GPG_TTY=$(tty)

export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

# zsh autosuggestions
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

eval "$(starship init zsh)"

