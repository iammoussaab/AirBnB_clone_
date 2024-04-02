-- Prepares a MySQL server for the project.
CREATE DATABASE IF NOT EXISTS hbnb_dev_db;
CREATE USER IF NOT EXISTS 'hbnb_dev'@'localhost' IDENTIFIED BY 'hbnb_dev_pwd';
GRANT ALL PRIVILEGES ON hbnb_dev_db.* TO 'hbnb_dev'@'localhost';

USE hbnb_dev_db;

-- Create tables for all models
CREATE TABLE IF NOT EXISTS states (
    id VARCHAR(60) PRIMARY KEY,
    name VARCHAR(128) NOT NULL
);

CREATE TABLE IF NOT EXISTS cities (
    id VARCHAR(60) PRIMARY KEY,
    name VARCHAR(128) NOT NULL,
    state_id VARCHAR(60),
    FOREIGN KEY (state_id) REFERENCES states(id)
);

CREATE TABLE IF NOT EXISTS places (
    id VARCHAR(60) PRIMARY KEY,
    city_id VARCHAR(60),
    user_id VARCHAR(60),
    name VARCHAR(128) NOT NULL,
    description VARCHAR(1024),
    number_rooms INTEGER NOT NULL DEFAULT 0,
    number_bathrooms INTEGER NOT NULL DEFAULT 0,
    max_guest INTEGER NOT NULL DEFAULT 0,
    price_by_night INTEGER NOT NULL DEFAULT 0,
    latitude FLOAT,
    longitude FLOAT,
    FOREIGN KEY (city_id) REFERENCES cities(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE IF NOT EXISTS amenities (
    id VARCHAR(60) PRIMARY KEY,
    name VARCHAR(128) NOT NULL
);

CREATE TABLE IF NOT EXISTS place_amenity (
    place_id VARCHAR(60),
    amenity_id VARCHAR(60),
    PRIMARY KEY (place_id, amenity_id),
    FOREIGN KEY (place_id) REFERENCES places(id),
    FOREIGN KEY (amenity_id) REFERENCES amenities(id)
);

CREATE TABLE IF NOT EXISTS reviews (
    id VARCHAR(60) PRIMARY KEY,
    text VARCHAR(1024) NOT NULL,
    place_id VARCHAR(60),
    user_id VARCHAR(60),
    FOREIGN KEY (place_id) REFERENCES places(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);