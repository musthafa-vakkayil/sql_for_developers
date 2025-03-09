--  Let's add an index to the email field called email_idx.
CREATE INDEX email_idx ON users(email);

-- Add an index on the user_id and recipient_id columns called user_id_recipient_id_idx to speed up our app!

-- Make sure the user_id is the first column in the index so that we can also use this index to speed up our queries that only care about the user_id.

CREATE INDEX user_id_recipient_id_idx ON transactions(user_id, recipient_id);


-- Add country_code and country_name columns to the users table (these are not optional fields, you'll need a default).
-- Update the users table to copy the data from countries table to the users table's country_code and country_name columns.
-- Drop the country_id column from the users table.

ALTER TABLE users
ADD COLUMN country_code TEXT NOT NULL DEFAULT 'not available';

ALTER TABLE users
ADD COLUMN country_name TEXT NOT NULL DEFAULT 'not available';


UPDATE users
SET country_code = c.country_code, country_name = c.name
FROM countries c
WHERE users.country_id = c.id;

ALTER TABLE users
DROP COLUMN country_id;
