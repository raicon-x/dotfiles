set -o err_return

# ---------- WezTerm ---------- 
PATH="$PATH:/Applications/WezTerm.app/Contents/MacOS"
export PATH

# --------- Nerd Font -----------
# brew install font-jetbrains-mono-nerd-font

# --------- Starship -----------
# starship
export STARSHIP_CONFIG=~/.config/starship/starship.toml
eval "$(starship init zsh)"

# --------- zah-autosuggestion ----------- 
# brew install zsh-autosuggestion
# source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# --------- zsh-syntax-highting ----------- 
# brew install zsh-syntax-hightlighting
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

# Auto-set proxy if not already defined
if [[ -z "$http_proxy" && -z "$https_proxy" && -z "$all_proxy" ]]; then
  export https_proxy="http://127.0.0.1:26812"
  export http_proxy="http://127.0.0.1:26812"
  export all_proxy="socks5://127.0.0.1:26812"
  echo "Proxy auto-configured to 127.0.0.1:26812"
fi

