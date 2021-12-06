#!/bin/bash

function exec_input_filter() {
  local i=""
  local t=""
  local k=""
  for i in "$@"
  do
    if [ "$t" == "" ] 
    then
      t="$i"
      read -p "$t" k
      k="$(echo $k | tr '[:upper:]' '[:lower:]')"
    elif [ "$k" == "$(echo $i | tr '[:upper:]' '[:lower:]')" ]
    then
       echo "$k"
       break
    fi
  done
  if [ "$k" == "" -a "$i" != "__NODEFAULT__" ]
  then
    echo "__DEFAULT__"
  fi
}
defn_input_filter=`declare -f exec_input_filter`

# the function is case-insensitive, and always converts the input to lowercase
# arguments which contain spaces must be double-quoted in the argument list
# first argument is the message, next arguments are the accepted values
# if the last argument is '__NODEFAULT__' then disallow entering empty-string
# the function returns the entered text converted to lowercase
# if an empty-string is enetered then the function returns '__DEFAULT__'
function exec_input() {
  local a
  while true
  do
    a="$(exec_input_filter "$@")"
    test "$a" != "" && echo "$a" && break
    echo "Invalid selection." > /dev/tty
    echo > /dev/tty
  done
}
defn_input=`declare -f exec_input`

shell_init_files_system=("sh:/etc/profile" "bash:/etc/profile" "zsh:/etc/zshenv" "csh:/etc/csh.cshrc" "csh:/etc/csh.login" "sh:usr/local/etc/profile" "bash:/usr/local/etc/profile" "zsh:/usr/local/etc/zshenv" "csh:/usr/local/etc/csh.cshrc" "csh:/usr/local/etc/csh.login")
shell_init_files_user=("sh:$HOME/.profile" "bash:$HOME/.bash_profile" "bash:$HOME/.bash_login" "bash:$HOME/.profile" "zsh:$HOME/.zshenv" "zsh:$HOME/.zprofile" "zsh:$HOME/.zlogin" "csh:$HOME/.tcshrc" "csh:$HOME/.cshrc" "csh:$HOME/.login")
