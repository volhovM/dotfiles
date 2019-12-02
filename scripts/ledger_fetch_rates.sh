#!/usr/bin/env bash

# From https://www.convalesco.org/articles/2016/11/01/fetching-ledger-exchange-rates.html

set -e

prices_db="/home/volhovm/org/prices.db"
exchange_currencies=(GBP RUB HRK USD SGD KRW JPY CHF UAH)

all_currencies=$(curl -s http://data.fixer.io/latest\?access_key=$(cat ~/.fixerapikey))

echo "" >> "$prices_db"
for i in "${exchange_currencies[@]}"; do
  date=$(date "+%Y/%m/%d %H:%M:%S")
  rate=$(echo $all_currencies | jq .rates."$i")
  msg=$(echo "P $date EUR ${rate} ${i}")
  echo $msg
  echo $msg >> "$prices_db"
done
