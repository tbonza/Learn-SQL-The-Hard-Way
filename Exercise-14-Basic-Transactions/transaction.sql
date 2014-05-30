/* Instructions for Exercise 14: Basic Transactions
 *
 *  Take your ex13.sql and copy it to ex14.sql so you can modify it.
 *  Once you have that, put a BEGIN at the top and a ROLLBACK at the bottom.
 *  Now run it and you'll see that it's as if your script didn't do anything.
 *  Next, change the ROLLBACK to be COMMIT and run it again, and you'll see
 *    it works like normal.
 *  Get rid of the BEGIN and COMMIT from your ex14.sql so it's back the way
 *    it was.
 *  Now create an error by removing one of the TABLE keywords from one of
 *    the lines. This is so you can make it have an error and recover.
 * 
 * In other words, let's get familar with START TRANSACTION, COMMIT, and
 * ROLLBACK syntax in MySQL.
 *
 * START TRANSACTION or BEGIN start a new transaction
 *
 * COMMIT commits the current transaction, making its changes permanent
 *
 * ROLLBACK rolls back the current transaction, canceling its changes
 *
 * SET autocommit disables or enables the default autocommit mode for the
 * current session
 */

 -- I haven't been exactly playing by the same rules as Learn SQL the Hard
 -- Way so let's just roll through this thing with some SELECT statements

-- Doing it for a unicorn
DELIMITER $$

DROP PROCEDURE IF EXISTS find_unicorn $$

-- Create a stored procedure to alert us if a unicorn sneaks into the db
CREATE PROCEDURE find_unicorn()

BEGIN

 -- If someone has a pet unicorn, sound the alarm!
 IF EXISTS((SELECT breed FROM pet WHERE breed="Unicorn")) THEN
     ROLLBACK;
 ELSE
     COMMIT;
 END IF;

END $$


/* Let's COMMIT this one */
BEGIN;

-- Find anyone who owns more than one pet
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
COMMIT;
-- Find a unicorn
SELECT breed
FROM pet
WHERE breed = "Unicorn";
-- Find Jolene
SELECT first_name
FROM person
WHERE first_name = "Jolene";

DELIMITER $$
CALL find_unicorn() $$
DELIMITER ;

END;

    






