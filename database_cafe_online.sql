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
CREATE TABLE product_type (
    id INT PRIMARY KEY AUTO_INCREMENT,
    product_type_name VARCHAR(50) NOT NULL
);
INSERT INTO product_type(product_type_name) VALUES
('Coffee'),
('Nước Ép'),
('Trà'),
('Soda'),
('Kem');
CREATE TABLE product (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(50) NOT NULL,
    product_price DOUBLE NOT NULL,
    product_description VARCHAR(200),
    product_image TEXT,
    product_type_id INT ,
    FOREIGN KEY (product_type_id)
        REFERENCES product_type (id)
        ON DELETE SET NULL
);

INSERT INTO product(product_name,product_price,product_description,product_image,product_type_id) VALUES
('Cà phê sữa pha máy',17000,'Cà phê được pha chế tại quán','images/coffee/images.jpeg',1),
('Cà phê sữa pha phin',17000,'Cà phê được pha chế tại quán','webapp/images/coffee/images (1).jpeg',1),
('Cà phê đen sài gòn',17000,'Cà phê được pha chế tại quán','webapp/images/coffee/images (2).jpeg',1),
('Cà phê sữa sài gòn',17000,'Cà phê được pha chế tại quán','webapp/images/coffee/images (3).jpeg',1),
('Cà phê muối',17000,'Cà phê được pha chế tại quán','webapp/images/coffee/moi-la-voi-cong-thuc-lam-ca-phe-matcha-thom-ngon-khong-tuong-202206060951298564.jpeg',1),
('Cà phê trứng',17000,'Cà phê được pha chế tại quán','webapp/images/coffee/tải xuống.jpeg',1),
('Cà phê dừa',17000,'Cà phê được pha chế tại quán','webapp/images/coffee/tải xuống (2).jpeg',1),
('Bạc xỉu',17000,'Bạc xỉu được pha chế tại quán','webapp/images/coffee/tải xuống (1).jpeg',1),
('Capuchino',17000,'Capuchino được pha chế tại quán','webapp/images/coffee/tải xuống (1).jpeg',1),
('Ép ổi',20000,'Nước Ép ổi được làm tại quần pha chế','webapp/images/nuoc_ep/tải xuống.jpeg',2),
('Ép cốc',20000,'Nước Ép Cốc được làm tại quần pha chế','webapp/images/nuoc_ep/images (1).jpeg',2),
('Ép táo',20000,'Nước Ép Táo được làm tại quần pha chế','webapp/images/nuoc_ep/images (3).jpeg',2),
('Ép dâu',20000,'Nước Ép dâu được làm tại quần pha chế','webapp/images/nuoc_ep/nuoc-ep-dau-tay-1.jpg',2),
('Ép thơm',20000,'Nước Ép Thơm được làm tại quần pha chế','webapp/images/nuoc_ep/images (2).jpeg',2),
('Ép cà rốt',20000,'Nước Ép Cà rốt được làm tại quần pha chế','webapp/images/nuoc_ep/images.jpeg',2),
('Ép dưa lưới',20000,'Nước Ép Dưa lưới được làm tại quần pha chế','webapp/images/nuoc_ep/images (5).jpeg',2),
('Dâu',20000,'Trà Dâu được làm tại quần pha chế','webapp/images/trà/cach-lam-tra-dau-ngam-ngon-nhu-tra-dau-dong-du-04.jpg',3),
('Đào',20000,'Trà Đào được làm tại quần pha chế','webapp/images/trà/tra-dao.jpg',3),
('Chanh',20000,'Trà Chanh được làm tại quần pha chế','webapp/images/trà/tải xuống (3).jpeg',3),
('Tắc',20000,'Trà Tắc được làm tại quần pha chế','webapp/images/trà/images (1).jpeg',3),
('Matcha Trà Xanh',20000,'Trà Matcha Trà Xanh được làm tại quần pha chế','webapp/images/trà/tra-sua-thai-xanh.jpeg',3),
('Trà sữa',20000,'Trà Sữa được làm tại quần pha chế','webapp/images/trà/tải xuống (2).jpeg',3),
('Trà thảo mộc',20000,'Trà Thảo Mộc được làm tại quần pha chế','webapp/images/trà/images.jpeg',3),
('Việt Quất',20000,'Soda Việt Quất được làm tại quần pha chế','webapp/images/soda/2202140912-soda-viet-quat.webp',4),
('Kiwi',20000,'soda Kiwi được làm tại quần pha chế','webapp/images/soda/nuoc-soda-la-gi-cach-pha-che-soda-don-gian-giai-nhiet-mua-he-21.jpeg',4),
('Chanh',20000,'Soda Chanh được làm tại quần pha chế','webapp/images/soda/soda-chanh-tắc-recipe-main-photo.jpeg',4),
('Chanh leo',20000,'Soda Chanh Leo được làm tại quần pha chế','webapp/images/soda/soda-chanh-day_goc-ca-phe_5fa7c1246ff94f97a1b29c585a3baa2c_master.webp',4),
('Vani',20000,'Kem Vani được làm tại quần pha chế','webapp/images/ice_cream/bot-kem-tuoi2.jpeg',5),
('Sầu Riêng',20000,'Kem Sầu Riêng được làm tại quần pha chế','webapp/images/ice_cream/1-1200x676-9.jpeg',5),
('plan',20000,'Kem plan được làm tại quần pha chế','webapp/images/ice_cream/3.png',5),
('Bơ',20000,'Kem Bơ được làm tại quần pha chế','webapp/images/ice_cream/kem-bo.jpeg',5),
('Chocolate',20000,'Kem Chocolate được làm tại quần pha chế','webapp/images/ice_cream/cach-lam-5-mon-kem-trai-cay-giai-nhiet-ngay-he.jpeg',5);
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
detail_order_id INT PRIMARY KEY AUTO_INCREMENT,
quality INT,
order_id INT NULL,
FOREIGN KEY (order_id) REFERENCES `order`(order_id)  ON DELETE SET NULL ,
product_id INT NULL,
FOREIGN KEY (product_id) REFERENCES product (product_id) ON DELETE SET NULL 
);

