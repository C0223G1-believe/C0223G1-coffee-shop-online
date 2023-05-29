CREATE DATABASE shop_cafe_online;
USE shop_cafe_online;
CREATE TABLE type_user (
id_type_user INT PRIMARY KEY,
name_type VARCHAR(20) NOT NULL
);
INSERT INTO type_user VALUES
(1,'admin'),
(2,'custormer');
CREATE TABLE `user`(
user_id INT PRIMARY KEY AUTO_INCREMENT,
name_user VARCHAR(50) NOT NULL,
user_name VARCHAR(50) NOT NULL UNIQUE,
user_password VARCHAR(100) NOT NULL,
user_email VARCHAR(50) NOT NULL UNIQUE,
user_phone_number VARCHAR(20) NOT NULL UNIQUE,
id_type_user INT DEFAULT'2',
FOREIGN KEY ( id_type_user ) REFERENCES type_user (id_type_user) ON DELETE SET NULL
);
INSERT INTO `user`(name_user,user_name,user_password,user_email,user_phone_number,id_type_user) VALUES
('admin','admin','123abc','thanhson@gmail.com','0987247581',1);
INSERT INTO `user`(name_user,user_name,user_password,user_email,user_phone_number) VALUES
('Thanh Son','thanhson','123456','son@gmail.com','0238495786'),
('Viết Cao','vietcao','123456','vietcao@gmail.com','0233701720'),
('Ngọc Sang','ngocsang','123456','ngocsang@gmail.com','0220193749'),
('Hải Thành','haithanh','123456','haithanh@gmail.com','0232903819'),
('Chánh','chanh','123456','chanh@gmail.com','0228018230');
CREATE TABLE product (
product_id INT PRIMARY KEY AUTO_INCREMENT,
product_name VARCHAR(50) NOT NULL,
product_price DOUBLE NOT NULL,
product_description VARCHAR(200),
product_image VARCHAR(500)
);
INSERT INTO product(product_name,product_price,product_description,product_image) VALUES
('Cà phê sữa pha máy',17000,'Cà phê được pha chế tại quán',''),
('Cà phê sữa pha phin',17000,'Cà phê được pha chế tại quán',''),
('Cà phê đen sài gòn',17000,'Cà phê được pha chế tại quán',''),
('Cà phê sữa sài gòn',17000,'Cà phê được pha chế tại quán',''),
('Cà phê muối',17000,'Cà phê được pha chế tại quán',''),
('Cà phê trứng',17000,'Cà phê được pha chế tại quán',''),
('Cà phê dừa',17000,'Cà phê được pha chế tại quán',''),
('Bạc xỉu',17000,'Bạc xỉu được pha chế tại quán',''),
('Capuchino',17000,'Capuchino được pha chế tại quán',''),
('Ép ổi',20000,'Nước Ép ổi được làm tại quần pha chế',''),
('Ép cốc',20000,'Nước Ép Cốc được làm tại quần pha chế',''),
('Ép táo',20000,'Nước Ép Táo được làm tại quần pha chế',''),
('Ép dâu',20000,'Nước Ép dâu được làm tại quần pha chế',''),
('Ép thơm',20000,'Nước Ép Thơm được làm tại quần pha chế',''),
('Ép cà rốt',20000,'Nước Ép Cà rốt được làm tại quần pha chế',''),
('Ép dưa lưới',20000,'Nước Ép Dưa lưới được làm tại quần pha chế',''),
('Dâu',20000,'Trà Dâu được làm tại quần pha chế',''),
('Đào',20000,'Trà Đào được làm tại quần pha chế',''),
('Chanh',20000,'Trà Chanh được làm tại quần pha chế',''),
('Tắc',20000,'Trà Tắc được làm tại quần pha chế',''),
('Matcha Trà Xanh',20000,'Trà Matcha Trà Xanh được làm tại quần pha chế',''),
('Trà sữa',20000,'Trà Sữa được làm tại quần pha chế',''),
('Trà thảo mộc',20000,'Trà Thảo Mộc được làm tại quần pha chế',''),
('Việt Quất',20000,'Soda Việt Quất được làm tại quần pha chế',''),
('Kiwi',20000,'soda Kiwi được làm tại quần pha chế',''),
('Chanh',20000,'Soda Chanh được làm tại quần pha chế',''),
('Chanh leo',20000,'Soda Chanh Leo được làm tại quần pha chế','');
CREATE TABLE order_status (
status_id INT PRIMARY KEY,
`status` VARCHAR(50) NOT NULL
);
INSERT INTO order_status VALUES
(1,'chưa đặt'),	
(2,'đã đặt');	
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
order_id INT NULL,
FOREIGN KEY (order_id) REFERENCES `order`(order_id)  ON DELETE SET NULL ,
product_id INT NULL,
FOREIGN KEY (product_id) REFERENCES product (product_id) ON DELETE SET NULL 
);

