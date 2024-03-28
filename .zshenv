# ~/.zshenv

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
HISTSIZE=10000000
export SAVEHIST=$HISTSIZE
