# Commands to run in interactive sessions can go here
if status is-interactive
    # login greeting
    function get_last_login
        LANG=C last -R "$USER" | awk '\
            $7 != "gone" && $7 != "still" \
            { print $3, $4, $5, $6; exit }'
    end
    set fish_greeting (test (uname) = "Darwin";
        and printf "";  # for MacOS
        or printf "Last login: %s\n" (get_last_login)  # for Linux
    )

    # alias
    alias えぃｔ exit
end

# Python
set -gx PIP_REQUIRE_VIRTUALENV 1
set PYTHON_VERSION 3.13

# pipx etc.
fish_add_path "$HOME/.local/bin"

switch (uname)
    case Darwin
        # homebrew
        eval (/opt/homebrew/bin/brew shellenv)
        set -gx HOMEBREW_NO_ENV_HINTS 1

        # Java
        set -gx JAVA_HOME "/opt/homebrew/opt/openjdk/libexec/openjdk.jdk/Contents/Home"
        fish_add_path "$JAVA_HOME/bin"
        # set -gx CPPFLAGS "-I$JAVA_HOME/include"

        # Python
        alias python python3
        alias python3 "python$PYTHON_VERSION"

    case Linux
        # pyenv
        set -gx PYENV_ROOT "$HOME/.pyenv"
        fish_add_path "$PYENV_ROOT/bin"
        if type -q pyenv
            pyenv init - fish | source
            pyenv global "$PYTHON_VERSION"
        end

        # gradle
        fish_add_path "$HOME/.local/gradle/bin/"

        # amdgpu
        fish_add_path "/opt/rocm-6.3.4/bin"
end
