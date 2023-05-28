CREATE DATABASE shop_cafe_online;
USE shop_cafe_online;
create table type_user (
id_type_user int primary key,
name_type varchar(20) not null
);
create table `user`(
user_id int primary key,
user_name varchar(50) not null unique,
user_password varchar(100) not null[]
user_email varchar(50) not null unique,
user_phone_number varchar(20) unique,
id_type_user int,
foreign key ( id_type_user ) references type_user (id_type_user) on delete set null
);
create table product (
product_id int primary key auto_increment,
product_name varchar(50) not null,
product_price double not null,
product_description varchar(200),
product_image varchar(500)
);
create table order_status (
status_id int primary key,
`status` varchar(50) not null
);
create table `order` (
order_id int primary key auto_increment,
order_date datetime not null,
`comment` varchar(100),
address varchar(50) not null,
user_id int,
foreign key (user_id) references `user` (user_id) on delete set null,
status_id int,
foreign key(status_id) references order_status (status_id) on delete set null
);

create table detail_order (
detail_order_id int primary key,
quality int,
order_id int,
foreign key (order_id) references `order`(order_id),
product_id int,
foreign key (product_id) references product (product_id)
);


