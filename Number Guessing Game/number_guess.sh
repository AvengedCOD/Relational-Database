#!/bin/bash

# PSQL variable
PSQL="psql --username=freecodecamp --dbname=users -t --no-align -c"

# Generate random number
RANDOM_MIN=1
RANDOM_MAX=1000
SECRET_NUMBER=$((RANDOM % (RANDOM_MAX - RANDOM_MIN + 1) + RANDOM_MIN))

# Get user data
echo "Enter your username:"
read USERNAME

USER_DATA=$($PSQL "SELECT username, games_played, best_game FROM user_data WHERE username='$USERNAME';")
IFS="|" read DB_USERNAME GAMES_PLAYED BEST_GAME <<< "$USER_DATA"

# Check if user exists
if [[ -z $DB_USERNAME ]]
then
  # Create new user
  INSERT_USER=$($PSQL "INSERT INTO user_data(username, games_played, best_game) VALUES('$USERNAME', 0, 0);")
  echo "Welcome, $USERNAME! It looks like this is your first time here."
  GAMES_PLAYED=0
  BEST_GAME=0
else
  # Welcome back message
  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

echo "Guess the secret number between 1 and 1000:"

# Game variables
NUMBER_OF_GUESSES=0

# Game loop
while true
do
  read GUESS
  
  # Increment guess counter
  NUMBER_OF_GUESSES=$((NUMBER_OF_GUESSES + 1))
  
  # Check if input is an integer
  if ! [[ $GUESS =~ ^[0-9]+$ ]]
  then
    echo "That is not an integer, guess again:"
    continue
  fi
  
  # Compare guess with secret number
  if [[ $GUESS -gt $SECRET_NUMBER ]]
  then
    echo "It's lower than that, guess again:"
  elif [[ $GUESS -lt $SECRET_NUMBER ]]
  then
    echo "It's higher than that, guess again:"
  else
    # Correct guess
    echo "You guessed it in $NUMBER_OF_GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!"
    
    # Update games played
    GAMES_PLAYED=$((GAMES_PLAYED + 1))
    
    # Update best game if this is better or first game
    if [[ $BEST_GAME -eq 0 || $NUMBER_OF_GUESSES -lt $BEST_GAME ]]
    then
      UPDATE_USER=$($PSQL "UPDATE user_data SET games_played=$GAMES_PLAYED, best_game=$NUMBER_OF_GUESSES WHERE username='$USERNAME';")
    else
      UPDATE_USER=$($PSQL "UPDATE user_data SET games_played=$GAMES_PLAYED WHERE username='$USERNAME';")
    fi
    
    break
  fi
done
