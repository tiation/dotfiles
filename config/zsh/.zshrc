
### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

### proxy ###
#export ALL_PROXY=http://127.0.0.1:7890

# Some  modules to improve misc stuff
zinit ice wait lucid atload'_zsh_autosuggest_start' nocd
zinit light zsh-users/zsh-autosuggestions

zinit ice wait blockf atpull'zinit creinstall -q .' lucid
zinit light zsh-users/zsh-completions

zinit ice wait lucid
zinit light zdharma/fast-syntax-highlighting

zinit light alexrochas/zsh-extract
zinit load zdharma/history-search-multi-word
zinit load chrissicool/zsh-256color

# Enable completion caching
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.cache/zinit
# Disable hostname completion, because it's slow
zstyle ':completion:*' hosts off

### End of Zinit's installer chunk

## History ###
HISTFILE=~/.zsh_history         # where to store zsh config
HISTSIZE=10000                  # big history
SAVEHIST=10000                  # big history
setopt append_history           # append
setopt hist_expire_dups_first
setopt hist_ignore_all_dups     # no duplicate
setopt hist_expire_dups_first   # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_space        # ignore space prefixed commands
setopt hist_verify              # show before executing history commands
setopt inc_append_history       # add commands as they are typed, don't wait until shell exit 
setopt share_history            # share hist between sessions
setopt extended_history         # record timestamp of command in HISTFILE
### hide name ###
#prompt_context() {}

### anaconda ###
# >>> mamba initialize >>>
# !! Contents within this block are managed by 'mamba init' !!
export MAMBA_EXE='/usr/local/opt/micromamba/bin/micromamba';
export MAMBA_ROOT_PREFIX='/Users/stephen/micromamba';
__mamba_setup="$("$MAMBA_EXE" shell hook --shell zsh --root-prefix "$MAMBA_ROOT_PREFIX" 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__mamba_setup"
else
    alias micromamba="$MAMBA_EXE"  # Fallback on help from mamba activate
fi
unset __mamba_setup
# <<< mamba initialize <<<
CONDA_CHANGEPS1=false

### Go ###
export GOPATH="$HOME/Applications/go/"
export PATH="$HOME/Applications/go/bin:$PATH"
export GO111MODULE=on
#export GOPROXY=https://goproxy.cn

### Rust ###
#export RUSTUP_DIST_SERVER=https://mirrors.tuna.tsinghua.edu.cn/rustup
export PATH="$HOME/.cargo/bin:$PATH"
fpath+=~/.zfunc

### nvm ###
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

### local bin ###
export PATH="$HOME/.bin:$PATH"

### rap-fzf ###
rga-fzf() {
	RG_PREFIX="rga --files-with-matches"
	local file
	file="$(
		FZF_DEFAULT_COMMAND="$RG_PREFIX '$1'" \
			fzf --sort --preview="[[ ! -z {} ]] && rga --pretty --context 5 {q} {}" \
				--phony -q "$1" \
				--bind "change:reload:$RG_PREFIX {q}" \
				--preview-window="70%:wrap"
	)" &&
	echo "opening $file" &&
	xdg-open "$file"
}
## alias ##
alias c="clear"
alias h="history -E -10"
alias resource="source ~/.zshrc"
alias j="z"

alias ls="exa --group-directories-first"
alias la="exa -a"
alias ll="exa -l"
alias lla="exa -la"

alias less="bat"
alias more="bat"

alias ps="procs"
alias du="dust"
alias ping='prettyping --nolegend'

alias adl="aria2c"
alias ydl="youtube-dl"

alias preview="fzf --preview 'bat --color \"always\" {}'"

alias grep='grep  --color=auto --exclude-dir={.git}'

alias mamba='micromamba'

alias g='git'
alias ga='git add'
alias gaa='git add --all'
alias gb='git branch'
alias gc='git commit -v'
alias gc!='git commit -v --amend'
alias gca='git commit -v -a'
alias gca!='git commit -v -a --amend'
alias gco='git checkout'
alias gd='git diff'
alias gl='git pull'
alias glg='git log --stat'
alias glog='git log --oneline --decorate --graph'
alias gm='git merge'
alias gp='git push'
alias gst='git status'

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"