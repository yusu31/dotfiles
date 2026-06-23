# ===== yusu WSL2 zsh config =====

# PATH
export PATH="/root/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/usr/lib/wsl/lib:/mnt/c/Ruby33-x64/bin:/mnt/c/Ruby33-x64/msys64/ucrt64/bin:/mnt/c/Users/3fort/bin:/mnt/c/Program Files/Git/mingw64/bin:/mnt/c/Program Files/Git/usr/local/bin:/mnt/c/Program Files/Git/usr/bin:/mnt/c/Program Files/Git/usr/bin:/mnt/c/Program Files/Git/mingw64/bin:/mnt/c/Program Files/Git/usr/bin:/mnt/c/Users/3fort/bin:/mnt/c/Program Files/Eclipse Adoptium/jdk-21.0.11.10-hotspot/bin:/mnt/c/WINDOWS/system32:/mnt/c/WINDOWS:/mnt/c/WINDOWS/System32/Wbem:/mnt/c/WINDOWS/System32/WindowsPowerShell/v1.0:/mnt/c/WINDOWS/System32/OpenSSH:/mnt/c/Program Files/dotnet:/mnt/c/Program Files/Git/cmd:/mnt/c/Program Files/nodejs:/Docker/host/bin:/mnt/c/Program Files/GitHub CLI:/mnt/c/Program Files/Amazon/AWSCLIV2:/mnt/c/Ruby33-x64/bin:/mnt/c/Users/3fort/AppData/Local/Programs/Python/Python312/Scripts:/mnt/c/Users/3fort/AppData/Local/Programs/Python/Python312:/mnt/c/Users/3fort/AppData/Local/Programs/Python/Launcher:/mnt/c/Users/3fort/AppData/Local/Microsoft/WindowsApps:/mnt/c/Users/3fort/AppData/Local/Programs/Antigravity/bin:/mnt/c/Users/3fort/AppData/Local/Programs/cursor/resources/app/bin:/mnt/c/Users/3fort/AppData/Roaming/npm:/mnt/c/Gradle/gradle-8.14.5/bin:/mnt/c/Users/3fort/AppData/Local/GitHub CLI/extensions/gh-codeql/dist/release/v2.25.4:/mnt/c/Users/3fort/AppData/Local/Microsoft/WinGet/Packages/Gyan.FFmpeg_Microsoft.Winget.Source_8wekyb3d8bbwe/ffmpeg-8.1.1-full_build/bin:/mnt/c/Users/3fort/AppData/Local/Microsoft/WinGet/Packages/jqlang.jq_Microsoft.Winget.Source_8wekyb3d8bbwe:/mnt/c/Users/3fort/AppData/Local/Microsoft/WinGet/Packages/Hashicorp.Terraform_Microsoft.Winget.Source_8wekyb3d8bbwe:/mnt/c/Users/3fort/AppData/Local/PowerToys/DSCModules:/mnt/c/Program Files/Git/usr/bin/vendor_perl:/mnt/c/Program Files/Git/usr/bin/core_perl"

# Oh My Posh (Windows dotfilesの設定を共有)
eval ""

# nvm
export NVM_DIR="/root/.nvm"
[ -s "/nvm.sh" ] && \. "/nvm.sh"
[ -s "/bash_completion" ] && \. "/bash_completion"

# zsh plugins
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# sdkman (末尾必須)
export SDKMAN_DIR="/root/.sdkman"
[[ -s "/root/.sdkman/bin/sdkman-init.sh" ]] && source "/root/.sdkman/bin/sdkman-init.sh"
