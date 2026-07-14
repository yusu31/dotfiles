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

## 2026年トレンドリサーチ結果（未導入・要検討）

### 🔥 優先度高（すぐ入れる価値あり）

| ツール | 概要 | インストール |
|---|---|---|
| **lazygit** | キーボードだけでgit操作できるTUI。staging・rebase・stash | `scoop install lazygit` |
| **lazydocker** | Dockerコンテナ・ログを1画面で管理するTUI | `scoop install lazydocker` |
| **UniGetUI** | winget/scoop/pip/npmを1つのGUIで管理・一括アップデート | `winget install Devolutions.UniGetUI` |
| **atuin** | シェル履歴をSQLiteで管理。時刻・ディレクトリで検索 | WSL内: `curl https://setup.atuin.sh \| sh` |
| **fzf + fzf-tab** | Tab補完をファジー検索に。cd・kill・パス補完がインタラクティブに | WSL内: `apt install fzf` |
| **Biome** | ESLint + Prettierを1バイナリで置き換え。Rust製で爆速 | プロジェクト毎: `npm i -D @biomejs/biome` |

### ⚡ パフォーマンス系

| 設定 | 概要 | 方法 |
|---|---|---|
| **Dev Drive (ReFS)** | ビルド時間最大30%短縮。Spring Boot/Mavenに効果大 | 設定→システム→ストレージ→Dev Drive作成 |
| **Ultimate Performanceプラン** | 隠しの究極パフォーマンスモードを有効化 | 管理者PS: `powercfg -duplicatescheme e9a42b02-d5df-448d-aa00-03f14749eb61` |
| **SysMain無効化** | Docker+WSL2環境での余計なディスクI/O抑制 | services.mscでSysMainを無効 |

### 🔮 面白い・将来性あり

| ツール | 概要 |
|---|---|
| **WezTerm** | Rust製ターミナル。tmuxなしでペイン分割・セッション永続化 |
| **Microsoft Intelligent Terminal** | Build 2026発表のAI統合公式ターミナル |
| **Microsoft Coreutils** | ls/cp/touchなどのLinuxコマンドをWSLなしでWindows上で使える |
| **Bun** | Node.js/npmの代替。インストール・実行が劇的に速い |

### PowerToys 知られていない便利機能（v0.100）

- **Workspaces** → プロジェクトごとにアプリ配置を保存・1クリックで展開
- **Text Extractor** → 画像・PDF上のテキストをOCRでコピー（エラー画面のコピーに最強）
- **Advanced Paste** → クリップボード履歴をMarkdown/JSON/Plain Textに変換
- **Command Palette Extension Gallery** → `Win+Ctrl+Space` でカスタム拡張を追加

---

## スタートアップアプリ 監査結果（2026-06-23）

| アプリ | 判定 | 理由 |
|---|---|---|
| Docker Desktop | ✅ 残す | 開発に必須 |
| OneDrive | ✅ 残す | $PROFILE等がOneDriveに保存されている |
| GoogleDriveFS（×3重複！） | ⚠️ 要修正 | 3回登録されている。1つにすべき |
| SecurityHealth | ✅ 残す | Windows Defender、必須 |
| RtkAudUService | ✅ 残す | Realtek音声ドライバ |
| WavesSvc | ✅ 残す | Dell音声処理 |
| BingSvc | ❌ 無効化推奨 | Bingサービス、不要 |
| MicrosoftEdgeAutoLaunch | ❌ 無効化推奨 | Edge自動起動、不要 |
| GoogleChromeAutoLaunch | ❌ 無効化推奨 | Chrome自動起動、不要 |
| MicrosoftCopilotAutoLaunch | ❌ 無効化推奨 | Copilot自動起動、不要 |
| cubepdf-checker | ❌ 無効化推奨 | CubePDF常駐、不要 |
| KaipokeWin（海ポケット） | ❌ 無効化推奨 | 不明なアプリ、不要と思われる |
| Logitech Download Assistant | ❓ 要確認 | Logitechデバイスを使っていれば残す |

**無効化方法:** タスクマネージャー → スタートアップアプリ → 右クリック → 無効化

---

## .wslconfig（WSL2メモリ制限）

`C:\Users\3fort\.wslconfig` に作成済み：
- memory=8GB（16GBのうち半分をWSL2に割当）
- swap=4GB

WSL2再起動コマンド：`wsl --shutdown`

---

## Git エイリアス

```bash
git st     # git status
git co     # git checkout
git br     # git branch -v
git lg     # きれいなツリー形式のログ
git last   # 直前のコミットの詳細
git undo   # 直前のコミットを取り消し（変更内容は残す）
```
