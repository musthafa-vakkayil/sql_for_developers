SELECT * FROM users as u
JOIN countries as c
ON u.id = c.id;


SELECT users.name, users.age, countries.name as counrty_name
FROM users
INNER JOIN countries ON countries.country_code = users.country_code
ORDER BY counrty_name;


-- A user's name as name
-- The sum of all of their transaction amounts as sum
-- The count of all of their transactions as count
-- Be sure to group the data by the user's id.
-- Be sure to order the data by the sum field in descending order.
-- Be sure to still return user records of users who have no transactions.

SELECT users.name, 
SUM(transactions.amount) as sum, 
COUNT(transactions.id) AS count
FROM users
LEFT JOIN transactions
ON users.id = transactions.user_id
GROUP By users.id
ORDER BY sum DESC;

-- The user's id
-- The user's name
-- The user's age
-- The user's username
-- The user's country name, renamed to country_name
-- The sum of the successful transactions from the user, renamed to balance
-- Return only a single user record - specifically the one with id=6.

SELECT users.id, users.name, users.age, users.username, 
countries.name as counrty_name,
SUM(transactions.amount) as balance
FROM users
JOIN countries ON users.country_code = countries.country_code
JOIN transactions ON users.id = transactions.user_id
WHERE users.id = 6 AND transactions.was_successful = 1;



-- Write an SQL statement that includes an INNER JOIN and returns the following:

-- The user's name
-- The user's username
-- The count of support tickets attributed to that user labeled as support_ticket_count
-- Exclude any tickets that have "Account Access" as the issue_type and only return 
-- records for users who have more than 1 support ticket of another type. 
-- Finally, sort the records by users with the most support tickets at the top.

SELECT users.name, users.username, COUNT(support_tickets.id) as support_ticket_count
FROM users
JOIN support_tickets ON users.id = support_tickets.user_id
WHERE support_tickets.issue_type NOT LIKE '%Account Access%'
GROUP by users.id
HAVING support_ticket_count>1
ORDER BY support_ticket_count DESC;


-- Write an SQL statement using multiple joins to return the following:

-- The country's name
-- The country's country_code
-- The number of unique issue_types per country name labeled as issue_diversity
-- Only include records for countries that have support tickets linking back to a user in that country. 
-- Sort the records by highest issue diversity first, then by country name in ascending order.

SELECT countries.name, COUNT(DISTINCT support_tickets.issue_type) as issue_diversity
FROM countries
JOIN users ON countries.country_code = users.country_code
JOIN support_tickets ON support_tickets.user_id = users.id
GROUP BY countries.name
ORDER by issue_diversity DESC, countries.name;