HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt HIST_IGNORE_DUPS
bindkey -e

export PATH="${HOME}/bin:${PATH}"
export BAT_PAGER="ls -RF"

alias ...='cd ../..'
alias _='sudo '
alias lv='bat --color=always'
alias -g L='| lv'
alias -g G='| grep'
alias -g T='| tail'
alias -g J='| jq'
alias la='ls -alh'
alias pd='popd'
alias hi='history'
alias g='git'
alias b='bundle exec'
alias RET='RAILS_ENV=test'

typeset -U path
path=(~/bin $path[@])

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse'
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS='--preview "bat  --color=always --line-range :100 {}"'
