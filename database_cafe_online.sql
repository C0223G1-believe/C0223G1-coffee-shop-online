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
('Black Coffee',5,'Coffee and suger','images/coffee/ca-phe-den.jpg',1),
('Milk Coffee',7,'Coffee and condensed milk','images/coffee/ca-phe-sua.jpg',1),
('SaiGon Black Coffee',10,'Coffee and suger then shake','images/coffee/ca-phe-den-sai-gon.jpg',1),
('SaiGon Milk Coffee',12,'Coffee and condensed milk then shake','images/coffee/ca-phe-sua-sai-gon.jpg',1),
('Peach Tea',15,'Peach tea bags,sugar,lemon,syrup peach','images/tea/tra-dao.jpg',3),
('Lychee Tea',15,'Lychee tea bags,sugar,lemon,syrup lychee','images/tea/tra-vai.webp',3),
('Mango Tea',15,'Jasmine tea,sugar,lemon,mango jam','images/tea/tra-xoai.png',3),
('Latte',20,'Use machine coffee to make and fresh milk','images/machine_coffee/latte.jpg',2),
('Cappuccino',20,'Use machine coffee to make and fresh milk','images/machine_coffee/cappuccino.jpg',2),
('Tomato Juice',17,'Fresh tomato and sugar or condensed milk','images/juice/nuoc-ep-ca-chua.jpg',4),
('Orange Juice',17,'Orange and sugar','images/juice/nuoc-ep-cam.jpg',4),
('Pineapple Juice',17,'Pineapple and sugar','images/juice/nuoc-ep-thom.jpg',4);
CREATE TABLE `status` (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name_status VARCHAR(50)
);
INSERT INTO status (name_status) VALUES 
('Đã đặt hàng'),
('Đã xuất hàng'),
('Đã giao hàng');
CREATE TABLE `order` (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    order_date DATETIME NOT NULL,
    `comment` VARCHAR(100),
    address VARCHAR(50) NOT NULL,
    user_id INT NULL,
    FOREIGN KEY (user_id)
        REFERENCES `user` (user_id)
        ON DELETE SET NULL,
    id_status INT NULL DEFAULT'1', FOREIGN KEY(id_status) REFERENCES `status`(id) ON DELETE SET NULL 
);

CREATE TABLE detail_order (
detail_order_id INT PRIMARY KEY AUTO_INCREMENT,
quality INT,
order_id INT NULL,
FOREIGN KEY(order_id) REFERENCES `order`(order_id)  ON DELETE SET NULL ,
product_id INT NULL,
FOREIGN KEY(product_id) REFERENCES product(product_id) ON DELETE SET NULL 
);
DELIMITER //
CREATE PROCEDURE sp_find_order_by_id(in id int)
BEGIN
SELECT * FROM `order` as o
 JOIN detail_order as detail on detail.order_id = o.order_id 
 JOIN product as pro on pro.product_id = detail.order_id
 JOIN `status` as sta on sta.id = o.id_status
 JOIN `user` on `user`.user_id = o.user_id WHERE o.order_id ;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE sp_delete_order_detail_order(in id int)
BEGIN
DELETE FROM detail_order WHERE order_id = id ;
DELETE FROM `order` WHERE order_id = id ;
END //
DELIMITER ;