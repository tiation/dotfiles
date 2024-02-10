#!/bin/bash
# shellcheck disable=SC1091

#==================================
# Source utilities
#==================================
. "$HOME/.dotfiles/scripts/utils/utils.sh"
. "$HOME/.dotfiles/scripts/utils/utils_pop.sh"

#==================================
# Print Section Title
#==================================
print_section "Running Pop!_OS Dotfiles Setup"

# setup symlinks
. "$HOME/.dotfiles/system/symlink.sh"

# setup packages
. "$HOME/.dotfiles/system/pop/setup_packages.sh"

# setup fonts
. "$HOME/.dotfiles/system/pop/setup_fonts.sh"

# setup defaults
. "$HOME/.dotfiles/system/pop/setup_defaults.sh"

# setup shell
. "$HOME/.dotfiles/system/pop/setup_shell.sh"

# setup micromambe
. "$HOME/.dotfiles/system/pop/setup_micomamba.sh"

# setup docker
. "$HOME/.dotfiles/system/pop/setup_docker.sh"