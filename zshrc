# hook 関数の登録
autoload -Uz add-zsh-hook
add-zsh-hook precmd addLineBeforeUsername

# ユーザー名の前に１行挿入
function addLineBeforeUsername()
{
    if [ -z "$ADD_LINE_BEFORE_USERNAME" ]; then
        ADD_LINE_BEFORE_USERNAME=1
    else
        echo ""
    fi
}

# ユーザー名等々の表示
name_color="%{\e[38;5;179m%}"
arrow_color="%{\e[38;5;087m%}"
color_reset="%{\e[0m%}"
PROMPT=`echo "${name_color}%n%#: %~
${arrow_color}>>${color_reset} "`

# エイリアス
alias la='ls -a'
alias javacu='javac -J-Dfile.encoding=UTF-8'
alias javau='java -Dfile.encoding=UTF-8'
alias python="python3"
alias pip="pip3"
# alias python='/usr/local/opt/python@3.7/bin/python3'
# alias python3='/usr/local/opt/python@3.7/bin/python3'
# alias pip='/usr/local/opt/python@3.7/bin/pip3'
# alias pip3='/usr/local/opt/python@3.7/bin/pip3'

# pipenv
alias tts="cd ~/tts_with_Python && pipenv shell"
alias MLPR="cd ~/Documents/MLPR && pipenv shell"

# PATH
export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"

# nodejs
export PATH=$HOME/.nodebrew/current/bin:$PATH

# openjdk@11
# export PATH="/usr/local/opt/openjdk@11/bin:$PATH" # PATH
# export CPPFLAGS="-I/usr/local/opt/openjdk@11/include" # CPPFLAGS

# jdk-17.0.2.jdk
export PATH="$HOME/Applications/jdk-17.0.2.jdk/Contents/Home/bin:$PATH"

# なにかと便利になる設定
setopt auto_cd # cd コマンドを省略
export CLICOLOR=1 # ls コマンドに色付け
