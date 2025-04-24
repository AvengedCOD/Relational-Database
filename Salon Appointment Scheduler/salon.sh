#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=salon -t -c"

MAIN_MENU() {
  echo -e "\n~~~~~ Salon ~~~~~"
  if [[ $1 ]]
  then 
  echo -e "\n$1"
  fi
  echo -e "\nWhich serive can I interest you in?"
  echo $($PSQL "SELECT * FROM services ORDER BY service_id") | sed 's/ |/)/g; s/[0-9]/\n&/g' ; echo
  read SERVICE_ID_SELECTED
  case $SERVICE_ID_SELECTED in
    1) SERVICE "$SERVICE_ID_SELECTED" ;;
    2) SERVICE "$SERVICE_ID_SELECTED" ;;
    3) SERVICE "$SERVICE_ID_SELECTED" ;;
    4) SERVICE "$SERVICE_ID_SELECTED" ;;
    5) SERVICE "$SERVICE_ID_SELECTED" ;;
    *) MAIN_MENU "Please enter a valid service." ;;
  esac
}

SERVICE() {
  echo -e "\nWhats a good phone number? ex. 555-555-5555"
  read CUSTOMER_PHONE
  CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")
  if [[ -z $CUSTOMER_NAME ]]
  then
    echo -e "\nWhat name should I put down?"
    read CUSTOMER_NAME
    INSERT_NEW_CUSTOMER=$($PSQL "INSERT INTO customers (phone, name) VALUES ('$CUSTOMER_PHONE', '$CUSTOMER_NAME')")
  fi
  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")
  echo -e "\nWhat time should we expect you for your appointment?"
  read SERVICE_TIME
  INSERT_NEW_APPOINTMENT=$($PSQL "INSERT INTO appointments (customer_id, service_id, time) VALUES ($CUSTOMER_ID, $1, '$SERVICE_TIME')")
  SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id = $1")
  NO_WS_SERVICE_NAME=$(echo $SERVICE_NAME | sed 's/^ */ *$/')
  FORMATTED_SERVICE_NAME="${NO_WS_SERVICE_NAME,,}"
  FORMATTED_CUSTOMER_NAME=$(echo $CUSTOMER_NAME | sed 's/^ */ *$/')
  echo -e "\nI have put you down for a $FORMATTED_SERVICE_NAME at $SERVICE_TIME, $FORMATTED_CUSTOMER_NAME."
}

MAIN_MENU