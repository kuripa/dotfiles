if status is-interactive
    # Commands to run in interactive sessions can go here
end

if test -f /home/nfuhrman/.env 
    source /home/nfuhrman/.env
end

fish_add_path -m ~/.local/bin

alias ls="eza"


set -gx EDITOR nvim 
zoxide init fish | source
