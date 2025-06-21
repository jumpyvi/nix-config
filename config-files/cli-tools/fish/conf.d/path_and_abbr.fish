alias docker-laser='docker rm $(docker ps -a -q)'
alias docker-ender='docker stop $(docker ps -q)'
alias cd='z'
alias ibat='chafa'

alias nix-switch 'git -C ~/.config/nix-config add . && sudo nixos-rebuild switch --flake ~/.config/nix-config/systems'
alias nix-boot 'git -C ~/.config/nix-config add . && sudo nixos-rebuild boot --flake ~/.config/nix-config/systems'
alias nix-test 'git -C ~/.config/nix-config add . && sudo nixos-rebuild test --flake ~/.config/nix-config/systems'
alias nix-update 'git -C ~/.config/nix-config add . && sudo nixos-rebuild switch --flake ~/.config/nix-config/systems --upgrade'
alias nix-gen 'nixos-rebuild list-generations'
alias nix-trash 'nix-collect-garbage --delete-older-than 3d'

alias box="distrobox-enter (distrobox-list | awk '{if (NR!=1) print \$3}' | fzf)"


export PATH="$PATH:$HOME/.local/bin"
