CREATE TABLE people(
  id INTEGER,
  tag TEXT,
  name TEXT,
  age INTEGER,
  balance INTEGER,
  is_admin BOOLEAN
);

ALTER TABLE people
RENAME TO users;

ALTER TABLE users
RENAME COLUMN tag TO username;

ALTER TABLE users
ADD COLUMN password TEXT;

ALTER TABLE transactions
ADD COLUMN was_successful BOOLEAN;

ALTER TABLE transactions
ADD COLUMN transaction_type TEXT;

CREATE TABLE posts(
  id INTEGER,
  image_url TEXT,
  description TEXT,
  author_id INTEGER,
  is_sponsored BOOLEAN
);

ALTER TABLE posts
RENAME COLUMN author_id TO poster_id;

ALTER TABLE posts
ADD COLUMN is_edited BOOLEAN;

ALTER TABLE posts
DROP COLUMN is_sponsored;