
#------------Common Ubuntu commands (custom)------------------------

# set terminal tab title (rename tab)
set-title(){
  ORIG=$PS1
  TITLE="\e]2;$@\a"
  PS1=${ORIG}${TITLE}
}

#-----------Terminal-------------

# Copy file content to clipboard (for CTRL+V) using xclip 
function fcc() {
    cat $1|xclip -i -selection clipboard
}

#------------Git (custom) commands------------------------

# add commit  push by one command
function gacp() {
    git add .
    git commit -m "$1"
    git push
}