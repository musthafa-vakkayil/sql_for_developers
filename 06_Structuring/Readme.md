# LIMIT
Sometimes we don't want to retrieve every record from a table. For example, it's common for a production database table to have millions of rows, and SELECTing all of them might crash your system! The LIMIT keyword has entered the chat.

The LIMIT keyword can be used at the end of a select statement to reduce the number of records returned.

SELECT * FROM products
    WHERE product_name LIKE '%berry%'
    LIMIT 50;

The query above retrieves all the records from the products table where the name contains the word berry. If we ran this query on the Amazon database, it would almost certainly return a lot of records.

The LIMIT statement only allows the database to return up to 50 records matching the query. This means that if there aren't that many records matching the query, the LIMIT statement will not have an effect.

# ORDER BY
SQL also offers us the ability to sort the results of a query using ORDER BY. By default, the ORDER BY keyword sorts records by the given field in ascending order, or ASC for short. However, ORDER BY does support descending order as well with the keyword DESC.

This query returns the name, price, and quantity fields from the products table sorted by price in ascending order:
```
SELECT name, price, quantity FROM products
    ORDER BY price;
```
This query returns the name, price, and quantity of the products ordered by the quantity in descending order:
```
SELECT name, price, quantity FROM products
    ORDER BY quantity DESC;
```

When using both ORDER BY and LIMIT, the ORDER BY clause must come first.

