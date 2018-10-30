/* Create multiple tables where we can store data.
 * Fulfills the Create spec for CRUD operations
 *
 * This script assumes we're already using 'learn_sql_the_hard_way'
 * mysql> SOURCE ~/code/Learn-SQL-The-Hard-Way/Exercise-2-Creating-A-MultiTable-Database/multi-table.sql
 */

-- Create table about Pets
CREATE TABLE pet (
    id INTEGER PRIMARY KEY,
    name TEXT,
    breed TEXT,
    age INTEGER,
    dead INTEGER);

-- People call these "linking" tables "relations";
/* person_pet is a "relations" table
 * tables containing data are called "tables"; at least in this book
 */
CREATE TABLE person_pet (
    person_id INTEGER,
    pet_id INTEGER);

-- Create table about vehicles
CREATE TABLE vehicle (
    id INTEGER PRIMARY KEY,
    name TEXT,
    company TEXT,
    year INTEGER,
    mileage INTEGER);
 
