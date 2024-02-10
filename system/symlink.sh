#!/bin/bash
# shellcheck disable=SC1091

#==================================
# Source utilities
#==================================
. "$HOME/.dotfiles/scripts/utils/utils.sh"
os_name="$(get_os)"

#==================================
# Print Section Title
#==================================
print_section "Creating Symlinks"

#==================================
# Symlink
#==================================

# fish config
print_title "Fish configuration"
symlink ~/.dotfiles/config/fish/config.fish ~/.config/fish/config.fish
symlink ~/.dotfiles/config/fish/export.fish ~/.config/fish/export.fish
symlink ~/.dotfiles/config/fish/bindings.fish ~/.config/fish/bindings.fish

symlink ~/.dotfiles/config/fish/functions/fcd.fish ~/.config/fish/functions/fcd.fish
symlink ~/.dotfiles/config/fish/functions/flushdns.fish ~/.config/fish/functions/flushdns.fish
symlink ~/.dotfiles/config/fish/functions/gi.fish ~/.config/fish/functions/gi.fish
symlink ~/.dotfiles/config/fish/functions/mkcd.fish ~/.config/fish/functions/mkcd.fish
symlink ~/.dotfiles/config/fish/functions/c_prettyping.fish ~/.config/fish/functions/c_prettyping.fish
symlink ~/.dotfiles/config/fish/functions/c_mtr.fish ~/.config/fish/functions/c_mtr.fish
symlink ~/.dotfiles/config/fish/functions/ql.fish ~/.config/fish/functions/ql.fish
symlink ~/.dotfiles/config/fish/functions/sreload.fish ~/.config/fish/functions/sreload.fish
symlink ~/.dotfiles/config/fish/functions/treload.fish ~/.config/fish/functions/treload.fish
symlink ~/.dotfiles/config/fish/functions/supdate.fish ~/.config/fish/functions/supdate.fish
symlink ~/.dotfiles/config/fish/functions/pupdate.fish ~/.config/fish/functions/pupdate.fish

symlink ~/.dotfiles/config/fish/theme/excalith.fish ~/.config/fish/theme/excalith.fish
touch ~/.config/fish/local.fish

# bash config
print_title "Bash configuration"
symlink ~/.dotfiles/config/bash/.bashrc ~/.bashrc
symlink ~/.dotfiles/config/bash/functions.bash ~/.config/bash/functions.bash
touch ~/.bash.local

# zsh config
print_title "Zsh configuration"
symlink ~/.dotfiles/config/zsh/.zshrc ~/.zshrc
touch ~/.zsh.local

# starship config
print_title "Starship configuration"
symlink ~/.dotfiles/config/starship/starship.toml ~/.config/starship.toml

# git config
print_title "Git configuration"
symlink ~/.dotfiles/config/git/config ~/.config/git/config
symlink ~/.dotfiles/config/git/ignore_global ~/.config/git/.gitignore_global
touch ~/.config/git/.gitconfig.local

# tmux config
print_title "tmux configuration"
symlink ~/.dotfiles/config/tmux/tmux.conf ~/.config/tmux/tmux.conf

if [ "$os_name" == "macos" ]; then
	print_title ""
elif [ "$os_name" == "pop" ]; then
	print_title ""
fi
