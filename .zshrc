# Created by newuser for 5.9

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
eval "$(oh-my-posh init zsh --config $HOME/.config/ohmyposh/zen.toml)"

# Case matching 
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z} m:{A-Z}={a-z}'

# ====== Fzf ===========

source <(fzf --zsh)

# Executables in path
export PATH="$HOME/bin:$PATH"


# Git editor
EDITOR=nvim

# History file and size
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

# Smart history behavior
setopt INC_APPEND_HISTORY       # Save each command as it's typed
setopt SHARE_HISTORY            # Share history across all sessions
setopt HIST_IGNORE_ALL_DUPS     # Don't store duplicate commands
setopt HIST_REDUCE_BLANKS       # Remove extra whitespace
setopt HIST_VERIFY              # Show command before running with `!`
setopt HIST_FIND_NO_DUPS        # Skip duplicates during search
setopt HIST_IGNORE_SPACE        # Commands starting with space aren't saved

# ====== Aliases =======
alias ls='eza --icons=always'
alias gitlog="git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(auto)%d%C(reset)' --all"


loadenv() {
  export $(grep -v '^#' .env | xargs) && "$@"
}

# ====== Completion highlit ========

autoload -Uz compinit
zmodload zsh/complist
compinit

# Enable interactive menu with highlighting
zstyle ':completion:*' menu select
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# Optional: Ensure basic tab completion and reverse tab
bindkey '^I' expand-or-complete
bindkey '^[[Z' reverse-menu-complete

source $HOMEBREW_PREFIX/share/zsh-autosuggestions/zsh-autosuggestions.zsh

source $HOMEBREW_PREFIX/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

eval "$(zoxide init zsh --cmd cd)"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
