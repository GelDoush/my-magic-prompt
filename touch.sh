unalias touch 2>/dev/null

touch() {
  if [ -z "$2" ]; then
    echo "Error. Please enter a name next time"
  else
    command touch "$2"
  fi
}