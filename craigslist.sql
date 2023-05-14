-- from the terminal run:
-- psql < craigslist.sql

CREATE TABLE regions (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL
);

CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  email VARCHAR(255) NOT NULL,
  password VARCHAR(255) NOT NULL,
  preferred_region_id INTEGER REFERENCES regions(id)
);

CREATE TABLE posts (
  id SERIAL PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  description TEXT NOT NULL,
  user_id INTEGER REFERENCES users(id),
  location VARCHAR(255) NOT NULL,
  region_id INTEGER REFERENCES regions(id)
);

CREATE TABLE categories (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL
);

CREATE TABLE post_categories (
  post_id INTEGER REFERENCES posts(id),
  category_id INTEGER REFERENCES categories(id),
  PRIMARY KEY (post_id, category_id)
);