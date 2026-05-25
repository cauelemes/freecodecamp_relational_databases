#!/bin/bash

# For PostgreSQL Querries
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

# -----------------------------------------------------------------------------------#
# -------------------------------#
# GETTING OR ASSERTING USER INFO #
# -------------------------------#
echo "Enter your username: "
read GIVEN_USERNAME

# Search DB for user data
GET_USER=$($PSQL "SELECT * FROM users WHERE username='$GIVEN_USERNAME'")
IFS="|" read USER_ID USERNAME GAMES_PLAYED BEST_GAME <<< "$GET_USER"
# echo "$USER_ID $USERNAME $GAMES_PLAYED $BEST_GAME" (*) 

# if user NOT in DB yet
if [[ -z $GET_USER ]]
then
  USERNAME=$GIVEN_USERNAME
  echo "Welcome, $USERNAME! It looks like this is your first time here."

  # insert new user's data
  INSERT_USER=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME');")

# If user in DB
else
  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi  

# -----------------------------------------------------------------------------------#
# -----------#
# GAME START #
# -----------#
# Generate random number beteween 1 and 1000
SECRET_NUM=$(( $RANDOM % 1000 + 1 ))

echo "Guess the secret number between 1 and 1000:"
read GUESS_NUM
# We don't allow continuity untill it's a valid number
while [[ ! $GUESS_NUM =~ ^[0-9]*$ ]]
do
  echo "That is not an integer, guess again:"
  read GUESS_NUM
done
TRIES=1
while (( $GUESS_NUM != $SECRET_NUM ))
do
    
  # If it is an integer
  if (( $SECRET_NUM < $GUESS_NUM ))
  then
    echo "It's lower than that, guess again:"
  fi 
  if (( $SECRET_NUM > $GUESS_NUM ))
  then
    echo "It's higher than that, guess again:"
  fi 

  read GUESS_NUM
  
  # We don't allow continuity untill it's a valid number
  while [[ ! $GUESS_NUM =~ ^[0-9]+$ ]]
  do
    echo "That is not an integer, guess again:"
    read GUESS_NUM
  done

  # We only count valid tries
  TRIES=$(( $TRIES+1 ))

done

echo You guessed it in $TRIES tries. The secret number was $SECRET_NUM. Nice job!


# -----------------------------------------------------------------------------------#
# -------------------------------#
# UPDATING DATABASE WITH RESULTS #
# -------------------------------#

GET_USER=$($PSQL "SELECT user_id, games_played, best_game FROM users WHERE username='$USERNAME';")
IFS="|" read USER_ID GAMES_PLAYED BEST_GAME <<< "$GET_USER"

# update best_games
if (( $TRIES < $BEST_GAME ))
then
  BEST_GAME=$TRIES
fi
GAMES_PLAYED=$(( $GAMES_PLAYED+1 ))

#updating table in DB
UPDATE_DB=$($PSQL "UPDATE users SET games_played=$GAMES_PLAYED, best_game = $BEST_GAME WHERE username='$USERNAME';")






