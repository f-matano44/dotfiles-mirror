# Commands to run in interactive sessions can go here
if status is-interactive
    set fish_greeting # remove intro message
end

# homebrew
# ref: https://blog.mksc.jp/contents/apple-silicon/
## Intel
eval (/usr/local/bin/brew shellenv)
alias 86brew 'arch -x86_64 /usr/local/bin/brew'
## AppleSilicon
eval (/opt/homebrew/bin/brew shellenv)

# Python
alias python 'python3'
alias pip 'pip3'
set PATH ~/Library/Python/3.8/bin $PATH # pipenv

# Java
alias javacu 'javac -J-Dfile.encoding=UTF-8'
alias javau 'java -Dfile.encoding=UTF-8'

# asdf
source /opt/homebrew/opt/asdf/libexec/asdf.fish

# other alias
abbr la 'ls -a'
alias halt 'shutdown -h now'
alias reboot 'shutdown -r now'
alias えぃｔ 'exit'
abbr targz 'tar -zcvf' # targz filename.tar.gz dirname
abbr untargz 'tar -zxvf' # untargz filename.tar.gz
