/* Add or remove columns from a table with ALTER TABLE
 *
 * Fulfills the Update spec for CRUD operations
 * This script assumes we're already using learn_sql_the_hard_way
 *
 * mysql> SOURCE ~/code/Learn-SQL-The-Hard-Way/Exercise-12-Destroying-And-Altering-Tables/destroy-and-alter.sql
 */

/* Only drop table if it exists. */
DROP TABLE IF EXISTS person;

/* Create again to work with it. */
CREATE TABLE person (
    id INTEGER PRIMARY KEY,
    first_name TEXT,
    last_name TEXT,
    age INTEGER
);

/* Rename the table to peoples. */
ALTER TABLE person RENAME TO peoples;

/* Add a hatred column to peoples. */
ALTER TABLE peoples ADD COLUMN hatred INTEGER;

/* Rename peoples back to person. */
ALTER TABLE peoples RENAME TO person;

-- In MySQL, we use DESCRIBE instead of .schema
DESCRIBE person;

/* We don't need that. */
DROP TABLE person;

/* Let's repopulate "person" since I haven't been using a code.sql
 * to keep track of everything
 */

SOURCE ~/code/Learn-SQL-The-Hard-Way/Exercise-12-Destroying-And-Altering-Tables/recreate-person-table.sql
