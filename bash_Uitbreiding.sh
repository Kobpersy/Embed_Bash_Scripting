#!/bin/bash

random=$((1 + RANDOM % 10))
datelog=$(date)
green="\033[32;40m"
red="\033[31;40m"

numbOfGuesses=1

read -p "What's your name? " username
echo $green"Welcome $red$username$green, try to guess$red a random number out of 10"

while [ $numbOfGuesses -le 3 ]; do
    echo $green'Current number of guesses ='$numbOfGuesses
    read -p "Your guess: " yourGuess

    if [ $yourGuess -eq $random ]; then
        echo $green"Your answer is correct! The random number was:" $random
	success=TRUE
        break;
    else
        if [ $yourGuess -lt $random ]; then
            echo $green"The random number is higher";
        elif [ $yourGuess -gt $random ]; then
            echo $green"The random number is lower";
        fi
    fi
    numbOfGuesses=$((numbOfGuesses+1))
done

if [ $yourGuess -ne $random ]; then
    echo $green"Bad luck! No more tries left. Better luck next time!"
    success=FALSE
fi

if [ $numbOfGuesses -eq 4 ]; then 
    numbOfGuesses=$((numbOfGuesses-1)); 
fi;

echo "user try:" >> ./scores.txt
echo "Name: $username" >> ./scores.txt
echo "Date: $datelog" >> ./scores.txt
echo "Player succes? $success" >> ./scores.txt
echo "Number of used guesses: $numbOfGuesses" >> ./scores.txt
echo " " >> ./scores.txt
