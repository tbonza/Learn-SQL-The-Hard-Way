/* Create a table. For extra credit, add other INTEGER and TEXT fields
 * This fulfills the Create specification of the Create Read Update
 * Delete (CRUD) operations
 *
 * Instead of adding additional INTEGER and TEXT fields, I added Boolean,
 * Float, and Date fields.
 *
 * mysql> SOURCE ~/code/Learn-SQL-The-Hard-Way/Exercise-1-Creating-Tables/create_table.sql
 */
 
-- Select the database
USE learn_sql_the_hard_way;

-- Create a table in the database
CREATE TABLE person (
       id INTEGER PRIMARY KEY,
       first_name TEXT,
       last_name TEXT,
       age INTEGER
       /* Extra Credit */
       -- male BOOLEAN,
       -- height_inches FLOAT,
       -- Birthday DATE
       );
