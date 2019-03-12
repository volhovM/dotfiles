#!/bin/sh

finFile=~/org/finances.dat

cap=$(grep "%BUDGET%" $finFile | cut -d' ' -f3)

amount=$(ledger -f $finFile b Expenses -X EUR --cost -p "this month" --collapse | tr '\n' ' ' | sed -E "s/Expenses//g;s/ EUR//g" | xargs)
[ -z "$amount" ] && amount="0"
days=$(cal $(date +"%m %Y") | awk 'NF {DAYS = $NF}; END {print DAYS}')
curday=$(date +"%d")
left1=$(python -c "print(str(round(($cap - $amount),2)))")
left2=$(python -c "print(str(round(($left1/($days-$curday)), 2)))")
echo "$left2 <fc=#355254>($left1)</fc>"
