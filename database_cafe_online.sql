CREATE DATABASE shop_cafe_online;
USE shop_cafe_online;
CREATE TABLE type_user (
id_type_user INT PRIMARY KEY,
name_type VARCHAR(20) NOT NULL
);
CREATE TABLE `user`(
user_id INT PRIMARY KEY,
user_name VARCHAR(50) NOT NULL UNIQUE,
user_password VARCHAR(100) NOT NULL,
user_email VARCHAR(50) NOT NULL UNIQUE,
user_phone_number VARCHAR(20) UNIQUE,
id_type_user INT DEFAULT'2',
FOREIGN KEY ( id_type_user ) REFERENCES type_user (id_type_user) ON DELETE SET NULL
);
CREATE TABLE product (
product_id INT PRIMARY KEY AUTO_INCREMENT,
product_name VARCHAR(50) NOT NULL,
product_price DOUBLE NOT NULL,
product_description VARCHAR(200),
product_image VARCHAR(500)
);
CREATE TABLE order_status (
status_id INT PRIMARY KEY,
`status` VARCHAR(50) NOT NULL
);
CREATE TABLE `order` (
order_id INT PRIMARY KEY AUTO_INCREMENT,
order_date DATETIME NOT NULL,
`comment` VARCHAR(100),
address VARCHAR(50) NOT NULL,
user_id INT,
FOREIGN KEY (user_id) REFERENCES `user` (user_id) ON DELETE SET NULL,
status_id INT,
FOREIGN KEY(status_id) REFERENCES order_status (status_id) ON DELETE SET NULL
);

CREATE TABLE detail_order (
detail_order_id INT PRIMARY KEY,
quality INT,
order_id INT,
FOREIGN KEY (order_id) REFERENCES `order`(order_id),
product_id INT,
FOREIGN KEY (product_id) REFERENCES product (product_id)
);


