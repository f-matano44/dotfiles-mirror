# Commands to run in interactive sessions can go here
if status is-interactive
    set fish_greeting # remove intro message
end

# homebrew
# ref: https://blog.mksc.jp/contents/apple-silicon/
## Intel
eval (/usr/local/bin/brew shellenv)
alias 86brew 'arch -x86_64 /usr/local/bin/brew'
## Apple Silicon
eval (/opt/homebrew/bin/brew shellenv)

# Python
alias python 'python3'
alias pip 'pip3'

# Python x86_64
## Python has been installed as /usr/local/bin/python3.8
## Unversioned and major-versioned symlinks `python`, `python3`,
## `python-config`, `python3-config`, `pip`, `pip3`, etc. pointing to
## `python3.8`, `python3.8-config`, `pip3.8`, etc.,
## respectively, have been installed into /usr/local/opt/python@3.8/libexec/bin
alias 86python 'arch -x86_64 /usr/local/bin/python3.8'
alias 86pip 'arch -x86_64 /usr/local/bin/python3.8 -m pip'

# Java
fish_add_path /opt/homebrew/opt/openjdk@11/bin
set -gx CPPFLAGS "-I/opt/homebrew/opt/openjdk@11/include"
# alias javacu 'javac -J-Dfile.encoding=UTF-8'
# alias javau 'java -Dfile.encoding=UTF-8'

# asdf
source /opt/homebrew/opt/asdf/libexec/asdf.fish

# Docker
abbr d "docker"
abbr dc "docker-compose"

# other alias
abbr la 'ls -a'
alias halt 'shutdown -h now'
alias reboot 'shutdown -r now'
alias えぃｔ 'exit'
abbr targz 'tar -zcvf' # targz filename.tar.gz dirname
abbr untargz 'tar -zxvf' # untargz filename.tar.gz
