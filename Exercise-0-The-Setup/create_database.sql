/* After installing MySQL, the first thing we need to do is create a
 * database.
 *
 * mysql> SOURCE ~/code/Learn-SQL-The-Hard-Way/Exercise-0-The-Setup/create_database.sql
 */

-- Create the database
CREATE DATABASE learn_sql_the_hard_way;

-- Delete the database
DROP DATABASE learn_sql_the_hard_way;

-- We really shouldn't have done that, let's recreate the database
CREATE DATABASE learn_sql_the_hard_way;

-- Let's check out what we did
SHOW DATABASES;

