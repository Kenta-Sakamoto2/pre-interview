#!/bin/bash

TIMEFORMAT=%R

cd /home/users/sakamo2/pre-interview/cvc5-Linux-x86_64-static/bin
target="/home/users/sakamo2/pre-interview/queries"
touch output.csv
for file in "$target"/*;
do
    echo -n "$(basename "$file"),"
    start=$(date +%s%3N)
    res=$("./cvc5" $file "--tlimit-per=60000" &)
    
    if [ "$res" = "unknown" ]
    then
        echo -n "TIMEOUT,"
    elif [ "$res" = "sat" ]
    then
        echo -n SAT","
    elif [ "$res" = "unsat" ]
    then
        echo -n UNSAT","
    fi
    wait -n
    t=$(date +%s%3N)
    ms=$"(($t-$start))"
    echo "scale=3; ${ms}/1000" | bc
   
done > output.csv
mv output.csv /home/users/sakamo2/pre-interview
cd /home/users/sakamo2/pre-interview/

$SHELL