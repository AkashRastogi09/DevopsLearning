#!/bin/bash



echo please enter your age
read age

if [ $age -ge 18 ]
then 
	echo "you are adult"
else
	echo "you are minor"
fi
