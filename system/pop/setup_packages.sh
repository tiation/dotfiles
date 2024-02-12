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
print_section "Installing Packages"

#==================================
# Add keys to apt
#==================================
print_title "Adding Keys"

# Mono
sudo mkdir -p /etc/apt/keyrings
execute "sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF" "Mono (Add Key)"

# Charm
curl -fsSL --silent https://repo.charm.sh/apt/gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/charm.gpg &>/dev/null
echo "deb [signed-by=/etc/apt/keyrings/charm.gpg] https://repo.charm.sh/apt/ * *" | sudo tee /etc/apt/sources.list.d/charm.list &>/dev/null

#==================================
# Add repositories to apt
#==================================
print_title "Adding Repositories"

apt_add_repo "Fish" "ppa:fish-shell/release-3"

#==================================
# Add sources to APT
#==================================
# print_title "Adding Sources"

#==================================
# Update APT packages
#==================================
print_title "Update & Upgrade APT"

apt_update
apt_upgrade

#==================================
# Install package managers
#==================================
print_title "Install Package Managers"

apt_install "nala" "nala"
#apt_install "flatpak" "flatpak"
#apt_install "flatpak gnome plugin" "gnome-software-plugin-flatpak"
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo >/dev/null 2>&1

#==================================
# Install APT packages
#==================================
print_title "Install APT Packages"

apt_install "Build Essential" "build-essential"
#apt_install "Gnome Shell Extensions" "gnome-shell-extensions"
#apt_install "Gnome Shell Extension Manager" "gnome-shell-extension-manager"
apt_install "Gnome Tweaks" "gnome-tweaks"

apt_install "heif-gdk-pixbuf" "heif-gdk-pixbuf"
apt_install "heif-thumbnailer" "heif-thumbnailer"

apt_install "gnupg" "gnupg"
apt_install "gpg" "gpg"
apt_install "ca-certificates" "ca-certificates"
apt_install "curl" "curl"
apt_install "wget" "wget"
apt_install "pyhton3" "python3"
apt_install "git" "git"
apt_install "git-all" "git-all"
apt_install "git-lfs" "git-lfs"
apt_install "apt-transport-https" "apt-transport-https"
apt_install "software-properties-common" "software-properties-common"
apt_install "libgconf-2-4" "libgconf-2-4"
apt_install "cargo" "cargo"

apt_install "less" "less"
apt_install "bat" "bat"
apt_install "tre-command" "tre-command"
apt_install "fd-find" "fd-find"
apt_install "fzf" "fzf"
apt_install "ripgrep" "ripgrep"

apt_install "gum" "gum"
apt_install "htop" "htop"
apt_install "httpie" "httpie"
apt_install "prettyping" "prettyping"

apt_install "tldr" "tldr"

apt_install "gcc" "gcc"
apt_install "micro" "micro"
apt_install "neovim" "neovim"
apt_install "ffmpeg" "ffmpeg"

apt_install "Notion" "notion"

#==================================
# Install Snap packages
#==================================
print_title "Install Snap Packages"
# snap_install "VS Code" "code"
printf "nothing to install\n"

#==================================
# Install Cargo packages
#==================================
print_title "Install Cargo Packages"

cargo_install "exa" "exa"
cargo_install "zellij" "zellij"
cargo_install "sd" "sd"
cargo_install "choose" "choose"

#==================================
# Install Flatpak Packages
#==================================
print_title "Install Flatpak Packages"

flatpak_install "GitKraken" "com.axosoft.GitKraken"
flatpak_install "Mailspring" "com.getmailspring.Mailspring"
flatpak_install "Zoom" "us.zoom.Zoom"
flatpak_install "Spotify" "com.spotify.Client"
flatpak_install "Microsoft Edge" "com.microsoft.Edge"

#==================================
# Install From Source
#==================================
print_title "Install Packages From Source"
mkdir -p ~/.bin
# LazyGit
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep '"tag_name":' | sed -E 's/.*"v*([^"]+)".*/\1/')
curl -Lo lazygit.tar.gz --silent --output /dev/null "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
sudo tar xf lazygit.tar.gz -C /usr/local/bin lazygit
rm -rf lazygit.tar.gz
print_success "lazygit"
# Tabby
curl -s https://packagecloud.io/install/repositories/eugeny/tabby/script.deb.sh | sudo bash
# Micromamba
yes|curl -L micro.mamba.pm/install.sh|bash

#==================================
# Install Extensions
#==================================
print_title "Install Gnome Extensions"
printf "nothing to install\n"
#extension_install "Dash To Dock (COSMIC)" "https://extensions.gnome.org/extension/5004/dash-to-dock-for-cosmic/"
