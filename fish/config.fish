# Commands to run in interactive sessions can go here
if status is-interactive

    set LAST_LOGIN (LANG=C last -n 10 (whoami) | \
                    awk '!($3 == "login" && $4 == "screen")' | \
                    awk '$8 != "gone" && $8 != "still"' | \
                    head -n 1 | awk '{ print $4, $5, $6, $7 }')
    set fish_greeting (test (uname) = "Darwin";
        and echo "";  # for MacOS
        or echo "Last login: $LAST_LOGIN"  # for Linux
    )

    # alias
    alias halt 'shutdown -h now'
    alias reboot 'shutdown -r now'
    alias えぃｔ exit
    alias targz 'tar -zcvf' # targz filename.tar.gz dirname
    alias untargz 'tar -zxvf' # untargz filename.tar.gz

    # atcoder
    alias atc_java "mkdir a b c d && \
        cp ~/dotfiles/atcoder/Main.java ./a/Main.java && \
        cp ~/dotfiles/atcoder/Main.java ./b/Main.java && \
        cp ~/dotfiles/atcoder/Main.java ./c/Main.java && \
        cp ~/dotfiles/atcoder/Main.java ./d/Main.java"
end

switch (uname)
    case Darwin # macOS
        # homebrew
        eval (/opt/homebrew/bin/brew shellenv)

        # Java
        set -gx JAVA_HOME (/usr/libexec/java_home -v "21")
        fish_add_path $JAVA_HOME/bin
        set -gx CPPFLAGS "-I$JAVA_HOME/include"

        # Ruby
        fish_add_path /opt/homebrew/opt/ruby/bin
        set -gx LDFLAGS -L/opt/homebrew/opt/ruby/lib
        set -gx CPPFLAGS -I/opt/homebrew/opt/ruby/include
        set -gx PKG_CONFIG_PATH /opt/homebrew/opt/ruby/lib/pkgconfig

    case Linux
        # pyenv
        set -gx PYENV_ROOT $HOME/.pyenv
        fish_add_path $PYENV_ROOT/bin

        # gradle
        fish_add_path ~/.local/bin/gradle/bin/

        # hugo (skip if installed via snap)
        if not type -q hugo
            fish_add_path ~/.local/bin/hugo
        end

        # amdgpu
        fish_add_path /opt/rocm-6.3.4/bin

        # Swift
        fish_add_path ~/.local/share/swiftly
        fish_add_path ~/.local/share/swiftly/bin
end

# Python
if type -q pyenv
    pyenv init - fish | source
    pyenv global 3.13
end
