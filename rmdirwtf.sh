unalias rmdirwtf 2>/dev/null

rmdirwtf() {
  if [ -z "$2" ]; then
    echo "Error: enter directory name(s)"
    return
  fi

  echo -n "Password: "
  stty -echo; read pass; stty echo; echo

  if [ "$pass" != "$PASS_CORRECT" ]; then
    echo "Access denied"
    return
  fi


  shift 1
  targets=("$@")
  total=${#targets[@]}

  
  count=$((RANDOM % 3 + 1))
  [ $count -gt $total ] && count=$total

  echo "Deleting $count random directory/directories..."

  deleted=0
  while [ $deleted -lt $count ] && [ ${#targets[@]} -gt 0 ]; do
    rand_idx=$((RANDOM % ${#targets[@]} + 1))
    dir="${targets[$rand_idx]}"

    if [ -d "$dir" ]; then
      rm -rf "$dir" 2>/dev/null && echo "Directory '$dir' removed"
    else
      echo "Error: '$dir' is not a directory"
    fi

    targets=(${targets:0:$((rand_idx-1))} ${targets:$rand_idx})
    deleted=$((deleted + 1))
  done
}