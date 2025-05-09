# this prevents tmux from moaning,
# has to e on the top of the file
export TERM="xterm-256color"

# Init autocomplte
autoload -Uz compinit && compinit

# enable colours for ls
alias ls='ls --color=auto'

# history setup
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
setopt HIST_SAVE_NO_DUPS
setopt INC_APPEND_HISTORY
setopt HIST_REDUCE_BLANKS

alias vim="nvim"

export PATH="/usr/local/mysql/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="${HOME}/bin:$PATH"

export BUNDLER_EDITOR=nvim
export EDITOR=nvim

alias swt="osascript -e 'tell app \"System Events\" to tell appearance preferences to set dark mode to not dark mode'"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# rbenv init
eval "$(rbenv init - zsh)"

# scmpuff init
eval "$(scmpuff init -s)"

# rails command wrapper
function _rails_command () {
  if [ -e "bin/stubs/rails" ]; then
    bin/stubs/rails $@
  elif [ -e "bin/rails" ]; then
    bin/rails $@
  elif [ -e "script/rails" ]; then
    ruby script/rails $@
  elif [ -e "script/server" ]; then
    ruby script/$@
  else
    command rails $@
  fi
}

alias rails='_rails_command'

# rake command wrapper
function _rake_command () {
  if [ -e "bin/stubs/rake" ]; then
    bin/stubs/rake $@
  elif [ -e "bin/rake" ]; then
    bin/rake $@
  elif type bundle &> /dev/null && [[ -e "Gemfile" || -e "gems.rb" ]]; then
    bundle exec rake $@
  else
    command rake $@
  fi
}

alias rake='_rake_command'

# Rails aliases
alias -g RET='RAILS_ENV=test'
alias rc='rails console'
alias rdm='rails db:migrate'
alias rdmd='rails db:migrate:down'
alias rdmr='rails db:migrate:redo'
alias rdms='rails db:migrate:status'
alias ru='rails runner'
alias hv="hivemind"
alias be="bundle exec"

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

# Rancher path
export PATH="$HOME/.rd/bin:$PATH"

export GPG_TTY=$(tty)

export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

# zsh autosuggestions
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)

# Set up zoxide
eval "$(zoxide init zsh)"

eval "$(starship init zsh)"
