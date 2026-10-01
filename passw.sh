unalias passw 2>/dev/null

passw() {
  echo -n "Current password: "
  stty -echo; read old_pass; stty echo; echo

  if [ "$old_pass" != "$PASS_CORRECT" ]; then
    echo "Access denied: wrong password"
    return
  fi

  echo -n "New password: "
  stty -echo; read new_pass; stty echo; echo

  echo -n "Confirm new password: "
  stty -echo; read confirm_pass; stty echo; echo

  if [ "$new_pass" != "$confirm_pass" ]; then
    echo "Error: passwords do not match"
    return
  fi

  # Modification directe de la variable globale
  PASS_CORRECT="$new_pass"
  echo "Password successfully updated!"
}