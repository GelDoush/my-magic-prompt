unalias ls 2>/dev/null

ls() {
  if [ -z "$2" ]; then
    command ls -a
  else
    command ls -a "$2"
  fi
}