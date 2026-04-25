# History
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt SHARE_HISTORY HIST_IGNORE_DUPS HIST_IGNORE_SPACE

# Prefix-based history search with Up/Down arrows
autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search
bindkey "^[[B" down-line-or-beginning-search

# Completion
autoload -Uz compinit && compinit

# PATH
export PATH="/opt/homebrew/opt/node@24/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.config/emacs/bin:$PATH"

# Tools
eval "$(starship init zsh)"
eval "$(zoxide init zsh --cmd cd)"
source <(fzf --zsh)

# ============================================================
# ALIASES
# ============================================================

# Base
alias ls="eza --icons=auto"
alias ll="eza -la --icons=auto --git"
alias cat="bat --paging=never"
alias find="fd"

# k8s 
alias k='kubectl'
alias kgp='kubectl get pods'
alias kgpa='kubectl get pods -A'
alias kgs='kubectl get svc'
alias kgd='kubectl get deploy'
alias kgn='kubectl get nodes'
alias kge='kubectl get events --sort-by=.lastTimestamp'
alias kl='kubectl logs -f'
alias ke='kubectl exec -it'
alias kaf='kubectl apply -f'
alias kdf='kubectl delete -f'
alias krr='kubectl rollout restart deploy'

# Docker
alias d='docker'
alias dps='docker ps'
alias dpsa='docker ps -a'
alias dimg='docker images'
alias dprune='docker system prune -af'

# Ansible
alias ap='ansible-playbook'
alias apc='ansible-playbook --check'
alias apv='ansible-playbook -vvv'

# ============================================================
# FUNCTIONS
# ============================================================

# Логи пода по части имени
klf() { kubectl logs -f $(kubectl get pods | grep "$1" | head -1 | awk '{print $1}') }

# exec в под по части имени
kex() { kubectl exec -it $(kubectl get pods | grep "$1" | head -1 | awk '{print $1}') -- ${2:-sh} }
