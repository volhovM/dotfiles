
# TODO this is not finished, as this script called from orgstat doesn't see python

# first 6 arguments are r1g1b1 r2g2b2, 7th and 8th arguments are limits, 9th is value
function avg_col {

  left=$7
  right=$8
  val=$9

  k=$(echo "print( ($val - $left)/($right - $left) ) if $val <= $right else print(1)" | python)

  bc <<< 20/7

  echo $k1
  echo $k2

  r=$(echo "import math; print (math.floor($1 + $k*($4 - $1)))" | python)
  g=$(echo "import math; print (math.floor($2 + $k*($5 - $2)))" | python)
  b=$(echo "import math; print (math.floor($3 + $k*($6 - $3)))" | python)

  echo $r
  echo $g
  echo $b


  r=$(printf '%02x' $r)
  g=$(printf '%02x' $g)
  b=$(printf '%02x' $b)

  col="#$r$g$b"

  echo $col
}

daynum=$(date +%u)


sColor=$(avg_col 255 0 0 255 255 0 0 40 $thisWeekStudy)
hColor=$(avg_col 255 0 0 255 255 0 0 20 $thisWeekH)
eColor=$(avg_col 0 255 0 255 0 0 0 20 $thisWeekE)

str="<fc=$sColor>s$thisWeekStudy</fc> <fc=$hColor>h$thisWeekH</fc> <fc=$eColor>e$thisWeekE</fc> <fc=#355254>a$thisWeekA</fc>"

echo $str > ~/thisWeekStats.txt
