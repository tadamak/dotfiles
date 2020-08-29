HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt HIST_IGNORE_DUPS
bindkey -e

export PATH="${HOME}/bin:${PATH}"
export BAT_PAGER="less -RF"
export BAT_STYLE="plain"

alias ...='cd ../..'
alias -g L='| lv'
alias -g G='| grep'
alias -g T='| tail'
alias -g J='| jq'
alias l='cat'
alias la='ls -alh'
alias pd='popd'
alias hi='history'
alias g='git'
alias b='bundle exec'
alias RET='RAILS_ENV=test'

typeset -U path
path=(~/bin $path[@])

# bat
if [ "$(command -v bat)" ]; then
  unalias -m 'cat'
  alias cat='bat -pp --theme="Nord"'
fi

# direnv
if [ "$(command -v direnv)" ]; then
  eval "$(direnv hook zsh)"
fi

# fzf
if [ "$(command -v fzf)" ]; then
  [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
  export FZF_DEFAULT_OPTS='--height 40% --layout=reverse'
  export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'
  export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
  export FZF_CTRL_T_OPTS='--preview "bat  --color=always --line-range :100 {}"'
fi

# gitui
if [ "$(command -v gitui)" ]; then
  alias gu='gitui'
fi
# $HOME/Library/Application Support/gitui/theme.ron (mac)
# $HOME/.config/gitui/theme.ron (linux)
# (
#     selected_tab: Yellow,
#     command_fg: White,
#     selection_bg: Rgb(0,114,152),
#     cmdbar_extra_lines_bg: Rgb(0,114,152),
#     disabled_fg: DarkGray,
#     diff_line_add: Green,
#     diff_line_delete: Red,
#     diff_file_added: LightGreen,
#     diff_file_removed: LightRed,
#     diff_file_moved: LightMagenta,
#     diff_file_modified: Yellow,
#     commit_hash: Magenta,
#     commit_time: LightCyan,
#     commit_author: Green,
#     danger_fg: Red,
# )

# starship
if [ "$(command -v starship)" ]; then
  export STARSHIP_CONFIG=~/.starship.toml
  eval "$(starship init zsh)"
fi

# exa
if [ "$(command -v exa)" ]; then
  unalias -m 'll'
  unalias -m 'l'
  unalias -m 'la'
  unalias -m 'ls'
  alias ls='exa -G  --color auto --icons -a -s type'
  alias ll='exa -l --color always --icons -a -s type'
  alias la='ll'
fi

# zoxide
if [ "$(command -v zoxide)" ]; then
  export _ZO_FZF_OPTS=${FZF_DEFAULT_OPTS}
  eval "$(zoxide init zsh)"
fi
