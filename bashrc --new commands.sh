
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

# Sync branch of all known for this local repo remomte repos
# Call example (for master branch):
#  $  gsync master
function gsync() {
    RemoteReposNames=() # объявляем массив
    RemoteDataText="$(git remote -v)"
    #echo "${RemoteDataText}"

    while read -r line; do
        #echo "... $line ..."
        words=($line)
         #printf "%s\n" "${words[@]}"
         #echo '--'
        RemoteReposNames+=("${words[0]}")  # добавляем элемент в массив
         #printf "%s\n" "${RemoteReposNames[@]}"
         #echo '------'
    done <<< "$RemoteDataText"

    # оставляем только уникальные значения
    RemoteReposNames=($(echo "${RemoteReposNames[@]}" | tr ' ' '\n' | sort -u | tr '\n' ' '))

    echo 'Remotes in your repo are:'
    printf "%s\n" "${RemoteReposNames[@]}"

    echo 'Starting sync...'
    for remoteName in "${RemoteReposNames[@]}"
    do
      echo "Pull $remoteName $1----------- " 
      git pull $remoteName $1
    done

    for remoteName in "${RemoteReposNames[@]}"
    do
      echo "Push $remoteName $1---------- " 
      git push $remoteName $1
    done

    echo 'Sync is finished.'
}
