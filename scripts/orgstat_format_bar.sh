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

function pomodoro_discr {
  echo $(python -c "print(len(list(filter(lambda t: t >= 25, $1))))")
}

function pomodoro_cont {
  echo $(python -c "print(sum(list(map(lambda t: t // 25, $1))))")
}

function pomodoro_rat {
  echo $(python -c 'print("%.1f" % sum(map(lambda t: t / 25, list(filter(lambda t: t >= 25, '$1')))))')
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

# Mean?
#todayMMean=$(python -c "import math; print(math.floor($(convert_from $todayMMean)*60))")
#mMeanColor=$(avg_col 15 25 $todayMMean 0 )
#echo "Focus: $todayMMean"

prevMNum=$( python -c "print($thisWeekMNum - $todayMNum)" )
prevHNum=$( python -c "print($thisWeekHNum - $todayHNum)" )
prevANum=$( python -c "print($thisWeekANum - $todayANum)" )
prevENum=$( python -c "print($thisWeekENum - $todayENum)" )

# How much should have been achieved up to today. Like this:
# mDistr=(1 1 1 1 1 0.5 0)
# mLoad=30
# hDistr=(1 1 1 1 1 1 1 1)
# hLoad=20
# aLoad=25
# eLoad=25

source ~/orgstat_targets.sh

mDistrSum=0
for e in "${mDistr[@]}"; do mDistrSum=$(echo "print($mDistrSum + $e)" | python); done
mCurSum=0
for i in $(seq 0 $((daynum - 1))); do mCurSum=$(echo "print($mCurSum + ${mDistr[$i]})" | python ); done
mRateHigh=$(echo "print ($mLoad * ($mCurSum/$mDistrSum))" | python)

hDistrSum=0
for e in "${hDistr[@]}"; do hDistrSum=$(echo "print($hDistrSum + $e)" | python); done
hCurSum=0
for i in $(seq 0 $((daynum - 1))); do hCurSum=$(echo "print($hCurSum + ${hDistr[$i]})" | python ); done
hRateHigh=$(echo "print ($hLoad * ($hCurSum/$hDistrSum))" | python)

aRateHigh=$(echo "print ($aLoad * ($daynum/7))" | python)
eRateHigh=$(echo "print ($eLoad * ($daynum/7))" | python)

mhRateHigh=$(echo "print ($mRateHigh + $hRateHigh)" | python)
thisWeekMHNum=$(echo "print ($thisWeekHNum + $thisWeekMNum)" | python)

mColor=$(avg_col $prevMNum $mRateHigh $thisWeekMNum 0 )
mhColor=$(avg_col $(echo "print ($prevHNum + $prevMNum)" | python) $mhRateHigh $thisWeekMHNum 0 )
aColor=$(avg_col $prevANum $aRateHigh $thisWeekANum 1 )
eColor=$(avg_col $prevENum $eRateHigh $thisWeekENum 1 )

#str="[<fc=#429942>$(pomodoro_rat $todayMDurationsList)</fc>] <fc=$mColor>m$thisWeekM</fc>/$(convert_to $mRateHigh) <fc=$mhColor>mh$(convert_to $thisWeekMHNum)</fc>/$(convert_to $mhRateHigh) <fc=#429942>|</fc> <fc=$aColor>a$thisWeekA</fc> <fc=$eColor>e$thisWeekE</fc>"
str="[<fc=#429942>$(pomodoro_rat $todayMDurationsList)</fc>] <fc=$mColor>m$thisWeekM</fc>/$(convert_to $mRateHigh)"

echo $str > ~/thisWeekStats.txt
