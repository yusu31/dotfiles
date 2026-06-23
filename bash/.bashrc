export PATH="/c/Ruby33-x64/bin:/c/Ruby33-x64/msys64/ucrt64/bin:$PATH"

# ── Oh My Posh（Git Bash用ターミナルテーマ）──────────────────
if command -v oh-my-posh &> /dev/null; then
    eval "$(oh-my-posh init bash --config "$HOME/dotfiles/oh-my-posh/yusu.omp.json")"
fi

# ── Git ショートカット ────────────────────────────────────────
alias gs='git status'
alias ga='git add'
alias gp='git push'
alias gpl='git pull'
alias gl='git log --oneline --graph --decorate'
alias gco='git checkout'
alias gbr='git branch -v'
alias gst='git stash'

# ── よく使うフォルダへの移動 ──────────────────────────────────
alias dev='cd /c/Users/3fort/RaiseTech'
alias dots='cd /c/Users/3fort/dotfiles'
alias brain='cd "/c/Users/3fort/Documents/SecondBrain"'

# ── 起動メッセージ ────────────────────────────────────────────
echo ""
echo "  yusu's dev shell  $(date '+%Y-%m-%d %H:%M')"
echo ""
