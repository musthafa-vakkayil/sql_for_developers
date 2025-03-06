# SQL

Structured Query Language, or SQL (pronounced "squeel" by the in-crowd), is the primary programming language used to manage and interact with relational databases. SQL can perform various operations such as creating, updating, reading, and deleting records within a database.

# SQL Select Statement
Let's write our own SQL statement from scratch! A SELECT statement is the most common operation in SQL - often called a "query". SELECT retrieves data from one or more tables. Standard SELECT statements do not alter the state of the database.

SELECT id FROM users;

# Select a Single Field
A SELECT statement begins with the keyword SELECT followed by the fields you want to retrieve.

SELECT id FROM users;

# Select Multiple Fields
If you want to select more than one field you can specify multiple fields separated by commas.

SELECT id, name FROM users;

# Select All Fields
If you want to select every field in a record you can use the shorthand * syntax.

SELECT * FROM users;

# One way in which SQLite is a bit different is that it stores Boolean values as integers - the integers 0 and 1.

0 = false
1 = true

