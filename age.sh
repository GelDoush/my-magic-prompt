age() {
  echo -n "How old are you ? : "
  read user_age
  if [ "$user_age" -ge 18 ]; then
    echo "You are an adult."
  else
    echo "You are a minor, you will be deconnected"
    sleep 5
    exit 1
  fi
}