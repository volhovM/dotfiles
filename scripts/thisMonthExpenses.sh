#!/bin/sh

finFile=~/org/finances.txt

cap=$(grep "%BUDGET%" $finFile | cut -d' ' -f3)

amount=$(ledger -f $finFile b Expenses -X EUR --cost -p "this month" --collapse | tr '\n' ' ' | sed -E "s/Expenses//g;s/ EUR//g" | xargs)
[ -z "$amount" ] && amount="0"
days=$(cal $(date +"%m %Y") | awk 'NF {DAYS = $NF}; END {print DAYS}')
curday=$(date +"%d" | sed 's/^0*//')
leftTotal=$(python -c "print(str(round(($cap - $amount),2)))")
leftPerDay=$(python -c "print(str(round(($leftTotal/($days-$curday+1)), 2)))")
echo "$leftPerDay <fc=#355254>($leftTotal)</fc>"
