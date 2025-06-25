# Created by newuser for 5.9
autoload -U compinit; compinit

PS1='[%n@%m %1~]$ '

# ls colors
alias ls='ls --color'
eval $(dircolors -b)
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# keybindings emacs
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

# HISTORY
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase

setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_find_no_dups

export FZF_ALT_C_OPTS="--walker-skip .git,node_modules,target --preview 'tree -C {}'"
source <(fzf --zsh)
