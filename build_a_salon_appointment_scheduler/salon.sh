#!/bin/bash


echo -e "\n~~~~~ MY SALON ~~~~~\n"
PSQL="psql -X --username=freecodecamp --dbname=salon -A -t -F"," -c"

# Goes to main menu printing a given message
MAIN_MENU(){
  
  # prints opening message
  if [[ $1 ]]
  then
    echo -e "$1"
  else
    echo -e "Welcome to My Salon, how can I help you?\n"
  fi

  # prints service options
  echo "$($PSQL "SELECT * FROM services;")" | while IFS="," read SERV_ID SERV_NAME
  do
    echo -e "$SERV_ID) $SERV_NAME"
  done

  # gets user service option
  read SERVICE_ID_SELECTED
  
  # if not a valid option (not a number from 1 to 5)
    if [[ ! $SERVICE_ID_SELECTED =~ ^[1-5]$ ]]
    then 
      # restarts main menu with new opening message
      MAIN_MENU "\nI could not find that service. What would you like today?"

    # If the service is valid
    else

      # ask for user's phone
      echo -e "\nWhat's your phone number?"
      read CUSTOMER_PHONE

      # since the name is not null, if the number is regitered, there'd be a name
      CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE';")

        # if phone not in customers table
        if [[ -z $CUSTOMER_NAME ]]
        then
          # ask for user's name
          echo -e "\nI don't have a record for that phone number, what's your name?"
          read CUSTOMER_NAME

          # insert new customer row in customers
          INSERT_CUSTOMER=$($PSQL "INSERT INTO customers(phone, name) VALUES('$CUSTOMER_PHONE', '$CUSTOMER_NAME');")
        fi

        # asks for appointment time (no validity check)
        echo -e "\nWhat time would you like your cut, $CUSTOMER_NAME?"
        read SERVICE_TIME

        # gets customer_id and service name
        CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE';")
        CHOSEN_SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id='$SERVICE_ID_SELECTED';")

        # inserts into appointments table
        APPOINTMENT_INSERT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME');")

        # Successfull appointment schedulling message and terminate
        echo -e "\nI have put you down for a $CHOSEN_SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."

    fi

}



MAIN_MENU


