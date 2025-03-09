# SQL Indexes
An index is an in-memory structure that ensures that queries we run on a database are performant, that is to say, they run quickly. If you can remember back to the data structures course, most database indexes are just binary trees or B-trees! The binary tree can be stored in ram as well as on disk, and it makes it easy to lookup the location of an entire row.

PRIMARY KEY columns are indexed by default, ensuring you can look up a row by its id very quickly. However, if you have other columns that you want to be able to do quick lookups on, you'll need to index them.

# CREATE INDEX
```
CREATE INDEX index_name ON table_name (column_name);
```

It's fairly common to name an index after the column it's created on with a suffix of _idx.

# Index Review
As we discussed, an index is a data structure that can perform quick lookups. By indexing a column, we create a new in-memory structure, usually a binary-tree, where the values in the indexed column are sorted into the tree to keep lookups fast. In terms of Big-O complexity, a binary tree index ensures that lookups are O(log(n)).

# Shouldn't We Index Everything? We Can Make the Database Ultra-Fast!
While indexes make specific kinds of lookups much faster, they also add performance overhead - they can slow down a database in other ways. Think about it, if you index every column, you could have hundreds of binary trees in memory! That needlessly bloats the memory usage of your database. It also means that each time you insert a record, that record needs to be added to many trees - slowing down your insert speed.

The rule of thumb is simple:

Add an index to columns you know you'll be doing frequent lookups on. Leave everything else un-indexed. You can always add indexes later.

# Multi-Column Indexes
Multi-column indexes are useful for the exact reason you might think - they speed up lookups that depend on multiple columns.

```
CREATE INDEX first_name_last_name_age_idx
ON users (first_name, last_name, age);
```

A multi-column index is sorted by the first column first, the second column next, and so forth. A lookup on only the first column in a multi-column index gets almost all of the performance improvements that it would get from its own single-column index. However, lookups on only the second or third column will have very degraded performance.

# Rule of Thumb
Unless you have specific reasons to do something special, only add multi-column indexes if you're doing frequent lookups on a specific combination of columns.

# SQL Injection
SQL is a very common way hackers attempt to cause damage or breach a database. One of my favorite XKCD comics of all time demonstrates the problem:

![alt text](image.png)

The joke here is that if someone was using this query:

INSERT INTO students(name) VALUES (?);

And the "name" of a student was 'Robert'); DROP TABLE students;-- then the resulting SQL query would look like this:

INSERT INTO students(name) VALUES ('Robert'); DROP TABLE students;--)

As you can see, this is actually 2 queries! The first one inserts "Robert" into the database, and the second one deletes the students table!

# How Do We Protect Against SQL Injection?
You need to be aware of SQL injection attacks, but to be honest the solution these days is to simply use a modern SQL library that sanitizes SQL inputs. We don't often need to sanitize inputs by hand at the application level anymore