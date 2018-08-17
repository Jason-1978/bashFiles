#!/bin/bash

# This is just for fun.

name="${USER}"
name="$(tr '[:lower:]' '[:upper:]' <<< ${name:0:1})${name:1}"
answer=" "

echo "Hello, $name"

while [ "$answer" != "good" ] && [ "$answer" != "great" ] && [ "$answer" != "awesome" ] && [ "$answer" != "bad" ] && [ "$answer" != "horrible" ]; do
	echo "How was your day?"
	read -p "Good or bad: " answer

	answer=$(echo $answer | tr '[:upper:]' '[:lower:]')

	if [ "$answer" == "good" ] || [ "$answer" == "great" ] || [ "$answer" == "awesome" ]; then
		echo "That's great! I hope everything keeps going good for you!"
	elif [ "$answer" == "bad" ] || [ "$answer" == "horrible" ]; then
		echo "That's too bad. I hope that things change for you."
	else
		echo "I'm sorry. I don't understand your answer."
	fi
done
