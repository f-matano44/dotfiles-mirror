if status is-interactive
    # Commands to run in interactive sessions can go here
end

# remove intro message
set fish_greeting

# set OSname
set OSname (uname -s)

# brew (m1)
eval (/opt/homebrew/bin/brew shellenv)

# PATH
set PATH ~/Library/Python/3.8/bin $PATH # pipenv
set PYENV_ROOT ~/.pyenv/shims # pyenv
set PATH $PYENV_ROOT $PATH  # pyenv
set PIPENV_PYTHON $PYENV_ROOT/python # pyenv
set PATH /Users/fumi/Library/node-v14.17.5-darwin-x64/bin $PATH # nodejs@14

# alias
alias la='ls -a'
alias halt='shutdown -h now'
alias reboot='shutdown -r now'
alias えぃｔ='exit'
alias python='python3'
alias pip='pip3'
alias javacu='javac -J-Dfile.encoding=UTF-8'
alias javau='java -Dfile.encoding=UTF-8'
alias targz='tar -zcvf' # targz filename.tar.gz dirname
alias untargz='tar -zxvf' # untargz filename.tar.gz

source /opt/homebrew/opt/asdf/libexec/asdf.fish
