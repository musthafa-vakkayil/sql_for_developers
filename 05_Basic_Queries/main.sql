SELECT *, IIF(age > 55 OR country_code = 'CA', 'true', 'false') as discount_eligible
FROM users;

SELECT *
FROM users
WHERE name LIKE 'Al___';


SELECT *
FROM users
WHERE name LIKE 'Al%';


SELECT *
FROM users
WHERE country_code IN ('US', 'CA', 'MX');


SELECT *
FROM users
WHERE country_code = 'CA' 
AND age < 18;


SELECT name, age
FROM users
WHERE age BETWEEN 18 AND 30;

SELECT id, user_id, recipient_id, sender_id, note, amount, was_successful, 
IIF(was_successful = 1, 'No Action Required', 'Perform Audit') as audit
FROM transactions;

SELECT * FROM users
WHERE (username LIKE '%cashpal%' OR username LIKE '%support%') 
AND is_admin = 0;