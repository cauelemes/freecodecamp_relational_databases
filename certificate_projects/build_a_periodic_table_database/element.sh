#! /bin/bash

# For the queries we shall make
PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align --tuples-only -c"

# if no argument provided
if [[ -z $1 ]]
then
	echo "Please provide an element as an argument."

else
  # use first argument to search in DB

  # if argument is the atomic number
  if [[ "$1" =~ ^[0-9]*$ ]] 
  then
    ATOMIC_NUMBER=$1
    
    IFS="|" read TYPE_ID ATOMIC_NUMBER SYMBOL NAME ATOMIC_MASS MELTING_POINT BOILING_POINT TYPE <<< "$($PSQL "SELECT * FROM elements JOIN properties USING(atomic_number) JOIN types USING(type_id) WHERE atomic_number=$ATOMIC_NUMBER;")"

    echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."

    # if argument is the element's symbol (2 chars max)
    else if [[ "$1" =~ ^.$ || "$1" =~ ^..$  ]] 
    then
      SYMBOL=$1

      IFS="|" read TYPE_ID ATOMIC_NUMBER SYMBOL NAME ATOMIC_MASS MELTING_POINT BOILING_POINT TYPE <<< "$($PSQL "SELECT * FROM elements JOIN properties USING(atomic_number) JOIN types USING(type_id) WHERE symbol='$SYMBOL';")"

      echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."

    # if argument is either the element's name or not present in our DB
    else 
      NAME=$1

      IFS="|" read TYPE_ID ATOMIC_NUMBER SYMBOL NAME ATOMIC_MASS MELTING_POINT BOILING_POINT TYPE <<< "$($PSQL "SELECT * FROM elements JOIN properties USING(atomic_number) JOIN types USING(type_id) WHERE name='$NAME';")"

      # if no result from query (element not present in DB)
      if [[ -z $TYPE_ID ]]
      then
        echo "I could not find that element in the database."

        # if argument is the element's name
        else
          echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
      fi
    fi
  fi
fi


