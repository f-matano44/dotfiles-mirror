# 困ったときのメモ
# https://zenn.dev/estra/articles/zenn-fish-add-path-final-answer

# Commands to run in interactive sessions can go here
if status is-interactive
    set fish_greeting # remove intro message
end

switch (uname)
    case "Darwin"  # macOS
        # homebrew
        # if use x64: https://blog.mksc.jp/contents/apple-silicon/
        eval (/opt/homebrew/bin/brew shellenv)

        # Java
        set -gx JAVA_HOME (/usr/libexec/java_home -v "21")
        fish_add_path $JAVA_HOME/bin
        set -gx CPPFLAGS "-I$JAVA_HOME/include"

        # MATLAB
        # alias matlab-cli '/Applications/MATLAB_R2023b.app/bin/matlab -nodesktop'

        # Ruby
        fish_add_path $HOME/.rbenv/bin
        rbenv init - | source

        # coreutils
        fish_add_path /opt/homebrew/opt/coreutils/libexec/gnubin

    case "Linux"  # Linux
        # pyenv
        set -Ux PYENV_ROOT $HOME/.pyenv
        fish_add_path $PYENV_ROOT/bin

        # gradle
        fish_add_path ~/.local/bin/gradle/bin/
end

# pyenv
pyenv init - fish | source
pyenv global graalpy-community-24

# other alias
alias halt 'shutdown -h now'
alias reboot 'shutdown -r now'
alias えぃｔ 'exit'
abbr targz 'tar -zcvf' # targz filename.tar.gz dirname
abbr untargz 'tar -zxvf' # untargz filename.tar.gz

# atcoder
alias atjava "mkdir a b c d && \
    cp ~/dotfiles/atcoder/Main.java ./a/Main.java && \
    cp ~/dotfiles/atcoder/Main.java ./b/Main.java && \
    cp ~/dotfiles/atcoder/Main.java ./c/Main.java && \
    cp ~/dotfiles/atcoder/Main.java ./d/Main.java"
# abbr attest "oj t -c \"java Main.java\" -d ./test/"
# abbr atsubm4 "acc submit Main.java -- -l 4005"
# abbr atsubm5 "acc submit Main.java -- -l 5005"
