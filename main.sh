#!/bin/bash
source quit.sh
source about.sh
source age.sh
source cd.sh
source ls.sh
source help.sh
source hour.sh
source httpget.sh
source open.sh
source passw.sh
source profil.sh
source pwd.sh
source rm.sh
source rmdir.sh
source smtp.sh
source version.sh
source touch.sh
source mkdir.sh
source cat.sh
source rps.sh

USER_CORRECT="eloua"
PASS_CORRECT="12345"

login() {
  echo -n "Login : "
  read user_input

  echo -n "Password : "
  stty -echo
  read pass_input
  stty echo
  echo

  if [ "$user_input" != "$USER_CORRECT" ] || [ "$pass_input" != "$PASS_CORRECT" ]; then
    echo "Access denied"
    exit 1
  fi
  echo "Access approved"
}

cmd() {
  argv=($*)
  cmd=${argv[1]}

  case "${cmd}" in
    cd ) cd $argv ;;
    ls ) ls $argv ;;
    help ) help $argv ;;
    rm ) rm $argv ;;
    rmd | rmdir ) rmdir $argv ;;
    about ) about $argv ;;
    version | -v | --v | vers ) version $argv ;;
    age ) age $argv ;;
    quit | exit ) quit $argv ;;
    profil ) profil $argv ;;
    passw ) passw $argv ;;
    pwd ) pwd $argv ;;
    hour ) hour $argv ;;
    httpget ) httpget $argv ;;
    smtp ) smtp $argv ;;
    open ) open $argv ;;
    touch ) touch $argv ;;
    cat ) cat $argv ;;
    rps ) rps $argv ;;
    mkdir | mkd ) mkdir $argv ;;
    * ) echo "Unknown command" ;;
  esac
}

main() {
  login

  lineCount=1

  while [ 1 ]; do
    date=$(date +%H:%M)
    echo -ne "${date} - [\033[31m${lineCount}\033[m] - \033[33mSmiley\033[m ~ ☠️ ~ "
    read -r string

    # string cuts args
    cmd $=string
    lineCount=$(($lineCount+1))
  done
}

main