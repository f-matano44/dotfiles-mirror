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

        # get podman socket
        # https://podman-desktop.io/docs/migrating-from-docker/using-the-docker_host-environment-variable
        if type -q podman
            set PODMAN_SOCKET_LOCATION (podman machine inspect --format '{{.ConnectionInfo.PodmanSocket.Path}}')
        end

    case Linux
        # Gradle
        fish_add_path "$HOME/.local/gradle/bin/"

        # AMD ROCm
        # https://rocm.docs.amd.com/en/latest/reference/gpu-arch-specs.html
        set -gx GFX_ARCH gfx1102
        set -gx ROCM_VERSION 6.3.4
        fish_add_path "/opt/rocm-$ROCM_VERSION/bin"
end

# Python
set -gx PIP_REQUIRE_VIRTUALENV 1
set -gx MPLBACKEND qtagg
set -gx UV_PYTHON 3.13
set -gx UV_VENV_CLEAR 1

# Podman
if type -q podman
    alias docker podman
    set -gx PODMAN_COMPOSE_WARNING_LOGS 0
    set -gx DOCKER_HOST "unix://$PODMAN_SOCKET_LOCATION"
end
