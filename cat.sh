unalias cat 2>/dev/null

cat() {
  if [ -z "$2" ]; then
    echo "Error. Please specify a file to read"
  else
    if [ -f "$2" ]; then
        echo ""
        command cat "$2"
        echo ""
    else
      echo "Error. File '$2' not found"
    fi
  fi
}