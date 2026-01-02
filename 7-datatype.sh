#!/bin/bash

#everything in shell is considered as string.   there is no datatypes in shell

NUMBER1=100
NUMBER2=200
NAME=DEVOPS

SUM=$(($NUMBER1+$NUMBER2+$NAME))

echo "SUM is : ${SUM}"

LEADERS=("MODI" "PUTIN" "TRUMP" "SK")

echo "All leaders: ${LEADERS[*]}"
echo "first leader: ${LEADERS[0]}"
echo "third leader: ${LEADERS[2]}"
