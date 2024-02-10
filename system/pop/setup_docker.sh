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
print_section "Installing Docker"
apt_add_key "Docker key" "https://download.docker.com/linux/ubuntu/gpg"
apt_add_repo "Docker repo" "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
apt-cache policy docker-ce
apt_update
apt_install "docker-ce" "docker-ce"
sudo systemctl status docker
sudo usermod -aG docker "${USER}"

