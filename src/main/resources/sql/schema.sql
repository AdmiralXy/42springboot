CREATE TABLE IF NOT EXISTS images (
    id IDENTITY NOT NULL PRIMARY KEY,
    data BLOB NOT NULL
);

CREATE TABLE IF NOT EXISTS films (
    id IDENTITY NOT NULL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    release_year INT NOT NULL,
    age_restrictions VARCHAR(255) NOT NULL,
    description CLOB NOT NULL,
    image_id INT,
    FOREIGN KEY (image_id) REFERENCES images(id)
);

CREATE TABLE IF NOT EXISTS halls (
    id IDENTITY NOT NULL PRIMARY KEY,
    serial INT NOT NULL UNIQUE,
    seats INT NOT NULL
);

CREATE TABLE IF NOT EXISTS sessions (
    id IDENTITY NOT NULL PRIMARY KEY,
    hall_id INT NOT NULL,
    film_id INT NOT NULL,
    start_at TIMESTAMP NOT NULL,
    cost DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (hall_id) REFERENCES halls(id),
    FOREIGN KEY (film_id) REFERENCES films(id)
);

CREATE TABLE IF NOT EXISTS messages (
    id IDENTITY NOT NULL PRIMARY KEY,
    film_id INT NOT NULL,
    username VARCHAR(255) NOT NULL,
    message CLOB NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (film_id) REFERENCES films(id)
);