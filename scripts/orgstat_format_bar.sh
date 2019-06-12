
# converts from a:b to a + b/60
function convert_from {
  IFS=":" read a b <<< $(echo $1)

  # strip leading 0s
  if [ "$a" != "00" ]; then a=$(echo $a | sed 's/^0*//'); fi
  if [ "$b" != "00" ]; then b=$(echo $b | sed 's/^0*//'); fi

  echo $( echo "print ($a + $b/60)" | python )
}

# first 6 arguments are r1g1b1 r2g2b2, 7th and 8th arguments are limits, 9th is value
function avg_col {

  left=$1
  right=$2
  val=$3

  k=$(echo "print(max(0, min(1,($val - $left)/($right - $left))) )" | python)

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

# This is how much I should have achieved up to this day
sRateHigh=$(echo "print (35 * (($daynum if $daynum <= 6 else 6)/6))" | python)
hRateHigh=$(echo "print (20 * ($daynum/7))" | python)
eRateHigh=$(echo "print (20 * ($daynum/7))" | python)

sColor=$(avg_col 0 $sRateHigh $(convert_from $thisWeekStudy) )
hColor=$(avg_col 0 $hRateHigh $(convert_from $thisWeekH) )
thisWeekENum=$(convert_from $thisWeekE)
eColor=$(avg_col 0 $eRateHigh $(python -c "print ($eRateHigh - $thisWeekENum)") )

str="<fc=$sColor>s$thisWeekStudy</fc> <fc=$hColor>h$thisWeekH</fc> <fc=$eColor>e$thisWeekE</fc> <fc=#355254>a$thisWeekA</fc>"

echo $str > ~/thisWeekStats.txt
