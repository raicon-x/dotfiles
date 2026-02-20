# brew install fzf
# brew install fd
# Preview file content using bat (https://github.com/sharkdp/bat)
# brew install bat
# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)

# Use fd to provide input
export FZF_DEFAULT_COMMAND="fd --hidden --follow --strip-cwd-prefix --exclude .git"
export FZF_DEFAULT_OPTS="--layout=reverse-list"

# CTRL-T short-cut for fzf completion
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="
  $FZF_DEFAULT_OPTS
  --preview 'bat -n --color=always {}'
  --bind 'ctrl-/:change-preview-window(down|hidden|)'"
# CTRL-R to find history with fzf
export FZF_CTRL_R_OPTS="
  --bind 'ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort'
  --color header:italic
  --header 'Press CTRL-Y to copy command into clipboard'"
# ALT-C to cd directory with fzf
# Print tree structure in the preview window
export FZF_ALT_C_COMMAND="$FZF_DEFAULT_COMMAND --type=d"
export FZF_ALT_C_OPTS="
  --preview 'tree -C {}'"

# for ** completion
# Use fd (https://github.com/sharkdp/fd) for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  fd --hidden --follow --exclude ".git" . "$1"
}
# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type d --hidden --follow --exclude ".git" . "$1"
}

alias fzfp='fzf --style full --preview "bat -n --color=always {}" --bind "focus:transform-header:file --brief {}"'

# set up git for fzf
source ~/.config/fzf/fzf-git.sh

