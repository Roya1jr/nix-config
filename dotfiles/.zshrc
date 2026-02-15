# --- Environment & Path ---
typeset -U path  

# Platform Detection
if [[ "$OSTYPE" == "darwin"* ]]; then
    [[ -f /opt/homebrew/bin/brew ]] && eval "$(/opt/homebrew/bin/brew shellenv)"
    path+=("$HOME/.cache/lm-studio/bin")
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

    # 1. Core Zsh Options for NixOS/WezTerm Stability
    setopt prompt_subst      # Dynamically re-calc prompt (Fixes double-tab ghosting)
    setopt autocd            # Allow 'cd' by just typing dir name
    
    # 2. UI Styling (Do this before Carapace)
    zstyle ':completion:*' menu select
    zstyle ':completion:*' format '%F{yellow}-- %d --%f'

    # 3. External Tool Init
    # We do NOT call compinit here; Carapace's script handles it or Nix handles it.
    command -v starship >/dev/null && eval "$(starship init zsh)"
    command -v zoxide >/dev/null && eval "$(zoxide init zsh)"

    command -v carapace >/dev/null && {
        export CARAPACE_BRIDGES='zsh,fish,bash,inshellisense'
        # This hidden flag tells Carapace to play nice with Nix-preloaded completions
        export CARAPACE_ZSH_HAS_COMPFIX=1
        source <(carapace _carapace)
    }

    # 4. History Search Widgets
    autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
    zle -N up-line-or-beginning-search
    zle -N down-line-or-beginning-search
    bindkey '^[[A' up-line-or-beginning-search
    bindkey '^[[B' down-line-or-beginning-search

    # 5. Nix-managed Plugin Config
    # Nix loads the plugins, we just define how they behave.
    ZSH_AUTOSUGGEST_STRATEGY=(match_prev_cmd history)
    # This prevents autosuggestions from breaking during completion selection
    ZSH_AUTOSUGGEST_CLEAR_WIDGETS+=(expand-or-complete)

    # --- Aliases ---
    alias q="rlwrap -r q"
    alias vi="hx"
    alias grep="rg"
    alias cat="bat"
    alias ls="lsd --icon always"
    alias top="htop"
    
    command -v podman >/dev/null && alias docker="podman"
    alias git-local-clean='git branch --merged | grep -Ev "(^\*|master|main|dev)" | xargs -r git branch -d'

fi