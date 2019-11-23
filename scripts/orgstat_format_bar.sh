# converts from a:b to a + b/60
function convert_from {
  IFS=":" read a b <<< $(echo $1)

  # strip leading 0s
  if [ "$a" != "00" ]; then a=$(echo $a | sed 's/^0*//'); fi
  if [ "$b" != "00" ]; then b=$(echo $b | sed 's/^0*//'); fi

  echo $( echo "print ($a + $b/60)" | python )
}

function convert_to {
  a0=$(python -c "import math; print(math.floor($1))")
  b=$(printf '%02d' $(python -c "import math; print(math.floor(($1 - $a0)*60))"))
  a=$(printf '%02d' $a0)

  echo "$a:$b"
}


# first 6 arguments are r1g1b1 r2g2b2, 7th and 8th arguments are limits, 9th is value
function avg_col {

  left=$1
  right=$2
  val=$3

  val=$(python -c "print(min($right, max($val, $left)))")
  k=$(python -c "print(($val - $left)/($right - $left) if $right != $left else 1)")

  if [ $4 == "1" ]; then k=$(python -c "print(1-$k)"); fi

  # skewed gradient
  if python -c "exit(0 if $k<0.7 else 1)"; then
    # gradient between red and yellow
    r=255
    g=$(echo "import math; print (math.floor(($k/0.7)*255))" | python)
    b=0
  else
    # between yellow and green
    r=$(echo "import math; print (255 - math.floor((($k-0.7)/0.3)*255))" | python)
    g=255
    b=0
  fi

  r=$(printf '%02x' $r)
  g=$(printf '%02x' $g)
  b=$(printf '%02x' $b)

  col="#$r$g$b"

  echo $col
}

daynum=$(date +%u)

thisWeekMNum=$(convert_from $thisWeekM)
thisWeekHNum=$(convert_from $thisWeekH)
thisWeekENum=$(convert_from $thisWeekE)

todayMNum=$(convert_from $todayM)
todayHNum=$(convert_from $todayH)
todayENum=$(convert_from $todayE)

prevMNum=$( python -c "print($thisWeekMNum - $todayMNum)" )
prevHNum=$( python -c "print($thisWeekHNum - $todayHNum)" )
prevENum=$( python -c "print($thisWeekENum - $todayENum)" )

echo $prevMNum
echo $prevHNum
echo $prevENum

# This is how much I should have achieved up to this day
sD=7
sRateHigh=$(echo "print (30 * (($daynum if $daynum <= $sD else $sD)/$sD))" | python)
hRateHigh=$(echo "print (25 * ($daynum/7))" | python)
eRateHigh=$(echo "print (20 * ($daynum/7))" | python)

echo $sRateHigh
echo $hRateHigh
echo $eRateHigh

sColor=$(avg_col $prevMNum $sRateHigh $thisWeekMNum 0 )
hColor=$(avg_col $prevHNum $hRateHigh $thisWeekHNum 0 )
eColor=$(avg_col $prevENum $eRateHigh $thisWeekENum 1 )

str="<fc=$sColor>u$thisWeekM</fc>/$(convert_to $sRateHigh) <fc=$hColor>h$thisWeekH</fc>/$(convert_to $hRateHigh) <fc=$eColor>e$thisWeekE</fc>/$(convert_to $eRateHigh) <fc=#355254>a$thisWeekA</fc>"

echo $str > ~/thisWeekStats.txt
