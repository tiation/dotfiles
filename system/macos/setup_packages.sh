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
print_section "Installing Packages"

#==================================
# Install Brew
#==================================
print_title "Installing Brew"
if ! cmd_exists "brew"; then
	printf "\n" | /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
	#  └─ simulate the ENTER keypress
fi
print_result $? "Homebrew"

brew_update
brew_upgrade

#==================================
# Brew Tap
#==================================
print_title "Tapping Brew Packages"
brew_tap 'homebrew/core'
brew_tap 'homebrew/bundle'
brew_tap 'homebrew/cask' || true
brew_tap 'homebrew/cask-versions'
brew_tap 'homebrew/cask-fonts'
brew_tap 'eth-p/software'

#==================================
# Brew Install
#==================================
print_title "Installing Brew Packages"
brew_install "git" "git"
brew_install "git" "git-lfs"
brew_install "git" "git-delta"
brew_install "forgit" "forgit"
brew_install "lazygit" "lazygit"
brew_install "gum" "gum"
brew_install "tree" "tree"
brew_install "git" "git-quick-stats"
brew_install "prettyping" "prettyping"
brew_install "micromamba" "micromamba"
brew_install "zellij" "zellij"
brew_install "go" "go"
brew_install "jq" "jq"
brew_install "fzf" "fzf"
brew_install "bat" "bat"
brew_install "bat-extras" "eth-p/software/bat-extras"
brew_install "exa" "exa"
brew_install "fd" "fd"
brew_install "rg" "ripgrep"
brew_install "procs" "procs"
brew_install "Neovim" "neovim"
brew_install "Mac App Store command-line interface" "mas"
brew_install "Dockutil" "dockutil"

#==================================
# Brew Cask
#==================================
brew_install "Visual Studio Code" "visual-studio-code" "--cask"
brew_install "Microsoft Edge" "microsoft-edge" "--cask"
brew_install "Wechat" "wechat" "--cask"
brew_install "Rambox" "rambox" "--cask"
brew_install "Spotify" "spotify" "--cask"
brew_install "Zoc" "zoc" "--cask"
brew_install "Transmit" "transmit" "--cask"
brew_install "iterm2" "iterm2" "--cask"
brew_install "Papers" "papers" "--cask"
brew_install "Notion" "notion" "--cask"
brew_install "Betterzip" "betterzip" "--cask"
brew_install "Bitwarden" "bitwarden" "--cask"
brew_install "Google Drive" "google-drive" "--cask"
brew_install "BetterTouchTool" "bettertouchtool" "--cask"
brew_install "Alfred" "alfred" "--cask"
brew_install "Boom 3d" "boom-3d" "--cask"
brew_install "Cleanshot" "cleanshot" "--cask"
brew_install "Bartender" "bartender" "--cask"
brew_install "Keyboard Maestro" "keyboard-maestro" "--cask"
brew_install "Pdf Expert" "pdf-expert" "--cask"

#==================================
# Brew MAS
#==================================
print_title "Installing Brew MAS"
brew_mas_install "Spark", "1176895641"
brew_mas_install "Reeder 5", "1529448980"
brew_mas_install "Microsoft Excel", "462058435"
brew_mas_install "Microsoft Word", "462054704"
brew_mas_install "Microsoft PowerPoint", "462062816"
brew_mas_install "Irvue", "1039633667"
brew_mas_install "PopClip", "445189367"
brew_mas_install "Amphetamine", "937984704"
brew_mas_install "Xmind", "1327661892"

#==================================
# Brew Services
#==================================
print_title "Starting Brew Services"
printf "nothing to install\n"

#==================================
# Install From Source
#==================================
print_title "Install Packages From Source"
printf "nothing to install\n"
