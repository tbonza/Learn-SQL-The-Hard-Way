/* Change all pets owned by Zed to be named "Zed's pet"
 *
 * Fulfills the Update spec for CRUD operations
 * This script assumes we're already using learn_sql_the_hard_way
 *
 * Going to modify this one a bit because we previously named Zed
 * "Hilarious Guy". Also, the UPDATE query as given throws an error
 * in MySQL
 *
 * mysql> SOURCE ~/code/Learn-SQL-The-Hard-Way/Exercise-10-Updating-Complex-Data/update-complex.sql
 */

-- Select all columns from the "pet" table
SELECT * FROM pet;

-- Update any Pet owned by Zed to "Zed's pet"

--UPDATE pet SET name = "Zed's Pet" WHERE id IN (
--    SELECT pet.id
--    FROM pet, person_pet, person
--    WHERE
--    person.id = person_pet.person_id AND
--    pet.id = person_pet.pet_id AND
--    person.first_name = "Zed"
--);

/* The preceding sqlite3 query generates the following error:
 * ERROR 1093 (HY000): You can't specify target table 'pet' for update
 * in FROM clause
 *
 * Let's revise. 
 */

UPDATE pet
       SET name = "Zeds Pet"
       WHERE id IN (
       SELECT person_pet.pet_id
       FROM person_pet, person
       WHERE
       person_pet.person_id = person.id AND
       person.first_name = "Hilarious Guy"
);

-- Verify that the "Zed's pet" update occured
SELECT * FROM pet;
