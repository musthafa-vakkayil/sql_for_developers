# Insert Statement
Tables are pretty useless without data in them! In SQL we can add records to a table using an INSERT INTO statement. When using an INSERT statement we must first specify the table we are inserting the record into, followed by the fields within that table we want to add VALUES to.

Example INSERT INTO statement:

INSERT INTO employees(id, name, title)
VALUES (1, 'Allan', 'Engineer');

# Auto Increment
Many dialects of SQL support an AUTO INCREMENT feature. When inserting records into a table with AUTO INCREMENT enabled, the database will assign the next value automatically. In SQLite an integer id field that has the PRIMARY KEY constraint will auto increment by default!

# Id's
Depending on how your database is set up, you may be using traditional ids or you may be using UUIDs. SQL doesn't support auto incrementing a uuid so if your database is using them your server will have to handle the changing uuid's for each record.

# Count
We can use a SELECT statement to get a count of the records within a table. This can be very useful when we need to know how many records there are, but we don't particularly care what's in them.

Here's an example in SQLite:

SELECT COUNT(*) FROM employees;

# Using a WHERE Clause
Say we had over 9000 records in our users table. We often want to look at specific user data within that table without retrieving all the other records in the table. We can use a SELECT statement followed by a WHERE clause to specify which records to retrieve. The SELECT statement stays the same, we just add the WHERE clause to the end of the SELECT. Here's an example:

SELECT name FROM users WHERE power_level >= 9000;

This will select only the name field of any user within the users table WHERE the power_level field is greater than or equal to 9000.

# Finding NULL Values
You can use a WHERE clause to filter values by whether or not they're NULL.

IS NULL
SELECT name FROM users WHERE first_name IS NULL;

IS NOT NULL
SELECT name FROM users WHERE first_name IS NOT NULL;

# DELETE Statement
A DELETE statement removes all records from a table that match the WHERE clause. As an example:

DELETE FROM employees
    WHERE id = 251;

# Update Statement
The UPDATE statement in SQL allows us to update the fields of a record. We can even update many records depending on how we write the statement.

An UPDATE statement specifies the table that needs to be updated, followed by the fields and their new values by using the SET keyword. Lastly a WHERE clause indicates the record(s) to update.

UPDATE employees
SET job_title = 'Backend Engineer', salary = 150000
WHERE id = 251;

# Object-Relational Mapping (ORMs)
An Object-Relational Mapping or an ORM for short, is a tool that allows you to perform CRUD operations on a database using a traditional programming language. These typically come in the form of a library or framework that you would use in your backend code.

The primary benefit an ORM provides is that it maps your database records to in-memory objects. For example, in Go we might have a struct that we use in our code:

type User struct {
    ID int
    Name string
    IsAdmin bool
}

This struct definition conveniently represents a database table called users, and an instance of the struct represents a row in the table

# Example: Using an ORM
Using an ORM we might be able to write simple code like this:
```
user := User{
    ID: 10,
    Name: "Lane",
    IsAdmin: false,
}

// generates a SQL statement and runs it,
// creating a new record in the users table
db.Create(user)
```
# Example: Using Straight SQL
Using straight SQL we might have to do something a bit more manual:
```
user := User{
    ID: 10,
    Name: "Lane",
    IsAdmin: false,
}

db.Exec("INSERT INTO users (id, name, is_admin) VALUES (?, ?, ?);",
    user.ID, user.Name, user.IsAdmin)
```

