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

  if [ "$2" == "1" ]; then a=$(printf '%01d' $a0); fi

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
thisWeekANum=$(convert_from $thisWeekA)
thisWeekENum=$(convert_from $thisWeekE)

todayMNum=$(convert_from $todayM)
todayHNum=$(convert_from $todayH)
todayANum=$(convert_from $todayA)
todayENum=$(convert_from $todayE)

prevMNum=$( python -c "print($thisWeekMNum - $todayMNum)" )
prevHNum=$( python -c "print($thisWeekHNum - $todayHNum)" )
prevANum=$( python -c "print($thisWeekANum - $todayANum)" )
prevENum=$( python -c "print($thisWeekENum - $todayENum)" )

echo $prevMNum
echo $prevHNum
echo $prevANum
echo $prevENum

# This is how much I should have achieved up to this day
mD=5
mRateHigh=$(echo "print (30 * (($daynum if $daynum <= $mD else $mD)/$mD))" | python)
hRateHigh=$(echo "print (20 * ($daynum/7))" | python)
aRateHigh=$(echo "print (30 * ($daynum/7))" | python)
eRateHigh=$(echo "print (20 * ($daynum/7))" | python)

echo $mRateHigh
echo $hRateHigh
echo $aRateHigh
echo $eRateHigh

mColor=$(avg_col $prevMNum $mRateHigh $thisWeekMNum 0 )
hColor=$(avg_col $prevHNum $hRateHigh $thisWeekHNum 0 )
aColor=$(avg_col $prevANum $aRateHigh $thisWeekANum 1 )
eColor=$(avg_col $prevENum $eRateHigh $thisWeekENum 1 )

str="<fc=$mColor>u$thisWeekM</fc>/$(convert_to $mRateHigh) <fc=$hColor>h$thisWeekH</fc>/$(convert_to $hRateHigh) <fc=#429942>|</fc> <fc=$aColor>a$(convert_to $todayANum 1)</fc> <fc=$eColor>e$(convert_to $todayENum 1)</fc>"

echo $str > ~/thisWeekStats.txt
