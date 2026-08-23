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
# prefix a command with a space to keep it out of history (secrets, tokens)
setopt HIST_IGNORE_SPACE
setopt EXTENDED_HISTORY
setopt HIST_FIND_NO_DUPS
# NOTE: HIST_SAVE_NO_DUPS collapses repeats, so the history file can't tell you
# what you actually run most. Drop it if you ever want honest frequency counts.

alias vim="nvim"

# `cd <repo>` from anywhere, without needing zoxide to have learned it first
cdpath=($HOME/work)

alias ll='ls -lah'
alias la='ls -A'

export PATH="/usr/local/mysql/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="$PATH:$HOME/.local/bin"
export PATH="/opt/homebrew/opt/rustup/bin:$PATH"
export PATH="$PATH:$HOME/.cargo/bin"

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

# rspec command wrapper
function _rspec_command() {
  if [ -e "bin/stubs/rspec" ]; then
    bin/stubs/rspec $@
  elif [ -e "bin/rspec" ]; then
    bin/rspec $@
  elif type bundle &> /dev/null && [[ -e "Gemfile" || -e "gems.rb" ]]; then
    bundle exec rspec $@
  else
    command rspec $@
  fi
}

alias rspec='_rspec_command'

# rubocop command wrapper
function _rubocop_command() {
  if [ -e "bin/rubocop" ]; then
    bin/rubocop $@
  elif type bundle &> /dev/null && [[ -e "Gemfile" || -e "gems.rb" ]]; then
    bundle exec rubocop $@
  else
    command rubocop $@
  fi
}

alias rubocop='_rubocop_command'

# Rails aliases
alias -g RET='RAILS_ENV=test'
alias rc='rails console'
alias rdb='rails db'
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
alias gfp='git fetch --all --prune'
alias grc='git rebase --continue'
alias grh='git reset --hard @{u}'
# the top of the history, by a wide margin
alias gcm='git commit -m'
alias gca='git commit --amend'
alias gcan='git commit --amend --no-edit'
alias gcb='git checkout -b'
alias glo='git log --oneline --decorate'
alias gds='git diff --staged'
alias gp='git push'
alias gpu='git push --set-upstream origin HEAD'
alias gpf='git push --force-with-lease'
alias gcp='git cherry-pick'
alias gcpa='git cherry-pick --abort'
alias gcpc='git cherry-pick --continue'
alias gsta='git stash'
alias gstp='git stash pop'
# `git port` — cherry-pick commits across sibling repos with unrelated history
alias gpo='git port'
# scmpuff already gives you gs/ga/gd/gl/gco with numeric file shortcuts

# zoxide aliases
alias j="z"
alias jj="zi"

alias lg='lazygit'

# git-fixup aliases
alias gf="git-fixup"
alias gfc="git-fixup -c"

# claude
alias claude="env CLAUDE_CODE_NO_FLICKER=1 claude"
alias ccusage="npx ccusage@latest"

# docker cleanup
alias dprune='docker system prune -af --volumes'

# re-dump the Brewfile into the dotfiles repo and show what changed
function brewdump() {
  local repo="$HOME/work/dotfiles"
  brew bundle dump --force --file="$repo/Brewfile" &&
    git -C "$repo" --no-pager diff --stat -- Brewfile
}

# Volta init
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

# Rancher path
export PATH="$HOME/.rd/bin:$PATH"

# claude cli
export PATH="$HOME/.local/bin:$PATH"

export GPG_TTY=$(tty)

export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

# Disable Homebrew environment hints
export HOMEBREW_NO_ENV_HINTS=1

# zsh autosuggestions
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Set up fzf key bindings and fuzzy completion (only in a real terminal)
if [[ -t 0 ]]; then
  source <(fzf --zsh)
fi

# Set up zoxide
eval "$(zoxide init zsh)"

eval "$(starship init zsh)"

export PATH="${HOME}/bin:$PATH"

# typos seen often enough in history to be worth catching
alias vi=nvim viom=nvim vinm=nvim vmi=nvim vimfg=nvim
alias ti=tig tih=tig tug=tig qtig=tig tiofg=tig
alias rspe=rspec rspce=rspec
alias rubocp=rubocop ruboco=rubocop
alias rak=rake raisl=rails
alias ssh-ad=ssh-add ssh-addd=ssh-add

# git subcommand autocomplete
zstyle ':completion:*:*:git:*' user-commands \
  fixup:'Create a fixup commit' \
  port:'Port commits from a sibling repo (fzf picker)'

# Auto-load `wt` whenever you cd into a repo that has bin/worktrees
_wt_autoload() { [[ -x bin/worktrees ]] && eval "$(bin/worktrees zsh)"; }
autoload -U add-zsh-hook
add-zsh-hook chpwd _wt_autoload
_wt_autoload

# Interactive commit picker on TAB for `git commit --fixup=` / `--squash=`.
# Must stay after the `fzf --zsh` block so fzf-completion is captured as the
# fallback widget for every other completion.
FIXUP_PICKER_COUNT=${FIXUP_PICKER_COUNT:-30}

_fixup_tab() {
  emulate -L zsh
  setopt localoptions extendedglob
  if [[ $LBUFFER != (#b)(|*[[:space:]])--(fixup|squash)(=|[[:space:]])(amend:|reword:|)([^[:space:]]#) ]]; then
    zle ${_fixup_fallback_widget:-expand-or-complete}
    return
  fi
  local pre=$match[1] flag=$match[2] sep=$match[3] mod=$match[4] query=$match[5]

  if ! command git rev-parse --git-dir >/dev/null 2>&1; then
    zle -M 'not inside a git repository'
    return 1
  fi

  local sel
  sel=$(command git log --oneline --decorate --color=always -n $FIXUP_PICKER_COUNT HEAD |
    fzf --ansi --height=60% --reverse --no-multi \
        --query="$query" --prompt="${flag} > " \
        --preview 'git show --color=always --stat --patch {1}' \
        --preview-window='right,60%,border-left' \
        --header="enter: pick  |  ctrl-r: widen to last 200 commits" \
        --bind='ctrl-r:reload(git log --oneline --decorate --color=always -n 200 HEAD)' |
    awk '{print $1}')

  zle reset-prompt
  [[ -n $sel ]] && LBUFFER="${pre}--${flag}${sep}${mod}${sel}"
}
zle -N _fixup_tab
_fixup_bound_widget=${${(z)"$(bindkey '^I')"}[2]}
# keep the original binding on re-source, so we never fall back into ourselves
[[ $_fixup_bound_widget != _fixup_tab ]] && _fixup_fallback_widget=$_fixup_bound_widget
unset _fixup_bound_widget
bindkey '^I' _fixup_tab
