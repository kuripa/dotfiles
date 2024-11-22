if status is-interactive
    # Commands to run in interactive sessions can go here
end

if test -f /home/nfuhrman/.env 
    source /home/nfuhrman/.env
end

set -x DBUS_SESSION_BUS_ADDRESS unix:path=/run/user/(id -u)/bus
set -x DBUS_SYSTEM_BUS_ADDRESS unix:path=/var/run/dbus/system_bus_socket

set -Ux MANPAGER "sh -c 'col -bx | bat -l man -p'"
set -Ux MANROFFOPT "-c"
set -Ux MANOPT ""
fish_add_path -m ~/.local/bin

alias weather="wetter"
alias wetter="curl -4 wttr.in/wolfsburg"

alias ls="eza"
alias ll="eza --long --header --git --icons"
alias tree="eza --tree --level=4 -a -I=.git --git-ignore --long --header --git --icons"
alias vim="nvim"
alias prime-run="__NV_PRIME_RENDER_OFFLOAD=1 __GLX_VENDOR_LIBRARY_NAME=nvidia"

set -gx EDITOR nvim 

zoxide init fish | source
fzf --fish | source
