#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

CSVPATH="games.csv"
WINNERS=$(awk -F ',' 'NR>1{print $3}' $CSVPATH | sort | uniq)
OPPONENTS=$(awk -F ',' 'NR>1{print $4}' $CSVPATH | sort | uniq)
ALLTEAMS=$(echo "$WINNERS"$'\n'"$OPPONENTS" | sort | uniq)

OLDIFS=$IFS
IFS=$'\n'
for teamname in $ALLTEAMS
do
  IFS=$OLDIFS
  echo $($PSQL "INSERT INTO teams(name) VALUES('$teamname')")
  # echo $(psql --username=freecodecamp --dbname=worldcup -t --no-align -c "SELECT * FROM teams;")
  # echo "$($PSQL "INSERT INTO teams(name) VALUES('$teamname')")"
done

# Games table
# First make a stage from csv files.
echo $($PSQL "DROP TABLE IF EXISTS games_stg")
echo $($PSQL "CREATE TABLE games_stg (
  game_id SERIAL PRIMARY KEY NOT NULL,
  year INT NOT NULL,
  round VARCHAR NOT NULL,
  winner VARCHAR NOT NULL,
  opponent VARCHAR NOT NULL,
  winner_goals INT NOT NULL,
  opponent_goals INT NOT NULL);" )
echo $($PSQL "\copy games_stg(year, round, winner, opponent, winner_goals, opponent_goals) FROM '$CSVPATH' DELIMITER ',' CSV HEADER;")

# Truncate destination table
echo $($PSQL "TRUNCATE TABLE games")

# Join teams with ID and insert into games table

echo $($PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals)
SELECT
  year, round, win.team_id AS winner_id, opp.team_id AS opponent_id, winner_goals, opponent_goals
FROM
  games_stg
  INNER JOIN teams win
    ON win.name = games_stg.winner
  INNER JOIN teams opp
    ON opp.name = games_stg.opponent")