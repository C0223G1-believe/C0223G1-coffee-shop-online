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
    id INT PRIMARY KEY AUTO_INCREMENT,
    product_type_name VARCHAR(50) NOT NULL
);
INSERT INTO product_type (product_type_name) VALUES 
('coffee'),
('coffee milk');
CREATE TABLE product (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(50) NOT NULL,
    product_price DOUBLE NOT NULL,
    product_description VARCHAR(200),
    product_image TEXT
);

INSERT INTO product(product_name,product_price,product_description,product_image) VALUES
('Cà phê sữa pha máy',17000,'Cà phê được pha chế tại quán','images/coffee/images.jpeg'),
('Cà phê sữa pha phin',17000,'Cà phê được pha chế tại quán','images/coffee/images (1).jpeg'),
('Cà phê đen sài gòn',17000,'Cà phê được pha chế tại quán','images/coffee/images (2).jpeg'),
('Cà phê sữa sài gòn',17000,'Cà phê được pha chế tại quán','images/coffee/images (3).jpeg'),
('Cà phê muối',17000,'Cà phê được pha chế tại quán','images/coffee/moi-la-voi-cong-thuc-lam-ca-phe-matcha-thom-ngon-khong-tuong-202206060951298564.jpeg'),
('Cà phê trứng',17000,'Cà phê được pha chế tại quán','images/coffee/tải xuống.jpeg'),
('Cà phê dừa',17000,'Cà phê được pha chế tại quán','images/coffee/tải xuống (2).jpeg'),
('Bạc xỉu',17000,'Bạc xỉu được pha chế tại quán','images/coffee/tải xuống (1).jpeg'),
('Capuchino',17000,'Capuchino được pha chế tại quán','images/coffee/tải xuống (1).jpeg');

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

