# I recommend to read this page
# https://qiita.com/magicant/items/d3bb7ea1192e63fba850

# pyenv
export PYENV_ROOT="$HOME/.pyenv/shims"
export PATH="$PYENV_ROOT:$PATH"
export PIPENV_PYTHON="$PYENV_ROOT/python"

# brew
export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"

# brew (m1)
#eval "$(/opt/homebrew/bin/brew shellenv)"

# pipenv
export PATH="$HOME/Library/Python/3.8/bin:$PATH"

# nodejs
#export PATH=$HOME/.nodebrew/current/bin:$PATH

# openjdk@11
#export PATH="/usr/local/opt/openjdk@11/bin:$PATH" # PATH
#export CPPFLAGS="-I/usr/local/opt/openjdk@11/include" # CPPFLAGS

# jdk-17.0.2.jdk
#export PATH="$HOME/Applications/jdk-17.0.2.jdk/Contents/Home/bin:$PATH"

# add color in "ls"
export CLICOLOR=1