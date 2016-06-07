#!/bin/bash
minNum=1
maxNum=100

function rollDie() {
	rNum=$((RANDOM%$maxNum+$minNum))
	return $rNum
}

function rollsPrompt() {
	echo "How many rolls? (randomRange: $minNum - $maxNum)"
	read rolls
	while ! [[ $rolls =~ ^[0-9]+$ ]] ;do
		echo "Enter an integer, smartass"
		read rolls
	done;	
}

rollsPrompt

x=1
doubleCount=0
while [ $x -le $rolls ];do
	echo "Roll number $x"
	rollDie
	die1=$?
	rollDie
	die2=$?
	echo "Dice 1 : $die1"
	echo "Dice 2 : $die2"
	if [ $die1 -eq $die2 ];then
		doubleCount=$(($doubleCount + 1))
		echo "Collision! Doubles ocurred. doubleCount: $doubleCount"
	fi
	x=$(($x+1))
done

echo "Complete rolls summary:"
echo "-----------------------"
echo "number of rolls: $rolls"
echo "dice Range: $minNum - $maxNum"
echo "number of doubles: $doubleCount ($doubleCount/$rolls)"
