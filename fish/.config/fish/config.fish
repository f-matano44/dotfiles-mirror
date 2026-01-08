# Commands to run in interactive sessions can go here
if status is-interactive
    # login greeting
    function get_last_login
        LANG=C last -R "$USER" | awk '\
            $7 != "gone" && $7 != "still" && $8 != "still" \
            { print $3, $4, $5, $6, $9; exit }'
    end
    set fish_greeting (test (uname) = "Darwin";
        and printf "";  # for MacOS
        or printf "Last login: %s" (get_last_login)  # for Linux
    )
end

# User's binary
fish_add_path "$HOME/.local/bin"

switch (uname)
    case Darwin
        # Homebrew
        eval (/opt/homebrew/bin/brew shellenv)
        set -gx HOMEBREW_NO_ENV_HINTS 1

        # Java
        set -gx JAVA_HOME "/opt/homebrew/opt/openjdk/libexec/openjdk.jdk/Contents/Home"
        fish_add_path "$JAVA_HOME/bin"
        # set -gx CPPFLAGS "-I$JAVA_HOME/include"

        # python-is-python3
        alias python python3
        alias pip "python -m pip"
        alias pip3 "python3 -m pip"

        # coreutils
        fish_add_path /opt/homebrew/opt/coreutils/libexec/gnubin

    case Linux
        # Gradle
        fish_add_path "$HOME/.local/gradle/bin/"

        # AMD Driver
        fish_add_path "/opt/rocm-6.3.4/bin"
end

# Python
set -gx PIP_REQUIRE_VIRTUALENV 1
set -gx MPLBACKEND qtagg
set -gx UV_PYTHON 3.13
set -gx UV_VENV_CLEAR 1

# Container
if type -q docker
    alias podman docker
else if type -q podman
    alias docker podman
    set -gx PODMAN_COMPOSE_WARNING_LOGS 0
end

# LaTeX
abbr --add texlive_container_build "podman build -t texlive-uplatex ."
abbr --add latex_build "podman run --rm -v \"$PWD:/workdir\" texlive-uplatex"
