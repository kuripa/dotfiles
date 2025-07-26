if status is-interactive
    # Commands to run in interactive sessions can go here
end

# Remove fish geeting
function fish_greeting
  fastfetch
end 

if test -f /home/nfuhrman/.env 
    source /home/nfuhrman/.env
end

set -x DBUS_SESSION_BUS_ADDRESS unix:path=/run/user/(id -u)/bus
set -x DBUS_SYSTEM_BUS_ADDRESS unix:path=/var/run/dbus/system_bus_socket

#set -Ux MANPAGER "sh -c 'col -bx | bat -l man -p'"
set -Ux MANPAGER "nvim +Man!"
set -Ux MANROFFOPT "-c"
set -Ux MANOPT ""
fish_add_path -m ~/.local/bin

alias weather="wetter"
alias wetter="curl -4 wttr.in/wolfsburg"

alias ls="eza --icons"
alias ll="eza --long --header --git --icons"
alias tree="eza --tree --level=4 -a -I=.git --git-ignore --long --header --git --icons"

alias vi="nvim"
alias vim="nvim"

alias clear "printf '\033[2J\033[3J\033[1;1H'"

alias prime-run="__NV_PRIME_RENDER_OFFLOAD=1 __GLX_VENDOR_LIBRARY_NAME=nvidia"

set -gx EDITOR nvim 

zoxide init fish | source
fzf --fish | source
starship init fish | source
