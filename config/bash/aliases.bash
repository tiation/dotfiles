# Run dotfiles bin
alias dotfiles="bash ~/.dotfiles/bin/dotfiles/main.sh"
alias colors="bash ~/.dotfiles/bin/colors/colors.sh"

# History
alias h="history -15"    # last 10 history commands
alias hc="history -c"    # clear history
alias hg="history | rg " # +command

# IP addresses
alias pubip="dig +short txt ch whoami.cloudflare @1.0.0.1"
alias locip="sudo ifconfig | grep -Eo 'inet (addr:)?([0-9]*\\.){3}[0-9]*' | grep -Eo '([0-9]*\\.){3}[0-9]*' | grep -v '127.0.0.1'"

# Update LunarVim
alias lvupdate="lvim +LvimUpdate +q"

# Command replacements
alias j="z"

alias ls='exa'
alias la="exa -a"
alias ll="exa -l --icons"
alias lla="exa --group-directories-first -laFh --grid --icons"
alias llg="exa --group-directories-first -laFh --grid --git --icons"

alias mamba='micromamba'

alias cat=bat
alias grep='grep  --color=auto --exclude-dir={.git}'

alias man=batman

alias lg=lazygit

alias ps="procs"
alias du="dust"

alias preview="fzf --preview 'bat --color \"always\" {}'"

alias ping='c_prettyping'

alias adl="aria2c"
alias ydl="youtube-dl"