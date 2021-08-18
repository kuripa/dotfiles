# .bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '
. "$HOME/.cargo/env"

eval "$(starship init bash)"

function mkcdir
{
  command mkdir $1 && cd $1
}
alias dotfile='/usr/bin/git --git-dir=/home/nick/.dotfiles/ --work-tree=/home/nick'

alias luamake=/home/nick/repo/lua-language-server/3rd/luamake/luamake
