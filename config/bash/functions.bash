# Fast CD into directories
function fcd() {
    cd $(tree -dfia -L 1 | fzf) || exit
}

# Makes directory and cd's into it
function mkcd() {
    mkdir -p "$@" && cd "$_" || exit
}

# Install VSCode command line command
function code() {
    VSCODE_CWD="$PWD" open -n -b "com.microsoft.VSCode" --args "$*"
}

# Custom Pretty Ping
function c_prettyping() {

    if [ $# -eq 0 ]; then
        prettyping --nolegend 1.1.1.1
    else
        prettyping --nolegend "$@"
    fi
}

function pupdate() {
    printf "\nUpdating starfish\n"
    OS=$(uname)
    case $OS in
    Linux)
        curl -sS https://starship.rs/install.sh | sh
        ;;
    Darwin)
        brew upgrade starship
        ;;
    esac

    tmux display-message "Starship Prompt Update Completed"
}

function ql()
{
    OS=$(uname)
    case $OS in
    Linux)
        printf "Not implemented yet!\n"
        ;;
    Darwin)
        qlmanage -p "$@" >/dev/null 2>/dev/null &
        ;;
    esac
}

if [ "$0" = "bash" ]
then
    export -f mkcd
    export -f code
    export -f c_prettyping
    export -f pupdate
fi