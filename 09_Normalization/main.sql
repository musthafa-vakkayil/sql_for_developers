-- One to Many Relationship

CREATE TABLE users (
  id INTEGER PRIMARY KEY,
  name TEXT NOT NULL,
  age INTEGER NOT NULL,
  username TEXT UNIQUE NOT NULL,
  password TEXT NOT NULL,
  is_admin BOOLEAN
);

CREATE TABLE countries(
  id INTEGER PRIMARY KEY,
  country_code TEXT,
  name TEXT,
  user_id INTEGER NOT NULL,
  CONSTRAINT fk_users
  FOREIGN KEY(user_id)
  REFERENCES users(id)
  );


-- Many to Many
CREATE TABLE users (
  id INTEGER PRIMARY KEY,
  name TEXT NOT NULL,
  age INTEGER NOT NULL,
  username TEXT UNIQUE NOT NULL,
  password TEXT NOT NULL,
  is_admin BOOLEAN
);

CREATE TABLE countries (
  id INTEGER PRIMARY KEY,
  country_code TEXT,
  name TEXT
 );
  
CREATE TABLE users_countries(
  user_id INTEGER NOT NULL,
  country_id INTEGER NOT NULL,
  UNIQUE(user_id, contry_id)
  );