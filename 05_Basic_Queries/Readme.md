# As Clause in SQL
Sometimes we need to structure the data we return from our queries in a specific way. An AS clause allows us to "alias" a piece of data in our query. The alias only exists for the duration of the query.

As Keyword
The following queries return the same data:

```
SELECT employee_id AS id, employee_name AS name
FROM employees;

SELECT employee_id, employee_name
FROM employees;
```
The difference is that the results from the aliased query would have column names id and name instead of employee_id and employee_name.

# SQL Functions
SQL is a programming language and like nearly all programming languages, it supports functions. We can use functions and aliases to calculate new columns in a query. This is similar to how you might use formulas in Excel.

IIF Function
In SQLite, the IIF function works like a ternary. For example,

IIF(carA > carB, 'Car a is bigger', 'Car b is bigger')

If a is greater than b, this statement evaluates to the string 'Car a is bigger'. Otherwise, it evaluates to 'Car b is bigger'.

Here's how we can use IIF() and a directive alias to add a new calculated column to our result set:

SELECT quantity,
    IIF(quantity < 10, 'Order more', 'In Stock') AS directive
    FROM products;

# Between
We can check if values are between two numbers using the WHERE clause in an intuitive way! The WHERE clause doesn't always have to be used to specify specific id's or values. We can also use it to help narrow down our result set. Here's an example:
```
SELECT employee_name, salary
FROM employees
WHERE salary BETWEEN 30000 and 60000;
```
This query returns all the employees name and salary fields for any rows where the salary is BETWEEN 30,000 and 60,000 inclusively! We can also query results that are NOT BETWEEN two specified values.
```
SELECT product_name, quantity
FROM products
WHERE quantity NOT BETWEEN 20 and 100;
```
This query returns all the product names where the quantity was not between 20 and 100. We can use conditionals to make the results of our query as specific as we need them to be.

# DISTINCT
SQL offers us the DISTINCT keyword that removes duplicate records from the resulting query.

SELECT DISTINCT previous_company
    FROM employees;

This only returns one row for each unique previous_company value.

# AND Operator
SELECT product_name, quantity, shipment_status
    FROM products
    WHERE shipment_status = 'pending'
    AND quantity BETWEEN 0 and 10;

This only retrieves records where both the shipment_status is "pending" AND the quantity is between 0 and 10.

# Equality Operators
All of the following operators are supported in SQL. The = is the main one to watch out for, it's not == like in many other languages! SQLite does allow for == but it's not a good habit to get into, as other dialects of SQL will not recognize == as valid syntax.

- =
- <
- >
- <=
- >=

# OR
As you've probably guessed, if the logical AND operator is supported, the OR operator is probably supported as well.

SELECT product_name, quantity, shipment_status
    FROM products
    WHERE shipment_status = 'out of stock'
    OR quantity BETWEEN 10 and 100;

This query retrieves records where either the shipment_status condition OR the quantity condition are met.

# Order of Operations
You can group logical operations with parentheses to specify the order of operations.

(this AND that) OR the_other

# In
Another variation to the WHERE clause we can utilize is the IN operator. IN returns true or false if the first operand matches any of the values in the second operand. The IN operator is a shorthand for multiple OR conditions.

These two queries are equivalent:

SELECT product_name, shipment_status
    FROM products
    WHERE shipment_status IN ('shipped', 'preparing', 'out of stock');

SELECT product_name, shipment_status
    FROM products
    WHERE shipment_status = 'shipped'
        OR shipment_status = 'preparing'
        OR shipment_status = 'out of stock';

Hopefully, you're starting to see how querying specific data using fine-tuned SQL clauses helps reveal important insights! The larger a table becomes the harder it becomes to analyze without proper queries.

# Like
Sometimes we don't have the luxury of knowing exactly what it is we need to query. Have you ever wanted to look up a song or a video but you only remember part of the name? SQL provides us an option for when we're in situations LIKE this.

The LIKE keyword allows for the use of the % and _ wildcard operators. Let's focus on % first.

# % Operator
The % operator will match zero or more characters. We can use this operator within our query string to find more than just exact matches depending on where we place it.

```
Product Starts With “banana”:
SELECT * FROM products
WHERE product_name LIKE 'banana%';

Product Ends With “banana”:
SELECT * FROM products
WHERE product_name LIKE '%banana';

Product Contains “banana”:
SELECT * FROM products
WHERE product_name LIKE '%banana%';
```

# Underscore Operator
As discussed, the % wildcard operator matches zero or more characters. Meanwhile, the _ wildcard operator only matches a single character.
```
SELECT * FROM products
    WHERE product_name LIKE '_oot';

The query above matches products like:
```
boot
root
foot
```
SELECT * FROM products
    WHERE product_name LIKE '__oot';
```
The query above matches products like:

shoot
groot