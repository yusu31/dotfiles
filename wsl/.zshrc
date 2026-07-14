# ===== yusu WSL2 zsh config =====

# PATH (zsh path array - spaces-safe for Windows paths)
path=(/root/.local/bin $path)
export PATH

# Oh My Posh (Windows dotfilesの設定を共有)
eval "$(/root/.local/bin/oh-my-posh init zsh --config /mnt/c/Users/3fort/dotfiles/oh-my-posh/yusu.omp.json)"

# nvm
export NVM_DIR="/root/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# zsh plugins
source /root/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source /root/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# sdkman (末尾必須)
export SDKMAN_DIR="/root/.sdkman"
[[ -s "$SDKMAN_DIR/bin/sdkman-init.sh" ]] && source "$SDKMAN_DIR/bin/sdkman-init.sh"
