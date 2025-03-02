#!/bin/bash
cd /home/users/sakamo2/pre-interview/cvc5-Linux-x86_64-static/bin
target="/home/users/sakamo2/pre-interview/queries"

for file in "$target"/*;
do 
    "./cvc5" $file "--tlimit-per=60000" &
done

cd /home/users/sakamo2/pre-interview/
$SHELL