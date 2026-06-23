# ============================================================
#  yusu's dotfiles セットアップスクリプト
#  PowerShell を管理者権限で実行してください
#  実行方法: cd C:\Users\3fort\dotfiles && .\setup.ps1
# ============================================================

Write-Host ""
Write-Host "============================================" -ForegroundColor Blue
Write-Host "  yusu's dotfiles セットアップ開始" -ForegroundColor Blue
Write-Host "============================================" -ForegroundColor Blue
Write-Host ""

# ── Step 1: winget で必要ツールをインストール ────────────────
Write-Host "[Step 1/5] 必要なツールをインストールします..." -ForegroundColor Cyan

Write-Host "  → Oh My Posh をインストール中..." -ForegroundColor Gray
winget install --id JanDeDobbeleer.OhMyPosh --source winget --accept-package-agreements --accept-source-agreements

Write-Host "  → Microsoft PowerToys をインストール中..." -ForegroundColor Gray
winget install --id Microsoft.PowerToys --source winget --accept-package-agreements --accept-source-agreements

Write-Host "  → Flow Launcher をインストール中..." -ForegroundColor Gray
winget install --id Flow-Launcher.Flow-Launcher --source winget --accept-package-agreements --accept-source-agreements

Write-Host "  → CaskaydiaCove Nerd Font をインストール中..." -ForegroundColor Gray
winget install --id DEVCOM.CascadiaCodeNerdFont --source winget --accept-package-agreements --accept-source-agreements

Write-Host "[Step 1/5] 完了!" -ForegroundColor Green
Write-Host ""

# ── Step 2: PowerShell プロファイルを設定 ──────────────────
Write-Host "[Step 2/5] PowerShell プロファイルを設定します..." -ForegroundColor Cyan

$psProfileDir = Split-Path -Parent $PROFILE
if (-not (Test-Path $psProfileDir)) {
    New-Item -ItemType Directory -Path $psProfileDir -Force | Out-Null
    Write-Host "  → プロファイルフォルダを作成: $psProfileDir" -ForegroundColor Gray
}

if (Test-Path $PROFILE) {
    Write-Host "  → 既存のプロファイルをバックアップ中..." -ForegroundColor Gray
    Copy-Item $PROFILE "$PROFILE.backup"
}

Copy-Item "$env:USERPROFILE\dotfiles\powershell\profile.ps1" $PROFILE -Force
Write-Host "  → プロファイルをコピー: $PROFILE" -ForegroundColor Gray
Write-Host "[Step 2/5] 完了!" -ForegroundColor Green
Write-Host ""

# ── Step 3: .cursorrules をグローバルに配置 ───────────────
Write-Host "[Step 3/5] Cursor のグローバルルールを設定します..." -ForegroundColor Cyan

$cursorRulesDir = "$env:USERPROFILE\.cursor\rules"
if (-not (Test-Path $cursorRulesDir)) {
    New-Item -ItemType Directory -Path $cursorRulesDir -Force | Out-Null
}
Copy-Item "$env:USERPROFILE\dotfiles\.cursorrules" "$cursorRulesDir\global.mdc" -Force
Write-Host "  → Cursor グローバルルールをコピー完了" -ForegroundColor Gray
Write-Host "[Step 3/5] 完了!" -ForegroundColor Green
Write-Host ""

# ── Step 4: .gitignore_global を設定 ─────────────────────
Write-Host "[Step 4/5] Git グローバル設定を確認します..." -ForegroundColor Cyan
Write-Host "  → .gitconfig を確認（エイリアスは手動で追加済みのはず）" -ForegroundColor Gray
git config --list --global | Select-String "alias"
Write-Host "[Step 4/5] 完了!" -ForegroundColor Green
Write-Host ""

# ── Step 5: 完了メッセージ ────────────────────────────────
Write-Host "[Step 5/5] セットアップ完了チェック" -ForegroundColor Cyan

Write-Host ""
Write-Host "============================================" -ForegroundColor Green
Write-Host "  セットアップ完了！" -ForegroundColor Green
Write-Host "============================================" -ForegroundColor Green
Write-Host ""
Write-Host "次に手動で行う作業：" -ForegroundColor Yellow
Write-Host "  1. ターミナルのフォントを 'CaskaydiaCove Nerd Font' に変更"
Write-Host "     → Windows Terminal: 設定 > プロファイル > 外観 > フォント"
Write-Host "     → VS Code / Cursor:  Ctrl+Shift+P > Open User Settings JSON"
Write-Host "        terminal.integrated.fontFamily を 'CaskaydiaCove Nerd Font' に設定"
Write-Host ""
Write-Host "  2. ターミナルを完全に閉じて再起動"
Write-Host "     → Oh My Posh のテーマが表示されるか確認"
Write-Host ""
Write-Host "  3. GitHub で dotfiles リポジトリを作成"
Write-Host "     → https://github.com/new でリポジトリ名 'dotfiles' を作成"
Write-Host "     → その後このフォルダで:"
Write-Host "        cd C:\Users\3fort\dotfiles"
Write-Host "        git init"
Write-Host "        git add ."
Write-Host "        git commit -m 'feat: 環境設定の初期セットアップ'"
Write-Host "        git remote add origin https://github.com/[あなたのGitHubユーザー名]/dotfiles.git"
Write-Host "        git push -u origin main"
Write-Host ""
Write-Host "  4. WSL2（後で）: PowerShell 管理者モードで"
Write-Host "        wsl --install"
Write-Host "     その後PCを再起動"
Write-Host ""
