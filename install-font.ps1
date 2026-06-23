# ============================================================
#  Nerd Font (CaskaydiaCove) インストールスクリプト
#  管理者権限のPowerShellで実行してください
# ============================================================

Write-Host "CaskaydiaCove Nerd Font をダウンロードします..." -ForegroundColor Cyan

$tempDir = "$env:TEMP\nerd-fonts-install"
New-Item -ItemType Directory -Path $tempDir -Force | Out-Null
$zipPath = "$tempDir\CascadiaCode.zip"

# GitHub の最新リリースからダウンロード
Invoke-WebRequest `
    -Uri "https://github.com/ryanoasis/nerd-fonts/releases/latest/download/CascadiaCode.zip" `
    -OutFile $zipPath

Write-Host "解凍中..." -ForegroundColor Cyan
Expand-Archive -Path $zipPath -DestinationPath $tempDir -Force

# Windows Shell API でフォントをインストール（最も確実な方法）
$shell = New-Object -ComObject Shell.Application
$fontsFolder = $shell.Namespace(0x14)

$ttfFiles = Get-ChildItem "$tempDir\*.ttf" | Where-Object {
    $_.Name -notlike "*Windows Compatible*"
}

Write-Host "$($ttfFiles.Count) 個のフォントファイルをインストールします..." -ForegroundColor Cyan

foreach ($font in $ttfFiles) {
    Write-Host "  インストール中: $($font.Name)" -ForegroundColor Gray
    $fontsFolder.CopyHere($font.FullName, 0x14)
}

Write-Host ""
Write-Host "フォントのインストール完了!" -ForegroundColor Green
Write-Host "次の手順:" -ForegroundColor Yellow
Write-Host "  1. Cursor / VS Code を完全に閉じて再起動する"
Write-Host "  2. ターミナルを開いて Oh My Posh のテーマが表示されるか確認"
Write-Host "  3. 文字化け（□ が出る）場合はターミナルのフォント設定を確認"
