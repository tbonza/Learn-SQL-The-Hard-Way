/* Who owns what pets? That information deals with relations.
 * Let's insert that info
 *
 * How this works is I'm using the id values from the person row I want
 * (in this case, 0) and the id from the pet rows I want (again, 0 for the
 * Unicorn and 1 for the Dead Robot). I then insert one row into person_pet
 * relation table for each "connection" between a person and a pet.
 *
 * Fulfills the Create spec for CRUD operations
 * This script assumes we're already using 'learn_sql_the_hard_way'
 * mysql> SOURCE ~/code/Learn-SQL-The-Hard-Way/Exercise-4-Insert-Referential-Data/insert-referential.sql
 */

-- Zed Shaw owns Fluffy the Unicorn & Gigantor the Robot
INSERT INTO person_pet (person_id, pet_id) VALUES (0, 0);
INSERT INTO person_pet VALUES (0, 1);

-- Tyler Brown owns Murphy the Yellow lab
INSERT INTO person_pet (person_id, pet_id) VALUES (2, 2);
