alias docker-laser='docker rm $(docker ps -a -q)'
alias docker-ender='docker stop $(docker ps -q)'
alias cd='z'
alias ibat='chafa'

alias nix-switch 'git -C ~/.config/nix-config add . && nh os switch ~/.config/nix-config/'
alias nix-boot 'git -C ~/.config/nix-config add . && nh os boot ~/.config/nix-config/'
alias nix-test 'git -C ~/.config/nix-config add . && nh os test ~/.config/nix-config/'
alias nix-update 'git -C ~/.config/nix-config add . && nh os switch ~/.config/nix-config --upgrade'

alias nix-gen 'nh os info'
alias nix-trash 'nh clean all --keep-since 4d'

alias box="distrobox-enter (distrobox-list | awk '{if (NR!=1) print \$3}' | fzf)"


export PATH="$PATH:$HOME/.local/bin"
