create database class;
use class;

--new work--


create table students(
id int not null unique identity,
name varchar(255) not null,
email varchar(255) not null,
pass varchar(255) not null,
gender varchar(255) not null,
cid int not null,
foreign key (cid) references course(cid)
);


create table course(
cid int not null unique identity,
cname varchar(255) not null,
fname varchar(255) not null unique,
city varchar(50) not null default'Karachi'
);

insert into students(name, email, pass, gender, cid )values
('ahtesham','aht@gmail.com','123','male',2),
('shahheer','shah@gmail.com','sha12','male',4),
('saneha','saneha@gmail.com','saneha1','female',1),
('areeqa','areeqa@gmail.com','areeqa','male',3),
('hassan','hasu@gmail.com','hasu1','male',5)
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

insert into course(cname,fname,city)values
('asp.net','mubeen','multan');

select * from course;
select * from students;

--JOINS START --

-- INNER JOIN --
select * from students inner join course on course.cid = students.cid ;

-- INNER JOIN WITH ALISE NAME --
select * from students as std inner join course as cors on cors.cid = std.cid ;

-- INNER JOIN WITH SELECTED COLUMNS --
select id , name , cname , fname from students as std inner join course as cors on cors.cid = std.cid ;

-- RIGHT JOIN --
select * from students right join course on course.cid = students.cid ;

-- LEFT JOIN --
select * from students left join course on course.cid = students.cid ;



drop table students;
drop table course;


-- column ko add krne ke lye --
alter table students add addreess int;

-- column ki datatype change krne ke lye --
alter table students alter column addreess varchar (50); 

--specific column delete krne ke lye -- 
alter table students drop column addreess; 

-- column ka name change krne  ke lye ye command use hoti hai --
EXEC sp_rename 'students.addreess' , 'address' , 'COLUMN';

-- drop table ko delete krta hai -- 

-- table ke under ka records delete kr deta hai --
truncate table students;

--chat gpt records --

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

	-- IN => multiple values  ko print krne ke lye --
	select * from Products where Price in(399.99, 799.99);

	-- between => range ke lye use hota hai --
	select * from Products where Price between 200 AND 800;

	-- order by => tarteeb (line wise) se print hota hai --
	select * from Products where Price between 200 AND 800 order by Price;

	--with relatinal operator " < , > , = , >= , <= , !=" AND logical operator "AND , OR , NOT "  --
	select * from Products where ProductID >= 5 AND ProductID <= 10 ;

	--with relatinal operator " < , > , = , >= , <= , !=" AND logical operator "AND , OR , NOT "  --
	select * from Products where (ProductName = 'Bed' OR ProductName = 'Mouse') AND Category = 'Furniture' ;

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

	-- Aggregate function (count, max, min, sum, avg) --

	select count(Price) as Total_Price from Products;

		select sum(Price) as Total_Sum from Products;

			select min(Price) as Starting_Price from Products;

				select max(Price) as Highest_Price from Products;

					select avg(Price) as Avg_Price from Products;