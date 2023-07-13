#
# Zsh RC config
# ~/.zshrc
#

# Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


fpath=(~/.zsh/zsh-completions/src $fpath)
setopt histignorealldups sharehistory


# History
HISTSIZE=10000000
SAVEHIST=10000000
HISTFILE=~/.zsh/.zsh_history

# Completion system
autoload -Uz compinit && compinit
# autoload -U +X compinit && compinit
# autoload -U +X bashcompinit && bashcompinit


# Completion styles
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'
zstyle ':completion:*' matcher-list'' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'


# Environments
export PATH=$PATH:$HOME/.local/bin # extend path
export EDITOR="nvim"
export VISUAL="nvim" # for ranger

export https_proxy=http://127.0.0.1:7890
export http_proxy=http://127.0.0.1:7890
export all_proxy=socks5://127.0.0.1:7891


# Alias
alias ..="cd .."

alias l="exa -lh --icons"
alias ll="exa -lha --icons"
alias ls="exa --icons"
alias tree="exa --icons --tree"

alias neofetch="fastfetch"
alias clock="tty-clock -csC5"
alias neovide="env -u WAYLAND_DISPLAY neovide" # Wayland stuff

alias unsetproxy="unset https_proxy;unset http_proxy; unset all_proxy"
alias setproxy="export https_proxy=http://127.0.0.1:7890; export http_proxy=http://127.0.0.1:7890; export all_proxy=socks5://127.0.0.1:7891"

# alias browsepackages="pacman -Qq | fzf --preview 'pacman -Qil {}' --layout=reverse --bind 'enter:execute(pacman -Qil {} | less)'"
# alias removeorphan="pacman -Qtdq | sudo pacman -Rns -"
# alias removemoreorphan="pacman -Qqd | sudo pacman -Rsu -"
# alias updatemirror="sudo reflector --country China --protocol https --sort rate --save /etc/pacman.d/mirrorlist"


# Sources
# source /usr/share/nvm/init-nvm.sh

# Plugins
source ~/.zsh/sudo/sudo.plugin.zsh
source ~/.zsh/fzf-tab/fzf-tab.plugin.zsh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
# source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/zsh-history-substring-search/zsh-history-substring-search.zsh


# Prompt
source ~/.zsh/powerlevel10k/powerlevel10k.zsh-theme
source ~/.zsh/.p10k.zsh
# eval "$(starship init zsh)"


# Binds
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
