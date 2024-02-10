set fish_path $HOME/.config/fish

set fish_greeting
set fish_color_valid_path

. ~/.config/bash/aliases.bash
. $fish_path/export.fish
. $fish_path/bindings.fish
. $fish_path/local.fish

# Functions
funcsave fcd >/dev/null
funcsave mkcd >/dev/null
funcsave c_prettyping >/dev/null
funcsave ql >/dev/null
funcsave sreload >/dev/null
funcsave supdate >/dev/null
funcsave pupdate >/dev/null

# Aliases
alias ping c_prettyping

# Source starship
starship init fish | source
