if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -Ux EDITOR nvim

fish_add_path ~/.local/bin
starship init fish | source
zoxide init fish | source
