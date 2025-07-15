autoload -U compinit; compinit

PS1='[%n@%m %1~]$ '

# ls colors
if [[ "$(uname)" == "Darwin" ]]; then
    export HOMEBREW_NO_ANALYTICS=1
    eval "$(/opt/homebrew/bin/brew shellenv)"
    eval $(gdircolors)
    alias ls='ls --color'
else
    eval $(dircolors)
    alias ls='ls --color=auto'
fi

zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"


# keybindings emacs
bindkey -e
export VISUAL=vim
autoload -z edit-command-line
zle -N edit-command-line
bindkey "^X^E" edit-command-line
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
setopt ignore_eof

export FZF_ALT_C_OPTS="--preview 'tree -C {}'"
source <(fzf --zsh)
export EDITOR=vim

