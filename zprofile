# I recommend to read this page
# https://qiita.com/magicant/items/d3bb7ea1192e63fba850

# homebrew (m1)
#eval "$(/opt/homebrew/bin/brew shellenv)"

# pyenv
export PYENV_ROOT="$HOME/.pyenv/shims"
export PATH="$PYENV_ROOT:$PATH"
export PIPENV_PYTHON="$PYENV_ROOT/python"

# brew
export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"

# pipenv
export PATH="$HOME/Library/Python/3.8/bin:$PATH"

# nodejs
#export PATH=$HOME/.nodebrew/current/bin:$PATH

# add color in "ls"
export CLICOLOR=1