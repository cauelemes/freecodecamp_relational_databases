#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

# Starts by emptying whatever data was already inserted
TRUNCATION_RESULT=$($PSQL "TRUNCATE TABLE games, teams RESTART IDENTITY;")



cat games.csv | while IFS=',' read  YEAR ROUND WINNER OPPONENT WIN_GOALS OPP_GOALS
do
  # skips titles line
  if [[ $YEAR != 'year' ]]
  then

    # echo -e "\n $YEAR $ROUND $WINNER $OPPONENT $WIN_GOALS $OPP_GOALS" # (*)

    # 1. ADDING ROWS TO teams TABLE
    # echo -e "WINER: $WINNER \nOPPONENT: $OPPONENT" # (*)

    # Checks wether winner team's name is already in the table
    WINNER_NAME_IN_TABLE=$($PSQL "SELECT name FROM teams WHERE name='$WINNER';")

    # If no team with this name,
    if [[ -z $WINNER_NAME_IN_TABLE ]]
    then
      # insert it into the table
      WINNER_NAME_INSERTION=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER');")
      # echo "$WINNER_NAME_INSERTION" # (*)
    fi

    # Checks wether opponent team's name is already in the table
    OPP_NAME_IN_TABLE=$($PSQL "SELECT name FROM teams WHERE name='$OPPONENT';")

    # If no team with this name,
    if [[ -z $OPP_NAME_IN_TABLE ]]
    then
      # insert it into the table
      OPP_NAME_INSERTION=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT');")
      # echo "$OPP_NAME_INSERTION" # (*) 
    fi


    # 2. ADDING ROWS TO games TABLE
    # (**) There might be a more direct efficient way of doing this, but let's
    # start the simple way

    # Finds winner_id by team name (unique)
    WINNER_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER';")

    # Finds opponent_id by team name (unique)
    OPPONENT_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT';")

    # both ids are certainly found, sice we already inserted all teams

    # echo -e "(WINNER_ID = $WINNER_ID), (OPPONENT_ID = $OPPONENT_ID)" # (*)


    # Inserts game (we are considering the csv doesn't have any repetitions, since if it
    # didn't, we would need composite candidate key with more than game_id).
    GAME_INSERTION=$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES($YEAR, '$ROUND', $WINNER_ID, $OPPONENT_ID, $WIN_GOALS, $OPP_GOALS);")
    # echo "Game insertion: $GAME_INSERTION" # (*)  

  fi
  
done



# Adding rows to games table