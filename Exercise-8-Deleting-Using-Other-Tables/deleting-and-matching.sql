/* How can we delete all of the pets? How can we delete  all of the pets
 * belonging to a certain person?
 *
 * "DELETE is like SELECT but it removes rows from the table." The
 * limitation is you can only delete from one table at a time
 *
 * Fulfills the Delete spec for CRUD operations
 * This script assumes we're already using 'learn_sql_the_hard_way'
 * mysql> SOURCE ~/code/Learn-SQL-The-Hard-Way/Exercise-8-Deleting-Using-Other-Tables/deleting-and-matching.sql
 */

/* Ok, let's walk through these queries */

-- Delete all rows from the "pet" table that achieve some matching conditions
--DELETE FROM pet WHERE id IN (
    -- Here's the matching conditions
    -- The id from "pet" 
    --SELECT pet.id
    --FROM pet, person_pet, person
    --WHERE
    -- We use the "person_pet" relations table to delete all pets that
    -- belong to "Zed"
    --person.id = person_pet.person_id AND
    --pet.id = person_pet.pet_id AND
    --person.first_name = "Zed"
--);

/* The SQLite implementation in the book doesn't work for MySQL
 * Explanation (http://stackoverflow.com/questions/45494/
 *		mysql-error-1093-cant-specify-target-table-for-update-in
 *		-from-clause)
 *
 * Instead, I decided that an id in the pet table would always match
 * the person_pet.pet_id as long as we agree to make a rule about
 * not deleting one without deleting the other. We can see that in the
 * delete statement following the one I'm using that person_pet rows
 * are deleted where pet.id is not present. As long as this sequence
 * always occurs then we can get away with the altered SQL statement
 */
 
DELETE FROM pet WHERE id IN (
    SELECT person_pet.pet_id
    FROM person_pet, person
    WHERE
    person.id = person_pet.person_id AND
    person.first_name = "Zed"

-- Checking out the remaining pets. Where'd Zed's pets go?
SELECT * FROM pet;
-- Demonstrating the relationship between Zed's pets and the "person_pet"
-- relations.
SELECT * FROM person_pet;

-- Here we're thinking ok, we don't need to track Zed's pets anymore
-- since they've been deleted from "pet"
DELETE FROM person_pet
    WHERE pet_id NOT IN (
        SELECT id FROM pet
    );

-- Shows how the relations for Zed's pets have been deleted
SELECT * FROM person_pet;
