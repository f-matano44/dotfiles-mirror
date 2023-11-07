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

# Python (miniconda3)
fish_add_path ~/miniconda3/bin

# Java
fish_add_path ~/Applications/apache-ant-1.10.13/bin
fish_add_path ~/Applications/apache-maven-3.9.2/bin
fish_add_path /opt/homebrew/opt/openjdk@17/bin
set JAVA_HOME /opt/homebrew/opt/openjdk@17
set -gx CPPFLAGS "-I/opt/homebrew/opt/openjdk@17/include"

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
alias matlab-cli '/Applications/MATLAB_R2022a.app/bin/matlab -nodesktop'

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /Users/fumi/miniconda3/bin/conda
    eval /Users/fumi/miniconda3/bin/conda "shell.fish" "hook" $argv | source
end
# <<< conda initialize <<<

# atcoder
alias atjava "cat ~/dotfiles/Main.java > ./Main.java"
abbr attest "oj t -c \"java Main.java\" -d ./test/"
abbr atsubm4 "acc submit Main.java -- -l 4005"
abbr atsubm5 "acc submit Main.java -- -l 5005"
