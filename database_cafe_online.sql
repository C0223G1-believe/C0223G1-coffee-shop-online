CREATE DATABASE shop_cafe_online;
USE shop_cafe_online;
CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    user_name VARCHAR(50) NOT NULL,
    pass_word VARCHAR(50) NOT NULL UNIQUE,
    Email VARCHAR(50) NOT NULL UNIQUE,
    phone VARCHAR(10)NOT NULL 
);