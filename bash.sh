#!/bin/bash

random=$((1+RANDOM % 10))

green="\033[32;40m"
numbOfGuesses=1

echo $green"Welcome, try to guess a random number out of 10"

while [ $numbOfGuesses -le 3 ]; do
    echo $green'Current number of guesses ='$numbOfGuesses
    read -p "Your guess: " yourGuess

    if [ $yourGuess -eq $random ]; then
        echo $green"Your answer is correct! The random number was:" $random
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
fi

