zstyle ":completion:*:commands" rehash 1

# Load version control information
autoload -Uz vcs_info
precmd() { vcs_info }

# Format the vcs_info_msg_0_ variable
zstyle ':vcs_info:git:*' formats ' on branch %b'

# Enable substitution in the prompt.
setopt prompt_subst

PROMPT="%F{green}%n%f %F%D{%Y-%m-%d %H:%M:%S} %F{cyan}($(arch))%f:%F{blue}%~%f"'${vcs_info_msg_0_}'$'\n'"%# "
RPROMPT=

# History設定
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000
setopt share_history
setopt hist_ignore_dups
setopt hist_ignore_all_dups
setopt hist_ignore_space
setopt hist_reduce_blanks

eval $(/opt/homebrew/bin/brew shellenv)

if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
  source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
  source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
  autoload -Uz compinit && compinit
fi

# ctrl + r で過去に実行したコマンドを選択できるようにする。
function peco-select-history() {
  BUFFER=$(\history -n -r 1 | peco --query "$LBUFFER")
  CURSOR=$#BUFFER
  zle clear-screen
}
zle -N peco-select-history
bindkey '^r' peco-select-history


export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/01036954/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/01036954/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/01036954/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/01036954/google-cloud-sdk/completion.zsh.inc'; fi
