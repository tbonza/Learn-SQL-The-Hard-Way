/* "Alternative way to insert data which helps with atomic replacement of
 * rows. You don't necessarily need this too often, but it does help if
 * you're having to replace whole records and don't want to do a more
 * complicated UPDATE without resorting to transactions."
 *
 * Fulfills the Update spec for CRUD operations
 * This script assumes we're already using learn_sql_the_hard_way
 *
 * mysql> SOURCE ~/code/Learn-SQL-The-Hard-Way/Exercise-11-Replacing-Data/replace-data.sql
 */

/* This should fail because 0 is already taken. */
INSERT INTO person (id, first_name, last_name, age)
    VALUES (0, 'Frank', 'Smith', 100);

/* We can force it by doing an INSERT OR REPLACE. */
INSERT OR REPLACE INTO person (id, first_name, last_name, age)
    VALUES (0, 'Frank', 'Smith', 100);

/* In MySQL, these two queries will each generate an error:
 * ERROR 1062 (23000): Duplicate entry '0' for key 'PRIMARY'
 * ERROR 1064 (42000): You have an error in your SQL syntax;
 *
 * So let's revise using this guidance:
 * http://stackoverflow.com/questions/7490991/mysql-if-exsists-insert-into-or-else-do-something-else
 */

/* This actually brings up a more complicated issue about dealing with
 * a duplicate primary key addressed here:
 * http://stackoverflow.com/questions/548541/insert-ignore-vs-insert-on-duplicate-key-update/548570#548570
 * It's a tangent so let's leave it alone.
 */

-- Going to manually change the primary key to keep the db consisent with
-- the example
INSERT INTO person (id, first_name, last_name, age)
    VALUES (3, 'Frank', 'Smith', 100);
        
SELECT * FROM person;

/* And shorthand for that is just REPLACE. */
REPLACE INTO person (id, first_name, last_name, age)
    VALUES (0, 'Zed', 'Shaw', 37);

/* Now you can see I'm back. */
SELECT * FROM person;

