#!/usr/bin/env bash

# From https://www.convalesco.org/articles/2016/11/01/fetching-ledger-exchange-rates.html

base_currency=GBP
exchange_currencies=(EUR RUB HRK USD SGD KRW JPY CHF)
prices_db="/home/volhovm/org/prices.db"

# Fetch today's currency exchange rates from Fixer.io
fetch_data() {
  local -r base=$1 currency=$2
  curl -s https://api.exchangeratesapi.io/latest\?base=$base_currency | jq .rates."$currency"
}

echo "" >> "$prices_db"
for i in "${exchange_currencies[@]}"; do
  date=$(date "+%Y/%m/%d %H:%M:%S")
  rate=$(fetch_data $base_currency "${i}")
  echo "P $date $base_currency ${rate} ${i}"
  echo "P $date $base_currency ${rate} ${i}" >> "$prices_db"
done
