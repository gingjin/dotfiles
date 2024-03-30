#!/bin/sh

# enabling portage completions and gentoo prompt for zsh
autoload -Uz compinit promptinit
compinit
promptinit; prompt gentoo

# Allow selecting with menu.
zstyle ':completion:*' menu yes select

# case-insensitive
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'

# enabling cache for the completions for zsh
zstyle ':completion::complete:*' use-cache 1

# zsh-syntax-highlighting
source $HOME/.zsh/zsh-syntax-highlighting-master/zsh-syntax-highlighting.zsh
# zsh-autosuggestions
source $HOME/.zsh/zsh-autosuggestions-master/zsh-autosuggestions.zsh

# starship
eval "$(starship init zsh)"
export STARSHIP_LOG='error'
export STARSHIP_CONFIG="$HOME/.config/starship/starship.toml"

# alias
alias ls="ls --color=auto"
alias la="ls -A"
alias ll="ls -alF"
alias md="mkdir -p"
alias emerge="sudo emerge"
alias emerge-webrsync="sudo emerge-webrsync"
alias eselect="sudo eselect"
alias eclean="sudo eclean"
alias eclean-dist="sudo eclean-dist"
alias eclean-pkg="sudo eclean-pkg"
alias equery="sudo equery"
alias epkginfo="sudo epkginfo"
alias eshowkw="sudo eshowkw"
alias euse="sudo euse"
alias revdep-rebuild="sudo revdep-rebuild"
alias genlop="sudo genlop"
alias dmidecode="sudo dmidecode"
alias yc='cd ~/.local/share/yadm/repo.git/'

alias g="git"
alias ga="git add"
alias gaa="git add --all"
alias gap="git apply"
alias gb="git branch"
alias gco="git checkout"
alias gcl="git clone"
alias gcmsg="git commit --message"
alias gd="git diff"
alias gf="git fetch"
alias ghh="git help"
alias glg="git log"
alias gm="git merge"
alias gl="git pull"
alias gp="git push"
alias grb="git rebase"
alias grm="git remote"
alias grs="git reset"
alias grst="git restore"
alias gr="git rm"
alias gsh="git show"
alias gst="git status"

# create a zkbd compatible hash;
# to add other keys to this hash, see: man 5 terminfo
typeset -g -A key

key[Home]="${terminfo[khome]}"
key[End]="${terminfo[kend]}"
key[Insert]="${terminfo[kich1]}"
key[Backspace]="${terminfo[kbs]}"
key[Delete]="${terminfo[kdch1]}"
key[Up]="${terminfo[kcuu1]}"
key[Down]="${terminfo[kcud1]}"
key[Left]="${terminfo[kcub1]}"
key[Right]="${terminfo[kcuf1]}"
key[PageUp]="${terminfo[kpp]}"
key[PageDown]="${terminfo[knp]}"
key[Shift-Tab]="${terminfo[kcbt]}"

# setup key accordingly
[[ -n "${key[Home]}"      ]] && bindkey -- "${key[Home]}"       beginning-of-line
[[ -n "${key[End]}"       ]] && bindkey -- "${key[End]}"        end-of-line
[[ -n "${key[Insert]}"    ]] && bindkey -- "${key[Insert]}"     overwrite-mode
[[ -n "${key[Backspace]}" ]] && bindkey -- "${key[Backspace]}"  backward-delete-char
[[ -n "${key[Delete]}"    ]] && bindkey -- "${key[Delete]}"     delete-char
[[ -n "${key[Up]}"        ]] && bindkey -- "${key[Up]}"         up-line-or-history
[[ -n "${key[Down]}"      ]] && bindkey -- "${key[Down]}"       down-line-or-history
[[ -n "${key[Left]}"      ]] && bindkey -- "${key[Left]}"       backward-char
[[ -n "${key[Right]}"     ]] && bindkey -- "${key[Right]}"      forward-char
[[ -n "${key[PageUp]}"    ]] && bindkey -- "${key[PageUp]}"     beginning-of-buffer-or-history
[[ -n "${key[PageDown]}"  ]] && bindkey -- "${key[PageDown]}"   end-of-buffer-or-history
[[ -n "${key[Shift-Tab]}" ]] && bindkey -- "${key[Shift-Tab]}"  reverse-menu-complete

# Finally, make sure the terminal is in application mode, when zle is
# active. Only then are the values from $terminfo valid.
if (( ${+terminfo[smkx]} && ${+terminfo[rmkx]} )); then
  autoload -Uz add-zle-hook-widget
  function zle_application_mode_start { echoti smkx }
  function zle_application_mode_stop { echoti rmkx }
  add-zle-hook-widget -Uz zle-line-init zle_application_mode_start
  add-zle-hook-widget -Uz zle-line-finish zle_application_mode_stop
fi
