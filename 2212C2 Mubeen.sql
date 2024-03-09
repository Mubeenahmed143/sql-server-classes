create database class;
use class;

--new work--


create table students(
id int,
name varchar(255),
email varchar(255),
pass varchar(255),
gender varchar(255)
);


create table course(
cid int not null unique identity,
cname varchar(255) not null,
fname varchar(255) not null unique,
city varchar(50) not null default'Karachi'
);

insert into students(name,email,pass,gender)values
(1,'ahtesham','aht@gmail.com','123','male'),
(2,'shahheer','shah@gmail.com','sha12','male'),
(3,'saneha','saneha@gmail.com','saneha1','female'),
(4,'areeqa','areeqa@gmail.com','areeqa','male'),
(5,'hassan','hasu@gmail.com','hasu1','male')
;


insert into course(cname,fname,city)values
('php','ebadudin','lahore'),
('javascript','usama','islamabad'),
('html','haris','umarkot'),
('sqlserver','madam hanif','hydrabad')
;
insert into course(cname,fname)values
('css','owias')
;

select * from course;
select * from students;

-- column ko add krne ke lye --
alter table students add addreess int;

-- column ki datatype change krne ke lye --
alter table students alter column addreess varchar (50); 

--specific column delete krne ke lye -- 
alter table students drop column addreess; 

-- column ka name change krne  ke lye ye command use hoti hai --
EXEC sp_rename 'students.addreess' , 'address' , 'COLUMN';

-- drop table ko delete krta hai -- 
drop table students;
drop table course;

-- table ke under ka records delete kr deta hai --
truncate table students;

--chat gpt records with like operator

-- Create a table
CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName NVARCHAR(100),
    Category NVARCHAR(50),
    Price DECIMAL(10, 2)
);

-- Insert 30 records of data
INSERT INTO Products (ProductID, ProductName, Category, Price)
VALUES 
    (1, 'Keyboard', 'Electronics', 29.99),
    (2, 'Mouse', 'Electronics', 14.99),
    (3, 'Monitor', 'Electronics', 199.99),
    (4, 'Desk', 'Furniture', 149.99),
    (5, 'Chair', 'Furniture', 79.99),
    (6, 'Laptop', 'Electronics', 899.99),
    (7, 'Headphones', 'Electronics', 49.99),
    (8, 'Printer', 'Electronics', 159.99),
    (9, 'Table', 'Furniture', 99.99),
    (10, 'TV', 'Electronics', 699.99),
    (11, 'Phone', 'Electronics', 499.99),
    (12, 'Sofa', 'Furniture', 599.99),
    (13, 'Camera', 'Electronics', 299.99),
    (14, 'Bookshelf', 'Furniture', 79.99),
    (15, 'Speakers', 'Electronics', 129.99),
    (16, 'Microwave', 'Appliances', 129.99),
    (17, 'Toaster', 'Appliances', 34.99),
    (18, 'Blender', 'Appliances', 49.99),
    (19, 'Vacuum Cleaner', 'Appliances', 199.99),
    (20, 'Rug', 'Home Decor', 69.99),
    (21, 'Painting', 'Home Decor', 149.99),
    (22, 'Clock', 'Home Decor', 24.99),
    (23, 'Couch', 'Furniture', 499.99),
    (24, 'Bed', 'Furniture', 399.99),
    (25, 'Dining Table', 'Furniture', 299.99),
    (26, 'Chair Set', 'Furniture', 199.99),
    (27, 'Refrigerator', 'Appliances', 799.99),
    (28, 'Freezer', 'Appliances', 499.99),
    (29, 'Washing Machine', 'Appliances', 699.99),
    (30, 'Dryer', 'Appliances', 599.99);


	select * from Products;

	alter table Products add Quantity int;

	--with relatinal operator " < , > , = , >= , <= , !=" AND logical operator "AND , OR , NOT "  --
	select * from Products where ProductID >= 5 AND ProductID <= 10 ;

	--retrieve records whose name start with any alphabets and last sign %--
	select * from Products where ProductName like 'd%' ;

	--retrieve records whose name end with any alphabets and start sign %--
	select * from Products where ProductName like '%e' ;

	--find any values that have "any alphabet" in any position and start and end with type alphabets in between sign %--
	select * from Products where ProductName like '%e%' ;

	--retrieve records whose given name 1 charactor length any alphabets and e.g %s_--
	select * from Products where ProductName like '%s_' ;

	--retrieve records whose given name 2 charactor length any alphabets and e.g %s__--
	select * from Products where ProductName like '%s__' ;

	--update command --
	UPDATE Products SET ProductName = 'LED' WHERE ProductID = '3';

	UPDATE Products SET Quantity = 10 ;

	--DELETE COMMAND --
	DELETE from Products where ProductID = '30';