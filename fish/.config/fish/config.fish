# Commands to run in interactive sessions can go here
if status is-interactive
    # login greeting
    function get_last_login
        if type -q last
            LANG=C last -R "$USER" | awk '\
                $7 != "gone" && $7 != "still" \
                { print $3, $4, $5, $6; exit }'
        else
            echo "LAST(1) isn't exist."
        end
    end
    set fish_greeting (test (uname) = "Darwin";
        and printf "";  # for MacOS
        or printf "Last login: %s" (get_last_login)  # for Linux
    )

    # alias
    alias えぃｔ exit
    alias docker podman
end

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
        fish_add_path /opt/homebrew/opt/uutils-coreutils/libexec/uubin

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
set -gx UV_VENV_CLEAR 1

# User's binary
fish_add_path "$HOME/.local/bin"
