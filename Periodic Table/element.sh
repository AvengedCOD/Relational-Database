PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"
if [[ -z $1 ]]
then
  echo "Please provide an element as an argument."
  exit
fi

ELEMENT=$($PSQL "SELECT * FROM elements WHERE symbol='$1' OR name='$1' OR atomic_number::text='$1';")
if [[ -z $ELEMENT ]]
then
  echo "I could not find that element in the database."
  exit
else
  IFS="|" read ATOMIC_NUMBER SYMBOL NAME <<< "$ELEMENT"
  PROPERTIES=$($PSQL "SELECT t.type, p.atomic_mass, p.melting_point_celsius, p.boiling_point_celsius FROM properties p JOIN types t ON p.type_id = t.type_id WHERE atomic_number = $ATOMIC_NUMBER;")
  IFS="|" read TYPE MASS MELT BOIL <<< "$PROPERTIES"
  echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $MASS amu. $NAME has a melting point of $MELT celsius and a boiling point of $BOIL celsius."
  exit
fi
