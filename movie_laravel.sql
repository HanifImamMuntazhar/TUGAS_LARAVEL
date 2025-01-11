-- Membuat database baru
CREATE DATABASE tugasmovie_laravel;

-- Menggunakan database baru
USE tugasmovie_laravel;

-- Tabel genres_laravel
CREATE TABLE genres_laravel (
    genre_id INT AUTO_INCREMENT PRIMARY KEY,
    genre_name VARCHAR(100) NOT NULL
);

-- Tabel films
CREATE TABLE films (
    film_id INT AUTO_INCREMENT PRIMARY KEY,
    film_title VARCHAR(255) NOT NULL,
    description TEXT,
    poster_url TEXT,
    release_year INT,
    is_available BOOLEAN DEFAULT TRUE,
    genre_id INT,
    FOREIGN KEY (genre_id) REFERENCES genres_laravel(genre_id) ON DELETE SET NULL
);

-- Tabel actors
CREATE TABLE actors (
    actor_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    age INT,
    biography TEXT,
    profile_picture TEXT
);

-- Tabel film_casts
CREATE TABLE film_casts (
    cast_id INT AUTO_INCREMENT PRIMARY KEY,
    film_id INT NOT NULL,
    actor_id INT NOT NULL,
    FOREIGN KEY (film_id) REFERENCES films(film_id) ON DELETE CASCADE,
    FOREIGN KEY (actor_id) REFERENCES actors(actor_id) ON DELETE CASCADE
);

-- Tabel user_roles
CREATE TABLE user_roles (
    role_id INT AUTO_INCREMENT PRIMARY KEY,
    role_name VARCHAR(50) NOT NULL
);

-- Tabel app_users
CREATE TABLE app_users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(100) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    role_id INT,
    FOREIGN KEY (role_id) REFERENCES user_roles(role_id) ON DELETE SET NULL
);

-- Tabel user_profiles
CREATE TABLE user_profiles (
    profile_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    bio TEXT,
    age INT,
    address TEXT,
    avatar_url TEXT,
    FOREIGN KEY (user_id) REFERENCES app_users(user_id) ON DELETE CASCADE
);

-- Tabel reviews_laravel
CREATE TABLE reviews_laravel (
    review_id INT AUTO_INCREMENT PRIMARY KEY,
    film_id INT NOT NULL,
    user_id INT NOT NULL,
    review_text TEXT,
    rating INT CHECK (rating >= 1 AND rating <= 5),
    FOREIGN KEY (film_id) REFERENCES films(film_id) ON DELETE CASCADE,
    FOREIGN KEY (user_id) REFERENCES app_users(user_id) ON DELETE CASCADE
);

-- Tabel untuk caching dan pengelolaan sesi
CREATE TABLE app_sessions (
    session_id VARCHAR(255) PRIMARY KEY,
    user_id INT,
    ip_address VARCHAR(45),
    user_agent TEXT,
    payload TEXT,
    last_activity TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES app_users(user_id) ON DELETE CASCADE
);

CREATE TABLE password_resets (
    reset_token VARCHAR(255) PRIMARY KEY,
    email VARCHAR(100) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Contoh data awal
INSERT INTO genres_laravel (genre_name) VALUES ('Action'), ('Drama'), ('Comedy'), ('Sci-Fi');

INSERT INTO films (film_title, description, release_year, genre_id) VALUES
('Intergalactic Adventure', 'A sci-fi journey through space.', 2023, 4),
('The Great Heist', 'A drama about a high-stakes bank robbery.', 2022, 2);

INSERT INTO actors (full_name, age, biography) VALUES
('John Doe', 35, 'Award-winning actor known for action films.'),
('Jane Smith', 29, 'Versatile actress with a love for drama roles.');

INSERT INTO user_roles (role_name) VALUES ('Admin'), ('User');

INSERT INTO app_users (email, password_hash, role_id) VALUES
('admin@example.com', 'hashed_password', 1),
('user@example.com', 'hashed_password', 2);

INSERT INTO reviews_laravel (film_id, user_id, review_text, rating) VALUES
(1, 2, 'Amazing movie with stunning visuals!', 5),
(2, 2, 'A gripping tale with great performances.', 4);
