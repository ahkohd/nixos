# set nvim as default editor
set -x EDITOR "nvim"

# use bat for colorizing pager for man
set -x MANPAGER "sh -c 'col -bx | bat -l man -p'"
