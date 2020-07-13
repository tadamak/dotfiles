HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt HIST_IGNORE_DUPS

export PATH="${HOME}/bin:${PATH}"

alias ...='cd ../..'
alias _='sudo '
alias lv='bat --color=always --style=changes'
alias -g L='| lv'
alias -g G='| grep'
alias -g T='| tail'
alias -g J='| jq'
alias la='ls -alh'
alias pd='popd'
alias hi='history'
alias g='git'
