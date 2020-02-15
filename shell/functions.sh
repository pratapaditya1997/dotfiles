#update dotfiles
dfu() {
    (
        cd ~/.dotfiles && git pull --ff-only && ./install -q
    )
}

#create a directory and cd into it
mcd() {
    mkdir "${1}" && cd "${1}"
}

#go up [n] directories
up() {
    local cdir="$(pwd)"
    if [[ "${1}" == "" ]]; then
        cdir="$(dirname "${cdir}")"
    elif ! [[ "${1}" =~ ^[0-9]+$ ]]; then
        echo "Error: argument must be a number"
    elif ! [[ "${1}" -gt "0" ]]; then
        echo "Error: argument must be positive"
    else
        for (( i = 0; i < ${1}; i++ )); do
            local ncdir="$(dirname "${cdir}")"
            if [[ "${cdir}" == "${ncdir}" ]]; then
                break
            else
                cdir="${ncdir}"
            fi
        done
    fi
    cd "${cdir}"
}

#auto complete from google
auto() {
    url='https://www.google.com/complete/search?client=hp&hl=en&xhr=t'
    curl -H 'user-agent: Mozilla/5.0' -sSG --data-urlencode "q=$*" "$url" | jq -r ".[1][][0]" | sed 's,</\?b>,,g'
}