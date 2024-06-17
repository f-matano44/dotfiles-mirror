# 困ったときのメモ
# https://zenn.dev/estra/articles/zenn-fish-add-path-final-answer

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

# Java
set -gx JAVA_HOME (/usr/libexec/java_home -v "17")
fish_add_path $JAVA_HOME/bin
set -gx CPPFLAGS "-I$JAVA_HOME/include"

# other alias
alias halt 'shutdown -h now'
alias reboot 'shutdown -r now'
alias えぃｔ 'exit'
abbr targz 'tar -zcvf' # targz filename.tar.gz dirname
abbr untargz 'tar -zxvf' # untargz filename.tar.gz
alias matlab-cli '/Applications/MATLAB_R2023b.app/bin/matlab -nodesktop'

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /opt/homebrew/Caskroom/miniconda/base/bin/conda
    eval /opt/homebrew/Caskroom/miniconda/base/bin/conda "shell.fish" "hook" $argv | source
else
    if test -f "/opt/homebrew/Caskroom/miniconda/base/etc/fish/conf.d/conda.fish"
        . "/opt/homebrew/Caskroom/miniconda/base/etc/fish/conf.d/conda.fish"
    else
        set -x PATH "/opt/homebrew/Caskroom/miniconda/base/bin" $PATH
    end
end
# <<< conda initialize <<<
conda activate p310

# atcoder
alias atjava "cat ~/dotfiles/Main.java > ./Main.java"
abbr attest "oj t -c \"java Main.java\" -d ./test/"
abbr atsubm4 "acc submit Main.java -- -l 4005"
abbr atsubm5 "acc submit Main.java -- -l 5005"
