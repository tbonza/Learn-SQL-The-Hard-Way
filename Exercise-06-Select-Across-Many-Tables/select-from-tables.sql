/* What pets does Zed own? We need to check multiple tables to figure this
 * out.
 *
 * Fulfills the Read spec for CRUD operations
 * This script assumes we're already using 'learn_sql_the_hard_way'
 * mysql> SOURCE ~/code/Learn-SQL-The-Hard-Way/Exercise-6-Select-Across-Many-Tables/select-from-tables.sql
 */

/*  Let's use comments to walk through this statment */
-- Dot notation allows us to select a column from a table like using the
-- name column from the pet table with "pet.name"
SELECT pet.id, pet.name, pet.age, pet.dead
    -- Here we're selecting 3 tables to get info
    FROM pet, person_pet, person
    -- Where clause means 'make sure the data meets these conditions'
    WHERE
    -- Match the id from "pet" table with id from "person_pet" table
    pet.id = person_pet.pet_id AND
    -- Match "person_pet" id with "person" id
    person_pet.person_id = person.id AND
    -- Make sure the first_name column in "person" is "Zed"
    person.first_name = "Zed";
