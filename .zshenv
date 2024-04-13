#!/bin/sh

export PATH="$HOME/.local/bin:$PATH"

# fzf
export FZF_DEFAULT_OPTS='--height 80% --layout=reverse --border --extended'

# starship
export STARSHIP_LOG='error'
export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"

# rust
export PATH="$HOME/.cargo/bin:$PATH"
export CARGO_HOME="$HOME/.config/cargo"
export CARGO_TARGET_DIR="$HOME/.cargo"

# ccache
export PATH="/usr/lib/ccache/bin${PATH:+:}${PATH}"
export CCACHE_DIR='$HOME/.cache/ccache'
export CCACHE_RECACHE="yes"

# history
export HISTFILE="$HOME/.zsh_history"
export HISTSIZE=10000
export SAVEHIST=10000
