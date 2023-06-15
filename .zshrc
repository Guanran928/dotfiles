if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

fpath=(~/.zsh/zsh-completions/src $fpath)

# Set up the prompt
#autoload -Uz promptinit
#promptinit
#prompt adam1

setopt histignorealldups sharehistory

# Use emacs keybindings even if our EDITOR is set to vi
#bindkey -e

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=10000000
HISTFILE=~/.zsh/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit

#zstyle ':completion:*' auto-description 'specify: %d'
#zstyle ':completion:*' completer _expand _complete _correct _approximate
#zstyle ':completion:*' format 'Completing %d'
#zstyle ':completion:*' group-name ''
#zstyle ':completion:*' menu select=2
#eval "$(dircolors -b)"
#zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
#zstyle ':completion:*' list-colors ''
#zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
#zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
#zstyle ':completion:*' menu select=long
#zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
#zstyle ':completion:*' use-compctl false
#zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

# ======== environments ========
export PATH=$PATH:$HOME/.local/bin # extend path
# export PATH=$PATH:/var/lib/flatpak/exports/bin # flatpak
# export PATH=$PATH:$HOME/.local/share/flatpak/exports/bin # flatpak user
export PATH=$PATH:$HOME/.spicetify # spicetify
export EDITOR="nvim"
export VISUAL="nvim" # for ranger
# fzf theme
export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"

# ======== sources ========
source ~/.zsh/powerlevel10k/powerlevel10k.zsh-theme
source ~/.zsh/.p10k.zsh
source ~/.zsh/sudo/sudo.plugin.zsh
source ~/.zsh/fzf-tab/fzf-tab.plugin.zsh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
# source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/zsh-history-substring-search/zsh-history-substring-search.zsh

# ======== binds ========
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# ======== alias ========
alias ..="cd .."
alias l="exa -lh --icons"
alias ll="exa -lha --icons"
alias ls="exa --icons"
alias tree="exa --icons --tree"

alias clock="tty-clock -csC5"
alias gitui="gitui -t mocha.ron"

# alias neovide="neovide -- -u '$HOME/.local/share/lunarvim/lvim/init.lua'"
alias neovide="env -u WAYLAND_DISPLAY neovide" # Wayland stuff

alias unsetproxy="unset https_proxy;unset http_proxy; unset all_proxy"
alias setproxy="export https_proxy=http://127.0.0.1:7890; export http_proxy=http://127.0.0.1:7890; export all_proxy=socks5://127.0.0.1:7891"

alias browsepackages="pacman -Qq | fzf --preview 'pacman -Qil {}' --layout=reverse --bind 'enter:execute(pacman -Qil {} | less)'"
alias removeorphan="pacman -Qtdq | sudo pacman -Rns -"
alias removemoreorphan="pacman -Qqd | sudo pacman -Rsu -"
alias updatemirror="sudo reflector --country China --protocol https --sort rate --save /etc/pacman.d/mirrorlist"
