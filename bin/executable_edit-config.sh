#!/usr/bin/env bash

chdir="-c lcd %:p:h"
#
declare -A confedit_list

confedit_list[nvim]="$HOME/.config/nvim/"
confedit_list[tmux]="$HOME/.config/tmux/tmux.conf"

if [[ $# -eq 1 ]]; then
    selected=$1
else
    selected=$(printf '%s\n' "${!confedit_list[@]}" | fzf)
fi

if [[ -z $selected ]]; then
    exit 0
fi

# What to do when/if we choose a file to edit.
if [ "$selected" ]; then
    cfg=$(printf '%s\n' "${confedit_list["${selected}"]}")
    # shellcheck disable=SC2154
    chezmoi "$cfg"
# What to do if we just escape without choosing anything.
else
    echo "Program terminated." && exit 0
fi
