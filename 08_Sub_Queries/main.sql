SELECT * FROM transactions
WHERE user_id = (
SELECT id FROM users
WHERE name = 'David'
);


SELECT id, name, (SELECT age_in_days/365) AS age
FROM users
WHERE age > 40;

SELECT * FROM users
WHERE id IN (SELECT sender_id
FROM transactions
WHERE note LIKE '%invoice%' OR note LIKE '%tax%' AND sender_id IS NOT NULL
) AND is_admin=0;