if status is-interactive
    set -Ux CARAPACE_BRIDGES 'zsh,fish,bash,inshellisense' # optional
    mkdir -p ~/.config/fish/completions
    carapace --list | awk '{print $1}' | xargs -I{} touch ~/.config/fish/completions/{}.fish # disable auto-loaded completions (#185)
    carapace _carapace | source

    ###Fish Settings###
    set fish_greeting

    ###Environment Variables###
    set -g -x PATH "$PATH:/lib"
    set -g -x PATH "$PATH:$HOME/go/bin"
    set -g -x PATH "$PATH:$HOME/.cargo/bin"
    ##########################

    #Zoxide
    zoxide init fish | source

    #Starship
    starship init fish | source

    #Ocaml
    source /home/princem/.opam/opam-init/init.fish >/dev/null 2>/dev/null; or true

    #Alias    
    alias grep rg
    alias cat bat
    alias ls "lsd --icon always"
    alias top htop
    alias vi hx
    alias git-local-clean "git branch --merged | egrep -v \"(^\\*|master|main|dev)\" | xargs git branch -d"

    ## Start nushell
    nu

end
