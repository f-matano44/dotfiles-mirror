# 困ったときのメモ
# https://zenn.dev/estra/articles/zenn-fish-add-path-final-answer

# Commands to run in interactive sessions can go here
if status is-interactive
    set fish_greeting # remove intro message
end

# homebrew
# if use x64: https://blog.mksc.jp/contents/apple-silicon/
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

# atcoder
alias atjava "mkdir a b c d && \
    cp ~/dotfiles/Main.java ./a/Main.java && \
    cp ~/dotfiles/Main.java ./b/Main.java && \
    cp ~/dotfiles/Main.java ./c/Main.java && \
    cp ~/dotfiles/Main.java ./d/Main.java &&"
# abbr attest "oj t -c \"java Main.java\" -d ./test/"
# abbr atsubm4 "acc submit Main.java -- -l 4005"
# abbr atsubm5 "acc submit Main.java -- -l 5005"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /opt/homebrew/Caskroom/miniforge/base/bin/conda
    eval /opt/homebrew/Caskroom/miniforge/base/bin/conda "shell.fish" "hook" $argv | source
else
    if test -f "/opt/homebrew/Caskroom/miniforge/base/etc/fish/conf.d/conda.fish"
        . "/opt/homebrew/Caskroom/miniforge/base/etc/fish/conf.d/conda.fish"
    else
        set -x PATH "/opt/homebrew/Caskroom/miniforge/base/bin" $PATH
    end
end
# <<< conda initialize <<<
conda activate p310

# LaTeX
fish_add_path /usr/local/texlive/2024basic/bin/universal-darwin
