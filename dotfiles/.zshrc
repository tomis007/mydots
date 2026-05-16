# Prompt

autoload -U colors && colors
PS1='%F{red}[%F{cyan}%n%F{white}@%F{magenta}%m%F{yellow} %2~%F{red}]%F{white}$%F{reset} '

setopt extendedglob
autoload -Uz compinit
if [[ -n $HOME/.zcompdump(#qN.mh+24) ]]; then
  compinit
else
  compinit -C
fi


if [[ "$(uname)" == "Darwin" ]]; then
    export HOMEBREW_NO_ANALYTICS=1
    [[ -d /opt/homebrew/share/zsh/site-functions ]] && FPATH="/opt/homebrew/share/zsh/site-functions:${FPATH}"
    eval "$(/opt/homebrew/bin/brew shellenv)"
    eval $(gdircolors)
    alias ls='ls --color'
else
    eval $(dircolors)
    alias ls='ls --color=auto'
fi

zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# if [ -n "${SSH_YAYAUTH_SOCK}" ]; then
#     export SSH_AUTH_SOCK_MACOS=${SSH_AUTH_SOCK}
#     export SSH_AUTH_SOCK="${SSH_YAYAUTH_SOCK}"
#     unset SSH_YAYAUTH_SOCK
# fi


# keybindings emacs
bindkey -e
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


# exports
export VISUAL=vim
export EDITOR=vim
export KIND_EXPERIMENTAL_ROOTLESS=true
export KIND_EXPERIMENTAL_PROVIDER=podman
export PATH=$PATH:~/go/bin


# set options
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt noglob
setopt hist_save_no_dups
setopt hist_find_no_dups
setopt ignore_eof


# fzf
export FZF_ALT_C_OPTS="--preview 'tree -C {}'"
source <(fzf --zsh)

# kubectl
source <(kubectl completion zsh)
alias 'k=kubectl'
