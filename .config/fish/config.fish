#function fish_prompt -d "Bash-like prompt"
#  printf '[%s@%s %s]$ ' $USER $hostname \
#end

#function fish_prompt
#  set_color cyan; echo (pwd) 
#  set_color green; echo '> '
#end

if status is-interactive
  # Commands to run in interactive sessions can go here
  set fish_greeting # disable greeting
  pokemon-colorscripts -r
  starship init fish | source
  zoxide init fish | source
  #zellij setup --generate-auto-start fish | string collect
end

source ~/.config/fish/tokyonight_night.fish


#set -x XDG_DATA_DIRS "$XDG_DATA_DIRS:/usr/share:/var/lib/flatpak/exports/share:$HOME/.local/share/flatpak/exports/share"
set -x EDITOR "helix"
set -x VISUAL "helix" # for ranger
set -x MANPAGER "sh -c 'col -bx | bat -l man -p'" # use BAT as MAN's pager
set -x MANROFFOPT "-c"
set -x SKIM_DEFAULT_COMMAND "fd --type f || git ls-tree -r --name-only HEAD || rg --files || find ." # skim: use fd by default
set -x https_proxy "http://127.0.0.1:7890"
set -x http_proxy "http://127.0.0.1:7890"
set -x all_proxy "socks5://127.0.0.1:7890"

alias l="exa -lh --icons"
alias ll="exa -lha --icons"
alias ls="exa --icons"
alias la="exa -a --icons"
alias tree="exa --icons --tree"

alias ..="cd .."

#thefuck --alias | source # too slow
function fuck -d "Correct your previous console command"
  set -l fucked_up_command $history[1]
  env TF_SHELL=fish TF_ALIAS=fuck PYTHONIOENCODING=utf-8 thefuck $fucked_up_command THEFUCK_ARGUMENT_PLACEHOLDER $argv | read -l unfucked_command
  if [ "$unfucked_command" != "" ]
    eval $unfucked_command
    builtin history delete --exact --case-sensitive -- $fucked_up_command
    builtin history merge
  end
end
# ^ saves ~200ms, ~229ms -> ~31ms, tested with "hyperfine -N -min-runs 100 fish -c exit"

alias yay="paru" # rust
alias ranger="joshuto"
alias grep="rg"
alias top="btm -b"
alias htop="btm -b"
alias btop="btm"

alias farsee="curl -F 'c=@-' 'https://fars.ee/'" # pastebin
alias please="sudo" # fun
alias clock="tty-clock -csC5"
alias neofetch="fastfetch"
alias neovide="env -u WAYLAND_DISPLAY neovide"

alias setproxy="export https_proxy=http://127.0.0.1:7890; export http_proxy=http://127.0.0.1:7890; export all_proxy=socks5://127.0.0.1:7891"
alias unsetproxy="set -e http_proxy https_proxy all_proxy"

# Auto start compositor at login (Hyprland)
if status is-login
    if test -z "$DISPLAY" -a "$XDG_VTNR" = 1
        exec Hyprland
    end
end
