
SELECT sender_id, SUM(amount) as balance
FROM transactions
WHERE sender_id IS NOT NULL AND note LIKE '%lunch%'
GROUP BY sender_id
HAVING balance > 20
ORDER BY balance ASC;

SELECT ROUND(avg(age)) as round_age
FROM users
WHERE country_code = 'US';

SELECT country_code, ROUND(AVG(age)) as avg_age
FROM users
GROUP BY country_code;

SELECT recipient_id, COUNT(id) as transaction_received
FROM transactions
WHERE was_successful = 1 AND recipient_id IS NOT NULL
GROUP BY recipient_id
ORDER by transaction_received DESC
LIMIT 2;