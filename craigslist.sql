DROP DATABASE IF EXISTS craigslist;

CREATE DATABASE craigslist;

\c craigslist

CREATE TABLE regions (
    id SERIAL PRIMARY KEY,
    region_name TEXT
);

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username TEXT UNIQUE NOT NULL,
    user_password VARCHAR UNIQUE NOT NULL,
    region_id INTEGER REFERENCES regions (id) ON DELETE CASCADE
);

CREATE TABLE posts (
    id SERIAL PRIMARY KEY,
    title TEXT,
    user_text TEXT,
    post_location TEXT,
    user_id INTEGER REFERENCES users (id) ON DELETE CASCADE,
    region_id INTEGER REFERENCES regions (id) ON DELETE CASCADE,
    category_id INTEGER REFERENCES categories (id) ON DELETE CASCADE
);

CREATE TABLE categories (
    id SERIAL PRIMARY KEY,
    user_post TEXT 
);



INSERT INTO regions (region_name)
VALUES ('NY');

INSERT INTO users (username, user_password, region_id)
VALUES ('newuser', 'encpasword&$', 1);

INSERT INTO posts (title, user_text, post_location, user_id, region_id, category_id)
VALUES ('car for sale', 'discounted', 'NY', 1, 1, 1 );

INSERT INTO categories (user_post)
VALUES ('used cars');