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
ALTER TABLE person ADD COLUMN phone_number CHAR(8);

/* Add a salary column to person that is float. */
ALTER TABLE person ADD COLUMN salary FLOAT;

/* Add a dob column to both person and pet that is a DATETIME. */
ALTER TABLE person ADD COLUMN dob DATETIME;

/* Add a purchased_on column to person_pet of type DATETIME. */
ALTER TABLE person_pet ADD COLUMN purchased_on DATETIME;

/* Add a parent to pet co lumn that's an INTEGER and holds the id for
 * this pet's parent. */
ALTER TABLE pet ADD COLUMN parent INT;

/* Update the existing database records with the new column data using
 * UPDATE statements. Don't forget about the purchased_on column in
 * person_pet relation table to indicate when that person bought the pet. */

-- Update the new columns for "person"
UPDATE person SET
    dead = 0,
    phone_number = (
    CASE 
        WHEN person.id = 0 THEN "867-5309"
	WHEN person.id = 1 THEN "555-9021"
	WHEN person.id = 2 THEN "321-3097"
	WHEN person.id = 3 THEN "332-1826"
	ELSE "missing"
    END ),
    salary = (
    CASE 
        WHEN person.id <= 1 THEN 45000.00
	WHEN person.id > 1 THEN 65000.00
	ELSE 0
    END ),
    dob = '1988-02-02 03:00:00';

-- Update the new columns for "pet"
UPDATE pet
INNER JOIN person_pet ON pet.id = person_pet.pet_id
SET pet.parent = person_pet.person_id;

-- Update the new columns for "person_pet"
UPDATE person_pet 
SET purchased_on = (
    CASE
        WHEN person_pet.person_id >= 0 AND
	     person_pet.person_id <= 4 THEN '1998-02-02 03:00:00'
	WHEN person_pet.person_id = 5 OR
	     person_pet.person_id = 6 THEN '2000-02-02 03:04:00'
	WHEN person_pet.person_id = 7 THEN '2012-02-02 03:14:00'
	ELSE 0
    END);

/* Add 4 more people and 5 more pets and assign their ownership and what
 * pet's are parents. On this last part remember that you get the id of the
 * parent, then set it in the parent column. */

-- 4 more people
INSERT INTO person
(id, first_name, last_name, age, dead, salary, dob, phone_number)
VALUES
    (4, "Rufus", "Mova", 21, 0, 25000.00, '1992-04-04 03:04:00', "123-4567"),
    (5, "Brutus", "Opah", 22, 0, 25000.00,'1991-04-05 03:04:00', "567-1234"),
    (6, "Wheatus", "TheBand", 34, 1, 100000.00, '1991-04-02 03:04:00',
        "434-0595"),
    (7, "Jolene", "Mean", 26, 0, 23000.00, '1987-04-06 03:04:00', "900-0904")
    ;

-- 5 more pets
INSERT INTO pet
(id, name, breed, age, dead, parent)
VALUES
    (3, "Dirka", "Dragon", 4000, 0, 4),
    (4, "Quirka", "Wagon", 4, 0, 5),
    (5, "Jose", "Cat", 5,0, 6),
    (6, "Monty", "Python", 6,0, 7),
    (7, "Holly", "Grasshopper", 3,0, 5);
 
-- Assign values to person_pet
INSERT INTO person_pet
(person_id, pet_id, purchased_on)
VALUES
    (4,3,'2013-10-22 03:00:00'),
    (5,4,'2013-10-23 03:00:00'),
    (6,5,'2013-10-24 03:00:00'),
    (7,6,'2013-10-25 03:00:00'),
    (5,7,'2013-10-26 03:00:00');

/* Write a query that can find all the names of pets and their owners bought
 * after 2004. Key to this is to map the person_pet based on the
 * purchased_on column to the pet and parent. */
SELECT pet.name, person.first_name
FROM pet, person, person_pet
WHERE
    person.id = person_pet.person_id
AND
    person_pet.purchased_on >= '2004-01-01 12:00:00';
 
/* Write a query that can find the pets that are children of a given pet.
 * Again look at the pet.parent to do this. It's actually easy so don't over
 * think it. */

-- Ended up setting pet.parent to the Owner's name so let's find all owners
-- with multiple pets...seems close enough

SELECT person.first_name AS "The Owner",
       pet.name AS "The Pet",
       pet.breed AS "Pet Breed"
FROM pet, person
WHERE pet.parent = person.id
AND pet.parent IN
  (SELECT pet.parent
   FROM pet
   GROUP BY pet.parent
   HAVING COUNT(pet.parent) > 1)
ORDER BY pet.name ASC;
