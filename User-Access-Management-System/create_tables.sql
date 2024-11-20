-- create_tables.sql
-- This script sets up the database schema for the application.

-- Step 1: Create the `users` table to store user details.
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(255) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    role VARCHAR(50) NOT NULL
);

-- Step 2: Create the `software` table to store software details.
CREATE TABLE software (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    access_levels TEXT
);

-- Step 3: Create the `requests` table to store access requests.
CREATE TABLE requests (
    id SERIAL PRIMARY KEY,
    user_id INTEGER REFERENCES users(id),
    software_id INTEGER REFERENCES software(id),
    access_type VARCHAR(50),
    reason TEXT,
    status VARCHAR(50) DEFAULT 'Pending'
);
