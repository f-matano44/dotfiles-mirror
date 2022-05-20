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
alias halt='shutdown -h now'
alias reboot='shutdown -r now'
alias えぃｔ='exit'

# other setting 
setopt auto_cd # omit "cd"

# Python
alias python='python3'
alias pip='pip3'
#alias python='/usr/local/opt/python@3.7/bin/python3'
#alias python3='/usr/local/opt/python@3.7/bin/python3'
#alias pip='/usr/local/opt/python@3.7/bin/pip3'
#alias pip3='/usr/local/opt/python@3.7/bin/pip3'

# pipenv
alias tts='cd ~/ttslearn/notebooks && pipenv shell'
alias datascience='cd ~/Documents/Advanced_Data_Science_Exercise && pipenv shell'

# java
alias javacu='javac -J-Dfile.encoding=UTF-8'
alias javau='java -Dfile.encoding=UTF-8'
# openjdk@11
#export PATH="/usr/local/opt/openjdk@11/bin:$PATH" # PATH
#export CPPFLAGS="-I/usr/local/opt/openjdk@11/include" # CPPFLAGS
# jdk-17.0.2.jdk
#export PATH="$HOME/Applications/jdk-17.0.2.jdk/Contents/Home/bin:$PATH"


