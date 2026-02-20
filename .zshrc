set -o err_return

# ---------- WezTerm ---------- 
PATH="$PATH:/Applications/WezTerm.app/Contents/MacOS"
export PATH

# --------- Nerd Font -----------
# brew install font-jetbrains-mono-nerd-font

# --------- Starship -----------
# brew install starship
export STARSHIP_CONFIG=~/.config/starship/starship.toml
eval "$(starship init zsh)"

# --------- zah-autosuggestion ----------- 
# brew install zsh-autosuggestion
# source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# --------- zsh-syntax-highting ----------- 
# brew install zsh-syntax-highlighting
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# --------- zsh-auto-complete ----------- 
# brew intall zsh-autocomplete
#source /opt/homebrew/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh

# --------- eza ----------- 
# brew install eza (better ls)
# download theme from https://github.com/eza-community/eza-themes/blob/main/themes/tokyonight.yml
# rename theme.yml
alias ls="eza --icons"
export EZA_CONFIG_DIR=~/.config/eza

# --------- fzf ----------- 
# brew install fzf
source ~/.config/fzf/config.sh

# --------- bat ----------- 
# brew install bat (better cat)

# --------- fd ----------- 
# brew install fd (better find)

# --------- delta-git -----------
# brew install git-delta
# https://github.com/dandavison/delta
# git config --global include.path ~/.config/git-delta/.gitconfig.delta

# --------- ripgrep -----------
# brew install ripgrep

# --------- tldr -----------
# tlrc is rust client for tldr
# brew install tlrc

# --------- tmux ----------- 
# brew install tmux
alias tmux="tmux -f ~/.config/tmux/tmux.conf"


# --------- install lua5.1 ----------- 
# This is required by neovim for lazy/luarocks
# wget https://www.lua.org/ftp/lua-5.1.5.tar.gz
# tar xzf lua-5.1.5.tar.gz
# cd lua-5.1.5
# make macosx
# mkdir ~/opt
# make INSTALL_TOP=$HOME/opt/lua@5.1 install
# mkdir -p ~/.local/bin
# ln -s ~/opt/lua@5.1/bin/lua ~/.local/bin/lua5.1
export PATH=~/.local/bin/:$PATH

# STM32 Programmer
export STM32_PRG_PATH=/Applications/STMicroelectronics/STM32Cube/STM32CubeProgrammer/STM32CubeProgrammer.app/Contents/MacOs/bin%

# ===== Smart Proxy Bootstrap with Daemon Detection =====
PROXY_HOST="127.0.0.1"
PROXY_PORT="26812"
PROXY_HTTP="http://${PROXY_HOST}:${PROXY_PORT}"
PROXY_SOCKS="socks5://${PROXY_HOST}:${PROXY_PORT}"
TEST_URL="https://www.youtube.com"
TIMEOUT=3

proxy_daemon_running() {
  pgrep -f "clash|mihomo|v2ray|xray" > /dev/null
}

proxy_health_check() {
  curl --proxy "$PROXY_HTTP" \
       --max-time $TIMEOUT \
       --silent \
       --output /dev/null \
       "$TEST_URL"
}

set_proxy() {
  export http_proxy="$PROXY_HTTP"
  export https_proxy="$PROXY_HTTP"
  export all_proxy="$PROXY_SOCKS"
}

unset_proxy() {
  unset http_proxy https_proxy all_proxy
}

if proxy_daemon_running; then
  if [[ -z "$http_proxy" && -z "$https_proxy" ]]; then
    set_proxy
    if proxy_health_check; then
      echo "✔ Proxy enabled (daemon running)"
    else
      unset_proxy
      echo "✘ Proxy daemon detected but health check failed"
    fi
  fi
else
  unset_proxy
  echo "No Clash/V2Ray daemon running — proxy disabled"
fi
