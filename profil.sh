profil() {
  echo -n "Name : "
  read name
  echo -n "Last Name : "
  read lname
  echo -n "Age : "
  read user_age
  echo -n "Email : "
  read email

  echo "--- User profile ---"
  echo "Full name : $name $nom"
  echo "Age : $user_age years"
  echo "Email : $email"
}