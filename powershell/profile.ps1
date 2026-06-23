# =============================================================
#  yusu の PowerShell プロファイル
#  対象：Windows Terminal / VS Code / Cursor の統合ターミナル
# =============================================================

# ── Oh My Posh（ターミナルのカスタムテーマ）──────────────────
$env:POSH_GIT_ENABLED = $true
oh-my-posh init pwsh --config "$env:USERPROFILE\dotfiles\oh-my-posh\yusu.omp.json" | Invoke-Expression

# ── よく使うフォルダへの移動ショートカット ──────────────────
function dev       { Set-Location C:\Users\3fort\RaiseTech }
function dotfiles  { Set-Location C:\Users\3fort\dotfiles }
function brain     { Set-Location "C:\Users\3fort\Documents\SecondBrain" }

# ── Git ショートカット関数 ────────────────────────────────────
function gs   { git status }
function ga   { git add $args }
function gc   { param([string]$msg) git commit -m $msg }
function gp   { git push }
function gpl  { git pull }
function gl   { git log --oneline --graph --decorate }
function gco  { git checkout $args }
function gbr  { git branch $args }
function gst  { git stash $args }

# ── 便利ユーティリティ ─────────────────────────────────────
# 現在のIPアドレスを表示
function myip { (Invoke-WebRequest -Uri "https://ifconfig.me").Content }

# フォルダのサイズを表示
function foldersize {
    param([string]$path = ".")
    Get-ChildItem $path -Recurse -ErrorAction SilentlyContinue |
    Measure-Object -Property Length -Sum |
    ForEach-Object { "{0:N2} MB" -f ($_.Sum / 1MB) }
}

# ── 起動メッセージ ─────────────────────────────────────────
Write-Host ""
Write-Host "  yusu's dev shell  " -ForegroundColor Blue -NoNewline
Write-Host "($(Get-Date -Format 'yyyy-MM-dd HH:mm'))" -ForegroundColor DarkGray
Write-Host ""
