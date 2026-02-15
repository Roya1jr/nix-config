# --- Environment & Path ---
typeset -U path  
if [[ "$OSTYPE" == "darwin"* ]]; then
    [[ -f /opt/homebrew/bin/brew ]] && eval "$(/opt/homebrew/bin/brew shellenv)"
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    path+=(/lib)
fi

path=(
    /run/wrappers/bin
    /etc/profiles/per-user/$USER/bin
    /run/current-system/sw/bin
    $HOME/.kx/bin
    $HOME/go/bin
    $HOME/.cargo/bin
    $path
)
export PATH
export EDITOR="hx"

# --- Interactive Settings ---
if [[ $- == *i* ]]; then

    # 1. ESSENTIAL: Initialize completions manually since Nix is set to false
    # This defines 'compdef' and stops the "command not found" error
    autoload -Uz compinit
    compinit

    # 2. Fix the Ghosting (ZLE cleanup)
    setopt prompt_subst
    setopt autocd
    zstyle ':completion:*' menu select
    # Using Zsh internal colors to avoid width-calculation errors
    zstyle ':completion:*' format '%F{yellow}-- %d --%f'

    # 3. Initialize Prompt (Starship needs to know compinit is done)
    command -v starship >/dev/null && eval "$(starship init zsh)"
    command -v zoxide >/dev/null && eval "$(zoxide init zsh)"

    # 4. Initialize Carapace (Now that compdef exists)
    command -v carapace >/dev/null && {
        export CARAPACE_BRIDGES='zsh,fish,bash,inshellisense'
        export CARAPACE_ZSH_HAS_COMPFIX=1
        source <(carapace _carapace)
    }

    # 5. History Search & Keybindings
    autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
    zle -N up-line-or-beginning-search
    zle -N down-line-or-beginning-search
    bindkey '^[[A' up-line-or-beginning-search
    bindkey '^[[B' down-line-or-beginning-search

    # 6. Prevent Autosuggestions from clashing with Carapace
    ZSH_AUTOSUGGEST_STRATEGY=(match_prev_cmd history)
    # This clears the "grey" text when you start tabbing
    ZSH_AUTOSUGGEST_CLEAR_WIDGETS+=(expand-or-complete)

    # --- Aliases ---
    alias vi="hx"
    alias grep="rg"
    alias cat="bat"
    alias ls="lsd --icon always"
    
fi