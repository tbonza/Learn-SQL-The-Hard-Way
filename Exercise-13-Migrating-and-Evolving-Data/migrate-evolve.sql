/* Make a series of changes to the MySQL database.
 *
 * Fulfills the Read & Update spec for CRUD operations
 * This script assumes we're already using learn_sql_the_hard_way
 *
 * mysql> SOURCE ~/code/Learn-SQL-The-Hard-Way/Exercise-13-Migrating-and-Evolving-Data/migrate-evolve.sql
 */

/* Add a dead column to person that's like the one in pet. */
ALTER TABLE person ADD COLUMN dead INTEGER;

/* Add a phone_number column to person. */
ALTER TABLE person ADD COLUMN phone_number CHAR;

/* Add a salary column to person that is float. */
ALTER TABLE person ADD COLUMN salary FLOAT;

/* Add a dob column to both person and pet that is a DATETIME. */
ALTER TABLE person ADD COLUMN dob DATE;
ALTER TABLE pet ADD COLUMN dob DATE;

/* Add a purchased_on column to person_pet of type DATETIME. */
ALTER TABLE person_pet ADD COLUMN purchased_on DATE;

/* Add a parent to pet column that's an INTEGER and holds the id for
 * this pet's parent. */
ALTER TABLE pet ADD COLUMN parent INT;

/* Update the existing database records with the new column data using
 * UPDATE statements. Don't forget about the purchased_on column in
 * person_pet relation table to indicate when that person bought the pet. */

-- Update the parent column in "pet" with each owners id from "person"
UPDATE pet
SET parent = person.id
FROM person_pet
INNER JOIN person ON
person.id = person_pet.id;

-- Update the new columns for "person"
INSERT INTO person SET
    dead = 0,
    CASE phone_number
        WHEN person.id = 0 THEN "867-5309"
	WHEN person.id = 1 THEN "555-9021"
	WHEN person.id = 2 THEN "321-3097"
	WHEN person.id = 3 THEN "332-1826"
	ELSE "missing"
    END
    CASE salary
        WHEN person.id <= 1 THEN 45000.00
	WHEN person.id > 1 THEN 65000.00
	ELSE 0
    END
    dob = 2/2/88;
    
-- Update the new columns for "pet"
UPDATE pet
    INNER JOIN
    pet.id = person_pet.pet_id
    AND person.id = person_pet.person_id
SET
    pet.dob = person.dob;
    
-- Update the new columns for "person_pet"
UPDATE person_pet
SET purchased_on = 3/19/2011; 

/* Add 4 more people and 5 more pets and assign their ownership and what
 * pet's are parents. On this last part remember that you get the id of
 * the parent, then set it in the parent column. */

-- 4 more people
INSERT INTO person
(id, first_name, last_name, age, dead, phone_number, salary, dob)
VALUES
    (4, "Rufus", "Mova", 21, 0, 123-4567, 25000.00, 4/4/1992),
    (5, "Brutus", "Opah", 22, 0, 567-1234, 25000.00, 4/5/1991),
    (6, "Wheatus", "TheBand", 34, 1, 434-0595, 100000.00, 4/2/1991),
    (7, "Jolene", "Mean", 26, 0, 900-0904, 23000.00, 4/6,1987);

-- 5 more pets
INSERT INTO pet
(id, name, breed, age, dead, dob, parent)
VALUES
    (3, "Dirka", "Dragon", 4000, 0, 1/1/1901, "Jezebel"),
    (4, "Quirka", "Wagon", 4, 0, 2/2/2009, "Dirka"),
    (5, "Jose", "Cat", 5, 0, 2/6/2008, "Monty"),
    (6, "Monty", "Python", 6, 2/14/2007, "Holly"),
    (7, "Holly", "Grasshopper", 3, 2/20/2010, "Monty");
 
-- Assign values to person_pet
INSERT INTO person_pet
(person_id, pet_id, purchased_on)
VALUES
    (4,3,10/22/2013),
    (5,4,10/23/2013),
    (6,5,10/24/2013),
    (7,6,10/25/2013),
    (5,7,10/26/2013);

/* Write a query that can find all the names of pets and their owners
 * bought after 2004. Key to this is to map the person_pet based on the
 * purchased_on column to the pet and parent. */
SELECT pet.name, person.first_name
FROM pet, person, person_pet
WHERE
    person.id = person_pet.person_id
AND
    person_pet.purchased_on >= 1/1/2004;
 
/* Write a query that can find the pets that are children of a given pet.
 * Again look at the pet.parent to do this. It's actually easy so don't
 * over think it. */
SELECT parent, name
FROM pet
WHERE parent = "Monty";
 
 
