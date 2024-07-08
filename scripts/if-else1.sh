#!/bin/bash


num1=15
num2=17

if [ ${num1} -gt ${num2} ]
then echo "number is ${num1} greater then ${num2}"
elif [ ${num1} -lt ${num2} ]
then echo "number $num1 is less then $num2"
else echo "numer $num1 and $num2 is equal"
fi
