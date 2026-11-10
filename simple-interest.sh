#!/usr/bin/env bash

read -r -p "Principal amount: " principal || exit 1
read -r -p "Annual interest rate (%): " rate || exit 1
read -r -p "Time period (years): " years || exit 1

decimal='^[0-9]+([.][0-9]+)?$'
if [[ ! $principal =~ $decimal || ! $rate =~ $decimal || ! $years =~ $decimal ]]; then
    printf 'Enter non-negative numbers, using a decimal point if needed.\n' >&2
    exit 1
fi

LC_ALL=C awk -v p="$principal" -v r="$rate" -v t="$years" \
    'BEGIN { printf "Simple interest: %.2f\n", p * r * t / 100 }'
