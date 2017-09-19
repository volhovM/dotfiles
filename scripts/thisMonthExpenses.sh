#!/bin/sh
ledger -f ~/org/finances.dat b Expenses -p "this month" --collapse | tr '\n' ' ' | sed -E "s/Expenses//g" | xargs
