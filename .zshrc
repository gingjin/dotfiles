#!/bin/sh

# enabling portage completions and gentoo prompt for zsh
autoload -Uz compinit promptinit
compinit
promptinit; prompt gentoo

# case-insensitive
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*'

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
alias yc='cd ~/.local/share/yadm/'

alias g="git"
alias ga="git add"
alias gaa="git add --all"
alias gapa="git add --patch"
alias gau="git add --update"
alias gav="git add --verbose"
alias gam="git am"
alias gama="git am --abort"
alias gamc="git am --continue"
alias gamscp="git am --show-current-patch"
alias gams="git am --skip"
alias gap="git apply"
alias gapt="git apply --3way"
alias gbs="git bisect"
alias gbsb="git bisect bad"
alias gbsg="git bisect good"
alias gbsn="git bisect new"
alias gbso="git bisect old"
alias gbsr="git bisect reset"
alias gbss="git bisect start"
alias gbl="git blame -w"
alias gb="git branch"
alias gba="git branch --all"
alias gbd="git branch --delete"
alias gbD="git branch --delete --force"
alias gbm="git branch --move"
alias gbnm="git branch --no-merged"
alias gbr="git branch --remote"
alias gbg="LANG=C git branch -vv | grep ': gone\]'"
alias gco="git checkout"
alias gcor="git checkout --recurse-submodules"
alias gcb="git checkout -b"
alias gcB="git checkout -B"
alias gcd='git checkout $(git_develop_branch)'
alias gcm='git checkout $(git_main_branch)'
alias gcp="git cherry-pick"
alias gcpa="git cherry-pick --abort"
alias gcpc="git cherry-pick --continue"
alias gclean="git clean --interactive -d"
alias gcl="git clone --recurse-submodules"
alias gcam="git commit --all --message"
alias gcas="git commit --all --signoff"
alias gcasm="git commit --all --signoff --message"
alias gcmsg="git commit --message"
alias gcsm="git commit --signoff --message"
alias gc="git commit --verbose"
alias gca="git commit --verbose --all"
alias gca!="git commit --verbose --all --amend"
alias gcan!="git commit --verbose --all --no-edit --amend"
alias gc!="git commit --verbose --amend"
alias gcn!="git commit --verbose --no-edit --amend"
alias gcs="git commit -S"
alias gcss="git commit -S -s"
alias gcssm="git commit -S -s -m"
alias gcf="git config --list"
alias gd="git diff"
alias gdca="git diff --cached"
alias gdcw="git diff --cached --word-diff"
alias gds="git diff --staged"
alias gdw="git diff --word-diff"
alias gdv='git diff -w "$@" | view -'
alias gdup="git diff @{upstream}"
alias gdt="git diff-tree --no-commit-id --name-only -r"
alias gf="git fetch"
alias gfa="git fetch --all --prune"
alias gfo="git fetch origin"
alias gg="git gui citool"
alias gga="git gui citool --amend"
alias ghh="git help"
alias glgg="git log --graph"
alias glgga="git log --graph --decorate --all"
alias glgm="git log --graph --max-count=10"
alias glo="git log --oneline --decorate"
alias glog="git log --oneline --decorate --graph"
alias gloga="git log --oneline --decorate --graph --all"
alias glp="git log --pretty=<format>"
alias glg="git log --stat"
alias glgp="git log --stat --patch"
alias gfg="git ls-files | grep"
alias gm="git merge"
alias gma="git merge --abort"
alias gms="git merge --squash"
alias gmom='git merge origin/$(git_main_branch)'
alias gmum='git merge upstream/$(git_main_branch)'
alias gmtl="git mergetool --no-prompt"
alias gl="git pull"
alias gpr="git pull --rebase"
alias gprv="git pull --rebase -v"
alias gpra="git pull --rebase --autostash"
alias gp="git push"
alias gpd="git push --dry-run"
alias gpf!="git push --force"
alias ggf='git push --force origin $(current_branch)'
alias gpv="git push --verbose"
alias ggp='git push origin $(current_branch)'
alias gpu="git push upstream"
alias grb="git rebase"
alias grba="git rebase --abort"
alias grbc="git rebase --continue"
alias grbi="git rebase --interactive"
alias grbo="git rebase --onto"
alias grbs="git rebase --skip"
alias grbd='git rebase $(git_develop_branch)'
alias grbm='git rebase $(git_main_branch)'
alias grbom='git rebase origin/$(git_main_branch)'
alias grf="git reflog"
alias gr="git remote"
alias grv="git remote --verbose"
alias gra="git remote add"
alias grrm="git remote remove"
alias grmv="git remote rename"
alias grset="git remote set-url"
alias grup="git remote update"
alias grh="git reset"
alias gru="git reset --"
alias grhh="git reset --hard"
alias grhk="git reset --keep"
alias grhs="git reset --soft"
alias grs="git restore"
alias grss="git restore --source"
alias grst="git restore --staged"
alias grev="git revert"
alias grm="git rm"
alias grmc="git rm --cached"
alias gcount="git shortlog --summary -n"
alias gsh="git show"
alias gsps="git show --pretty=short --show-signature"
alias gstall="git stash --all"
alias gstu="git stash --include-untracked"
alias gstaa="git stash apply"
alias gstc="git stash clear"
alias gstd="git stash drop"
alias gstl="git stash list"
alias gstp="git stash pop"
alias gsts="git stash show --patch"
alias gst="git status"
alias gss="git status --short"
alias gsb="git status --short -b"
alias gsi="git submodule init"
alias gsu="git submodule update"
alias gsd="git svn dcommit"
alias gsr="git svn rebase"
alias gsw="git switch"
alias gswc="git switch -c"
alias gswd='git switch $(git_develop_branch)'
alias gswm='git switch $(git_main_branch)'
alias gta="git tag --annotate"
alias gts="git tag -s"
alias gtv="git tag | sort -V"
alias gignore="git update-index --assume-unchanged"
alias gunignore="git update-index --no-assume-unchanged"
alias gwch="git whatchanged -p --abbrev-commit --pretty=medium"
alias gwt="git worktree"
alias gwtls="git worktree list"
alias gwtmv="git worktree move"
alias gwtrm="git worktree remove"

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
