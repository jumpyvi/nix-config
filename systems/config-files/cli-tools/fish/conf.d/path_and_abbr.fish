alias docker-laser='docker rm $(docker ps -a -q)'
alias docker-ender='docker stop $(docker ps -q)'
alias cd='z'
alias ibat='chafa'

function cheat
    cht.sh $argv | sed -E "s/\x1B\[[0-9;]*[mK]//g" | bat -l "bash" -
end

alias docker-ls='docker ps --format="table {{.Names}}\t{{.ID}}\t{{.Status}}\t{{.Command}}\t{{.Ports}}" | bat'



alias box='distrobox-enter $(distrobox-list | awk \'{if (NR!=1) print $3}\' | fzf)'


export PATH="$PATH:$HOME/.local/bin"
