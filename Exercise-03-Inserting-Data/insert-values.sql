/* Insert data into the tables we just created
 *
 * Fulfills the Create spec for CRUD operations
 * This script assumes we're already using 'learn_sql_the_hard_way'
 * mysql> SOURCE ~/code/Learn-SQL-The-Hard-Way/Exercise-3-Inserting-Data/insert-values.sql
 */

-- Insert first person & their pet
INSERT INTO person (id, first_name, last_name, age)
    VALUES (0, "Zed", "Shaw", 37);

INSERT INTO pet (id, name, breed, age, dead)
    VALUES (0, "Fluffy", "Unicorn", 1000, 0);

-- Insert second person & their pet
INSERT INTO person VALUES (1, "Terry", "Berry", 42);
INSERT INTO pet VALUES (1, "Gigantor", "Robot", 1, 1);

-- Insert me and my pet
INSERT INTO person (id, first_name, last_name, age)
    VALUES (2, "Tyler", "Brown", 25);

INSERT INTO pet (id, name, breed, age, dead)
    VALUES (2, "Murphy", "Yellow lab", 6, 0);

/* Let's check out what we did */
-- SELECT * FROM person;
-- SELECT * FROM pet;
