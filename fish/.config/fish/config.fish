# Commands to run in interactive sessions can go here
if status is-interactive
    # login greeting
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

        # GNU Utilities
        fish_add_path /opt/homebrew/opt/coreutils/libexec/gnubin
        fish_add_path /opt/homebrew/opt/findutils/libexec/gnubin

    case Linux
        # Gradle
        fish_add_path "$HOME/.local/gradle/bin/"

        # Node.js
        fish_add_path "$HOME/.local/node-v24.13.0-linux-x64/bin"

        # AMD Driver
        fish_add_path "/opt/rocm-6.3.4/bin"
end

# Python
set -gx PIP_REQUIRE_VIRTUALENV 1
set -gx MPLBACKEND qtagg
set -gx UV_VENV_CLEAR 1
set -e UV_PYTHON

if status is-interactive
    # Container
    if type -q podman
        alias docker podman
        set -gx PODMAN_COMPOSE_WARNING_LOGS 0
    end

    # Load local environment variable
    if type -q direnv
        direnv hook fish | source
    end
end
