
# TODO this is not finished, as this script called from orgstat doesn't see python

# converts from a:b to a + b/60
function convert_from {
  IFS=":" read a b <<< $(echo $1)

  echo $( echo "print ($a + $b/60)" | python )
}

# first 6 arguments are r1g1b1 r2g2b2, 7th and 8th arguments are limits, 9th is value
function avg_col {

  left=$7
  right=$8
  val=$(convert_from $9)

  k=$(echo "print( ($val - $left)/($right - $left) ) if $val <= $right else print(1)" | python)

  r=$(echo "import math; print (math.floor($1 + $k*($4 - $1)))" | python)
  g=$(echo "import math; print (math.floor($2 + $k*($5 - $2)))" | python)
  b=$(echo "import math; print (math.floor($3 + $k*($6 - $3)))" | python)

  r=$(printf '%02x' $r)
  g=$(printf '%02x' $g)
  b=$(printf '%02x' $b)

  col="#$r$g$b"

  echo $col
}

daynum=$(date +%u)

# This is how much I should have achieved up to this day
sRateHigh=$(echo "print (40 * ($daynum/7))" | python)
hRateHigh=$(echo "print (20 * ($daynum/7))" | python)
eRateHigh=$(echo "print (20 * ($daynum/7))" | python)

sColor=$(avg_col 255 0 0 0 255 0 0 $sRateHigh $thisWeekStudy)
hColor=$(avg_col 255 0 0 0 255 0 0 $hRateHigh $thisWeekH)
eColor=$(avg_col 0 255 0 255 0 0 0 $eRateHigh $thisWeekE)

str="<fc=$sColor>s$thisWeekStudy</fc> <fc=$hColor>h$thisWeekH</fc> <fc=$eColor>e$thisWeekE</fc> <fc=#355254>a$thisWeekA</fc>"

echo $str > ~/thisWeekStats.txt
