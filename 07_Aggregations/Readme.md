# What Are Aggregations?
An "aggregation" is a single value that's derived by combining several other values. We performed an aggregation earlier when we used the COUNT statement to count the number of records in a table.

# Why Aggregations?
Data stored in a database should generally be stored raw. When we need to calculate some additional data from the raw data, we can use an aggregation.

Take the following COUNT aggregation as an example:
```
SELECT COUNT(*)
FROM products
WHERE quantity = 0;
```
This query returns the number of products that have a quantity of 0. We could store a count of the products in a separate database table, and increment/decrement it whenever we make changes to the products table - but that would be redundant.

It's much simpler to store the products in a single place (we call this a single source of truth) and run an aggregation when we need to derive additional information from the raw data.

# Sum
The SUM aggregation function returns the sum of a set of values.

For example, the query below returns a single record containing a single field. The returned value is equal to the total salary being collected by all of the employees in the employees table.

```
SELECT SUM(salary)
FROM employees;
```

# MAX
As you may expect, the max function retrieves the largest value from a set of values. For example:

SELECT max(price)
FROM products;

This query looks through all of the prices in the products table and returns the price with the largest price value. Remember it only returns the price, not the rest of the record! You always need to specify each field you want a query to return.

# Min
The min function works the same as the max function but finds the lowest value instead of the highest value.

SELECT product_name, min(price)
FROM products;

This query returns the product_name and the price fields of the record with the lowest price.

# GROUP BY
There are times we need to group data based on specific values.

SQL offers the GROUP BY clause which can group rows that have similar values into "summary" rows. It returns one row for each group. The interesting part is that each group can have an aggregate function applied to it that operates only on the grouped data.

Example of GROUP BY
Imagine that we have a database with songs and albums, and we want to see how many songs are on each album. We can use a query like this:

SELECT album_id, count(song_id)
FROM songs
GROUP BY album_id;

This query retrieves a count of all the songs on each album. One record is returned per album, and they each have their own count.

# Average
Just like we may want to find the minimum or maximum values within a dataset, sometimes we need to know the average!

SQL offers us the AVG() function. Similar to MAX(), AVG() calculates the average of all non-NULL values.

SELECT avg(song_length)
FROM songs;

This query returns the average song_length in the songs table!

# Having
When we need to filter the results of a GROUP BY query even further, we can use the HAVING clause. The HAVING clause specifies a search condition for a group.

The HAVING clause is similar to the WHERE clause, but it operates on groups after they've been grouped, rather than rows before they've been grouped.

```
SELECT album_id, count(id) as count
FROM songs
GROUP BY album_id
HAVING count > 5;
```

This query returns the album_id and count of its songs, but only for albums with more than 5 songs.

# HAVING vs. WHERE in SQL
It's fairly common for developers to get confused about the difference between the HAVING and the WHERE clauses - they're pretty similar after all.

The difference is fairly simple in actuality:

A WHERE condition is applied to all the data in a query before it's grouped by a GROUP BY clause.
A HAVING condition is only applied to the grouped rows that are returned after a GROUP BY is applied.
This means that if you want to filter based on the result of an aggregation, you need to use HAVING. If you want to filter on a value that's present in the raw data, you should use a simple WHERE clause.

# Round
Sometimes we need to round some numbers, particularly when working with the results of an aggregation. We can use the ROUND() function to get the job done.

The SQL round() function allows you to specify both the value you wish to round and the precision to which you wish to round it:

round(value, precision)

If no precision is given, SQL will round the value to the nearest whole value:
```
SELECT song_name, round(avg(song_length), 1)
FROM songs
```
This query returns the average song_length from the songs table, rounded to a single decimal point.