/* What's in our tables? Select data from a table given certain conditions.
 *
 * Fulfills the Read spec for CRUD operations
 * This script assumes we're already using 'learn_sql_the_hard_way'
 * mysql> SOURCE ~/code/Learn-SQL-The-Hard-Way/Exercise-5-Selecting-Data/select-statements.sql
 */

-- Select all columns from the person table
SELECT * FROM person;

-- Select only the name & age columns from the pet table
SELECT name, age FROM pet;

-- Select name & age columns from pet table where the pet isn't dead
SELECT name, age FROM pet WHERE dead = 0;

-- Select all columns from the person table where first_name is not "Zed"
SELECT * FROM person WHERE first_name != "Zed";
