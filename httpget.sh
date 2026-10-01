httpget() {
  curl -s "$2" -o "$3"
  echo "Page téléchargée dans $3"
}