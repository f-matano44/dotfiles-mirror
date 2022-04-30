# hook functions
autoload -Uz add-zsh-hook
add-zsh-hook precmd addLineBeforeUsername

# add one line before username
function addLineBeforeUsername()
{
    if [ -z "$ADD_LINE_BEFORE_USERNAME" ]; then
        ADD_LINE_BEFORE_USERNAME=1
    else
        echo ""
    fi
}

# color setting of PROMPT
name_color="%{\e[38;5;179m%}"
arrow_color="%{\e[38;5;087m%}"
color_reset="%{\e[0m%}"
PROMPT=`echo "${name_color}%n%#: %~${color_reset} 
${arrow_color}>>${color_reset} "`

# aliases
alias la='ls -a'
alias halt='shutdown'
alias reboot='shutdown -r'

# PATH
export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"

# other setting 
setopt auto_cd # omit "cd"
export CLICOLOR=1 # add color in "ls"

# Python
alias python="python3"
alias pip="pip3"
#alias python='/usr/local/opt/python@3.7/bin/python3'
#alias python3='/usr/local/opt/python@3.7/bin/python3'
#alias pip='/usr/local/opt/python@3.7/bin/pip3'
#alias pip3='/usr/local/opt/python@3.7/bin/pip3'
# pipenv
alias tts="cd ~/tts_with_Python && pipenv shell"
alias datascience="cd ~/Documents/Advanced_Data_Science_Exercise && pipenv shell"

# nodejs
export PATH=$HOME/.nodebrew/current/bin:$PATH

# java
alias javacu='javac -J-Dfile.encoding=UTF-8'
alias javau='java -Dfile.encoding=UTF-8'
# openjdk@11
#export PATH="/usr/local/opt/openjdk@11/bin:$PATH" # PATH
#export CPPFLAGS="-I/usr/local/opt/openjdk@11/include" # CPPFLAGS
# jdk-17.0.2.jdk
export PATH="$HOME/Applications/jdk-17.0.2.jdk/Contents/Home/bin:$PATH"


