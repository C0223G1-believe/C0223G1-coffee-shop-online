CREATE DATABASE shop_cafe_online;
USE shop_cafe_online;
CREATE TABLE role (
id_role INT PRIMARY KEY,
name_role VARCHAR(20) NOT NULL
);
INSERT INTO role VALUES
(1,'admin'),
(2,'custormer');
CREATE TABLE `user`(
user_id INT PRIMARY KEY AUTO_INCREMENT,
user_name VARCHAR(50) NOT NULL UNIQUE,
user_password VARCHAR(100) NOT NULL,
user_email VARCHAR(50) NOT NULL UNIQUE,
user_phone_number VARCHAR(20) NOT NULL UNIQUE,
id_role INT DEFAULT'2',
FOREIGN KEY ( id_role ) REFERENCES role (id_role) ON DELETE SET NULL
);
INSERT INTO `user`(user_name,user_password,user_email,user_phone_number,id_role) VALUES
('admin','123','thanhson@gmail.com','1',1);
INSERT INTO `user`(user_name,user_password,user_email,user_phone_number) VALUES
('thanhson','123','son@gmail.com','2'),
('vietcao','123456','vietcao@gmail.com','0233701720'),
('ngocsang','123456','ngocsang@gmail.com','0220193749'),
('haithanh','123456','haithanh@gmail.com','0232903819'),
('chanh','123456','chanh@gmail.com','0228018230');

CREATE TABLE product_type (
    product_type_id INT PRIMARY KEY AUTO_INCREMENT,
    product_type_name VARCHAR(50) NOT NULL

);
INSERT INTO product_type (product_type_name) VALUES
('Traditional Coffee'),
('Machine Coffee'),
('Tea'),
('Juice');
CREATE TABLE product (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(50) NOT NULL,
    product_price DOUBLE NOT NULL,
    product_description VARCHAR(200),
    product_image TEXT,
    product_type_id int,
    foreign key (product_type_id) references product_type(product_type_id) ON DELETE SET NULL
);

INSERT INTO product(product_name,product_price,product_description,product_image,product_type_id) VALUES
('Black Coffee ',17000,'Coffee and suger','img/1479133216-5745aa499882e46721b6545bb1c38bb0.jpg',1),
('Milk Coffee ',17000,'Coffee and condensed milk','img/omd33.jpg',1),
('SaiGon Black Coffee ',17000,'Coffee and suger then shake','img/ca-phe-sai-gon-saigon-coffee-gac-mang-re-cafe-kontum-kon-tum-gacmangre-2.jpg',1),
('SaiGon Milk Coffee ',17000,'Coffee and condensed milk then shake','img/ca-phe-sai-gon-saigon-coffee-gac-mang-re-cafe-kontum-kon-tum-gacmangre-2.jpg',2),
('Salt Coffee ',17000,'Coffee,condensed milk,rich,salt,base cream','images/coffee/11.-Ca-phe-muoi.png',2),
('Egg Coffee',17000,'Coffee,condensed milk,rich,egg,base cream','images/coffee/11-cover5-10-40-10.jpg',2),
('Coconut Coffee',17000,'Milk,condensed milk,ice,coconut then blended','images/coffee/cach-pha-cafe-cot-dua.jpeg',3),
('White Coffee ',17000,'Coffee,condensed milk,milk','images/coffee/images (1).jpeg',3),
('Machine Coffee',17000,'Use machine coffee to make','img/b1.jpg',3),
('Machine Coffee',17000,'Use machine coffee to make','img/b1.jpg',4),
('Machine Coffee',17000,'Use machine coffee to make','img/b1.jpg',4),
('Machine Coffee',17000,'Use machine coffee to make','img/b1.jpg',4);

CREATE TABLE `order` (
order_id INT PRIMARY KEY AUTO_INCREMENT,
order_date DATETIME NOT NULL,
`comment` VARCHAR(100),
address VARCHAR(50) NOT NULL,
user_id INT,
FOREIGN KEY (user_id) REFERENCES `user` (user_id) ON DELETE SET NULL
);
CREATE TABLE detail_order (
detail_order_id INT PRIMARY KEY AUTO_INCREMENT,
quality INT,
order_id INT NULL,
FOREIGN KEY (order_id) REFERENCES `order`(order_id)  ON DELETE SET NULL ,
product_id INT NULL,
FOREIGN KEY (product_id) REFERENCES product (product_id) ON DELETE SET NULL 
);