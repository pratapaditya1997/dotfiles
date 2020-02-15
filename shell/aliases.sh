#aliases to protect against overwriting
alias cp='cp -i'
alias mv='mv -i'

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

#git
alias ga='git add'
alias gs='git status'
alias gc='git commit'
alias gd='git diff'

#misc
alias my-ip="curl ipinfo.io/ip 2> /dev/null"
alias printpath='echo $PATH | sed "s/:/\\n/g"'