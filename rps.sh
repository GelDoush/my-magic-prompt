unalias rps 2>/dev/null

rps() {
  echo -n "Player 1 name: " && read p1
  echo -n "Player 2 name: " && read p2

  s1=0; s2=0

  for r in 1 2 3; do
    echo "--- Round $r ---"

    echo -n "$p1 (rock/paper/scissors): "
    stty -echo; read m1; stty echo; echo

    echo -n "$p2 (rock/paper/scissors): "
    stty -echo; read m2; stty echo; echo

    # 10% chance to trigger SuperKitty for Player 1
    rand1=$((RANDOM % 100 + 1))
    [ $rand1 -le 10 ] && m1="SuperKitty" && echo "SUPERKITTY summoned for $p1!"

    # 10% chance to trigger SuperKitty for Player 2
    rand2=$((RANDOM % 100 + 1))
    [ $rand2 -le 10 ] && m2="SuperKitty" && echo "SUPERKITTY summoned for $p2!"

    # Resolution
    if [ "$m1" = "SuperKitty" -a "$m2" = "SuperKitty" ]; then
      echo "Draw!"
    elif [ "$m1" = "SuperKitty" ]; then
      echo "$p1 wins round!"; s1=$((s1+1))
    elif [ "$m2" = "SuperKitty" ]; then
      echo "$p2 wins round!"; s2=$((s2+1))
    elif [ "$m1" = "$m2" ]; then
      echo "Draw!"
    elif [ "$m1" = "rock" -a "$m2" = "scissors" ] || \
         [ "$m1" = "scissors" -a "$m2" = "paper" ] || \
         [ "$m1" = "paper" -a "$m2" = "rock" ]; then
      echo "$p1 wins round!"; s1=$((s1+1))
    else
      echo "$p2 wins round!"; s2=$((s2+1))
    fi
  done

  echo "Final score: $p1 $s1 - $s2 $p2"
}