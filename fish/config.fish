if status is-interactive
    # Commands to run in interactive sessions can go here
end

# remove intro message
set fish_greeting

# homebrew
# ref: https://blog.mksc.jp/contents/apple-silicon/
## Intel
eval (/usr/local/bin/brew shellenv)
alias 86brew='arch -x86_64 /usr/local/bin/brew'
## AppleSilicon
eval (/opt/homebrew/bin/brew shellenv)

# PATH
set PATH ~/Library/Python/3.8/bin $PATH # pipenv

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
