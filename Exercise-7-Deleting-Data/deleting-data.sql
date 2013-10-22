/* How can we delete data that we don't want? The delete statement!
 *
 * Fulfills the Delete spec for CRUD operations
 * This script assumes we're already using 'learn_sql_the_hard_way'
 * mysql> SOURCE ~/code/Learn-SQL-The-Hard-Way/Exercise-7-Deleting-Data/deleting-data.sql 
 */

/* make sure there's dead pets */
SELECT name, age FROM pet WHERE dead = 1;

/* aww poor robot */
DELETE FROM pet WHERE dead = 1;

/* make sure the robot is gone */
SELECT * FROM pet;

/* let's resurrect the robot */
INSERT INTO pet VALUES (1, "Gigantor", "Robot", 1, 0);

/* the robot LIVES! */
SELECT * FROM pet;
