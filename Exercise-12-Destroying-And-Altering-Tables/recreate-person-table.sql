/* We're sourcing this into destroy-and-alter.sql
 *
 * mysql> SOURCE ~/code/Learn-SQL-The-Hard-Way/Exercise-12-Destroying-And-Altering-Tables/recreate-person-table.sql
 */

-- Create the table
CREATE TABLE person (
    id INTEGER PRIMARY KEY,
    first_name TEXT,
    last_name TEXT,
    age INTEGER
);

-- Populate the table
INSERT INTO person
(id, first_name, last_name, age)
VALUES
  (0, 'Zed', 'Shaw', 37),
  (1, 'Terry', 'Berry', 42),
  (2, 'Tyler', 'Brown', 25),
  (3, 'Frank', 'Smith', 100);
