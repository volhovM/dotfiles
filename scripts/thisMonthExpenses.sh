#!/bin/sh

finFile=~/org/finances.txt
priceDb=~/org/prices.db

cap=$(grep "%UNBUDGETED%" $finFile | cut -d' ' -f3)

spent=$(ledger -f $finFile --price-db $priceDb b Expenses -X GBP --unbudgeted --cost -p "this month" --collapse | tr '\n' ' ' | sed -E "s/Expenses//g;s/ GBP//g" | xargs)
leftTotal=$(python -c "print(str(round($cap - 0$spent,2)))")
[ -z "$amount" ] && amount="0"
days=$(cal $(date +"%m %Y") | awk 'NF {DAYS = $NF}; END {print DAYS}')
curday=$(date +"%d" | sed 's/^0*//')
leftPerDay=$(python -c "print(str(round(($leftTotal/($days-$curday+1)), 2)))")
echo "$leftPerDay <fc=#355254>($leftTotal)</fc>"
