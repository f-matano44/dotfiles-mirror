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
        if test -x /opt/homebrew/bin/brew
            eval (/opt/homebrew/bin/brew shellenv)
            set -gx HOMEBREW_NO_ENV_HINTS 1
        end

        # uutils
        fish_add_path /opt/homebrew/opt/uutils-coreutils/libexec/uubin
        fish_add_path /opt/homebrew/opt/uutils-findutils/libexec/uubin

        # Java
        set -gx JAVA_HOME "/opt/homebrew/opt/openjdk/libexec/openjdk.jdk/Contents/Home"
        fish_add_path "$JAVA_HOME/bin"
        # set -gx CPPFLAGS "-I$JAVA_HOME/include"

        # eza
        type -q eza; and alias ls "eza --group-directories-first"

    case Linux
        # Gradle
        fish_add_path "$HOME/.local/gradle/bin/"

        # Node.js
        fish_add_path "$HOME/.local/node-v24.13.0-linux-x64/bin"

        # AMD Driver
        fish_add_path "/opt/rocm-6.3.4/bin"
end

# Python
set -e UV_PYTHON
set -e UV_EXCLUDE_NEWER
set -gx PIP_REQUIRE_VIRTUALENV 1
set -gx MPLBACKEND qtagg
set -gx UV_DEFAULT_INDEX "https://pypi.flatt.tech/simple/"
set -gx UV_VENV_CLEAR 1
abbr upython "uv run python3"

if status is-interactive
    # Docker -> Podman
    if type -q podman
        alias docker podman
        set -gx PODMAN_COMPOSE_WARNING_LOGS 0
    end

    # Load dot-envrc
    if type -q direnv
        direnv hook fish | source
    end
end
