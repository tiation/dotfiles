#!/bin/bash
# shellcheck disable=SC1091

#==================================
# Source utilities
#==================================
. "$HOME/.dotfiles/scripts/utils/utils.sh"
. "$HOME/.dotfiles/scripts/utils/utils_macos.sh"

#==================================
# Print Section Title
#==================================
print_section "Installing Fish Shell"

#==================================
# Install Fish
#==================================
print_title "Installing Fish Setup"
brew_install "Fish" "fish"
brew_install "Fisher" "fisher"

#==================================
# Install fish packages
#==================================
print_title "Installing Fish Packages"
fisher_install "Fisher" "jorgebucaran/fisher"
fisher_install "FZF" "PatrickF1/fzf.fish"
fisher_install "async-prompt" "acomagu/fish-async-prompt"
fisher_install "Forgit" "wfxr/forgit"
fisher_install "Autojump" "jethrokuan/z"
fisher_install "Autopair" "jorgebucaran/autopair.fish"
fisher_install "Puffer Fish" "nickeb96/puffer-fish"
fisher_install "Done" "franciscolourenco/done"
fisher_install "Abbreviation-tips" "gazorby/fish-abbreviation-tips"
fisher_install "Fish SSH Agent" "danhper/fish-ssh-agent"
fisher_install "Safe trash" "aluxian/fish-trash"

#==================================
# Install starship prompt
#==================================
print_title "Installing Starship Prompt"
brew_install "Starship" "starship"

#==================================
# Change Default Shell
#==================================
print_title "Changing Default Shell"

execute "sudo sh -c 'echo $(which fish) >> /etc/shells'" "Adding fish to shells"
execute "chsh -s $(which fish)" "Changing default shell into fish"
# execute "sudo echo /usr/local/bin/fish >> /etc/shells" "Adding fish to shells"
# execute "chsh -s /usr/local/bin/fish" "Changing default shell into fish"
execute "fish_update_completions >/dev/null 2>&1" "Updating fish completions"

#==================================
# Micromamba Shell Init
#==================================
print_title "Micromamba Shell Init"
/usr/local/bin/micromamba shell init -s bash -p ~/micromamba
/usr/local/bin/micromamba shell init -s fish -p ~/micromamba
/usr/local/bin/micromamba shell init -s zsh -p ~/micromamba
print_result $? "Init micromamba Shell for bash, fish and zsh" "true"
