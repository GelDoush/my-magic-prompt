unalias mkdir 2>/dev/null

mkdir() {
  if [ -z "$2" ]; then
    echo "Error. Please enter a name next time"
  else
    command mkdir "$2"
  fi
}