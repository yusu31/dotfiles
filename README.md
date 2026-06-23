# yusu's dotfiles

yusu の開発環境設定ファイル一式。  
PCが変わっても `git clone` 一発で同じ環境が再現できます。

## フォルダ構成

```
dotfiles/
├── .cursorrules              # Cursor AI へのグローバル指示
├── .gitignore_global         # 全リポジトリ共通の除外設定
├── oh-my-posh/
│   └── yusu.omp.json        # ターミナルのカスタムテーマ（Catppuccin Mocha）
├── powershell/
│   └── profile.ps1          # PowerShell プロファイル（エイリアス・Oh My Posh設定）
├── vscode/
│   └── terminal-settings-snippet.json  # VS Code / Cursor のターミナル設定スニペット
├── claude/
│   └── hooks-addition.json  # Claude Code hooks の設定例
├── templates/
│   └── .env.template        # 新プロジェクト開始時のAPIキーテンプレート
├── setup.ps1                # 自動セットアップスクリプト
└── README.md
```

## セットアップ方法

### 新しいPCで環境を再現する場合

```powershell
# 1. dotfiles をクローン
git clone https://github.com/[GitHubユーザー名]/dotfiles C:\Users\[ユーザー名]\dotfiles

# 2. セットアップスクリプトを実行（管理者権限で）
cd C:\Users\[ユーザー名]\dotfiles
.\setup.ps1
```

## 含まれているツール

| ツール | 役割 |
|---|---|
| Oh My Posh | ターミナルの見た目をカスタマイズ。Gitブランチ・時刻を常時表示 |
| PowerToys | 画面分割・カラーピッカー等の便利ツール集 |
| Flow Launcher | Alt+Space で何でも即検索・即起動 |
| .cursorrules | Cursor AI に「日本語で返答・Spring Boot使用」等を常時指示 |

## テーマについて

Oh My Posh テーマは [Catppuccin Mocha](https://catppuccin.com/) カラーパレットをベースにカスタマイズ。

表示内容：
- 現在のフォルダ（最大2階層）
- Git ブランチ名 ＋ 変更あり✗ / クリーン✓
- コマンドの実行時間（2秒以上かかった場合）
- 現在時刻

## Git エイリアス

```bash
git st     # git status
git co     # git checkout
git br     # git branch -v
git lg     # きれいなツリー形式のログ
git last   # 直前のコミットの詳細
git undo   # 直前のコミットを取り消し（変更内容は残す）
```
