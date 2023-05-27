CREATE DATABASE shop_cafe_online;
USE shop_cafe_online;
create table Product(
ProductID varchar(45) primary key ,
ProductName varchar(45),
`Description` varchar(100),
Price double,
Stock int
); 