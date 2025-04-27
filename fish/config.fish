# Commands to run in interactive sessions can go here
if status is-interactive

    set LAST_LOGIN (last -n 3 (whoami) | head -n 3 | tail -n 1 |\
                    awk '{ print $4, $5, $6, $7 }')
    set fish_greeting "Last login: $LAST_LOGIN"


    switch (uname)
        case "Darwin"  # macOS
            # homebrew
            eval (/opt/homebrew/bin/brew shellenv)

            # Java
            set -gx JAVA_HOME (/usr/libexec/java_home -v "21")
            fish_add_path $JAVA_HOME/bin
            set -gx CPPFLAGS "-I$JAVA_HOME/include"

            # MATLAB
            # alias matlab-cli '/Applications/MATLAB_R2023b.app/bin/matlab -nodesktop'

            # Ruby
            fish_add_path $HOME/.rbenv/bin
            if type -q rbenv
                rbenv init - | source
            end

            # coreutils
            # fish_add_path /opt/homebrew/opt/coreutils/libexec/gnubin

        case "Linux"
            # pyenv
            set -Ux PYENV_ROOT $HOME/.pyenv
            fish_add_path $PYENV_ROOT/bin

            # gradle
            fish_add_path ~/.local/bin/gradle/bin/

            # wine
            # WINEARCH=win32 wineboot
            # winetricks --self-update

            # hugo (skip if installed via snap)
            if not type -q hugo
                fish_add_path ~/.local/bin/hugo
            end

            # amdgpu
            fish_add_path /opt/rocm-6.3.4/bin

            # doas
            if type -q doas
                alias sudo doas
            end
    end

    # pyenv
    if type -q pyenv
        pyenv init - fish | source
        pyenv global 3.11
    end

    # other alias
    alias halt 'shutdown -h now'
    alias reboot 'shutdown -r now'
    alias えぃｔ 'exit'
    alias targz 'tar -zcvf'    # targz filename.tar.gz dirname
    alias untargz 'tar -zxvf'  # untargz filename.tar.gz

    # atcoder
    alias atc_java "mkdir a b c d && \
        cp ~/dotfiles/atcoder/Main.java ./a/Main.java && \
        cp ~/dotfiles/atcoder/Main.java ./b/Main.java && \
        cp ~/dotfiles/atcoder/Main.java ./c/Main.java && \
        cp ~/dotfiles/atcoder/Main.java ./d/Main.java"
end
