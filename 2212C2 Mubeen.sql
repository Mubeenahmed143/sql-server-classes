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

--FULL JOIN --
select * from students full join course on course.cid = students.cid;

drop table students;
drop table course;

--SELF JOIN --

-- Create the Employees table

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    Name NVARCHAR(50),
    ManagerID INT,
    FOREIGN KEY (ManagerID) REFERENCES Employees(EmployeeID)
);

-- Insert 20 records into the Employees table

INSERT INTO Employees (EmployeeID, Name, ManagerID)
VALUES 
    (1, 'John Doe', NULL),  -- Assuming John Doe is the CEO (top-level employee)
    (2, 'Jane Smith', 1),   -- Jane Smith reports to John Doe
    (3, 'Michael Johnson', 1),  -- Michael Johnson also reports to John Doe
    (4, 'Emily Davis', 2),  -- Emily Davis reports to Jane Smith
    (5, 'David Brown', 2),  -- David Brown also reports to Jane Smith
    (6, 'Sarah Lee', 3),    -- Sarah Lee reports to Michael Johnson
    (7, 'Kevin Wilson', 3), -- Kevin Wilson also reports to Michael Johnson
    (8, 'Lisa Taylor', 4),  -- Lisa Taylor reports to Emily Davis
    (9, 'Robert Martinez', 5), -- Robert Martinez reports to David Brown
    (10, 'Amanda Robinson', 5), -- Amanda Robinson also reports to David Brown
    (11, 'Daniel Garcia', 6), -- Daniel Garcia reports to Sarah Lee
    (12, 'Olivia Rodriguez', 6), -- Olivia Rodriguez also reports to Sarah Lee
    (13, 'William Hernandez', 7), -- William Hernandez reports to Kevin Wilson
    (14, 'Mia Lopez', 7), -- Mia Lopez also reports to Kevin Wilson
    (15, 'Ethan Gonzalez', 8), -- Ethan Gonzalez reports to Lisa Taylor
    (16, 'Chloe Perez', 8), -- Chloe Perez also reports to Lisa Taylor
    (17, 'Alex Evans', 9), -- Alex Evans reports to Robert Martinez
    (18, 'Sophia Turner', 9), -- Sophia Turner also reports to Robert Martinez
    (19, 'Matthew Collins', 10), -- Matthew Collins reports to Amanda Robinson
    (20, 'Isabella Stewart', 10); -- Isabella Stewart also reports to Amanda Robinson

-- Verify the records inserted

-- self join command --
SELECT * FROM Employees;

select * from Employees as T1 inner join Employees as T2 on T1.EmployeeID = T2.ManagerID;

select T1.EmployeeID as ID, T1.Name as Leader , T2.Name as Worker from Employees as T1 inner join Employees as T2 on T1.EmployeeID = T2.ManagerID;



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
	-- => count --
	select count(Price) as Total_Price from Products;

	-- => sum --
		select sum(Price) as Total_Sum from Products;

		-- => min --
			select min(Price) as Starting_Price from Products;

			-- => max --
				select max(Price) as Highest_Price from Products;

				-- => avg --
					select avg(Price) as Avg_Price from Products;

         select sum(Price) as Total_Price from Products where Category = 'Appliances';

					-- group by clause with aggregate function --
				select sum(Price) as Total_Price from Products  group by Category;

					select sum(Price) as Total_Price from Products where Category = 'Furniture' group by Category;

				select sum(Price) as Total_Price , Category from Products group by Category;

					select max(Price) as Highest_Price , Category from Products group by Category;

				select min(Price) as Lowest_Price , Category from Products group by Category;

					select avg(Price) as Average_Price , Category from Products group by Category;

					-- GROUP BY CLAUSE WITH HAVING CLAUSE AND WHERE CLAUSE --
		select ProductName,max(Price) as Highest_Price, Category from Products where Category = 'Electronics' group by ProductName, Category, Price having Price > 200 ;

		                    --HAVING CLAUSE WITH ORDER BY CLAUSE --
				select ProductName,min(Price) as Highest_Price, Category from Products  group by ProductName, Category, Price having Price < 500 order by Price asc ;

		select ProductName,min(Price) as Highest_Price, Category from Products  group by ProductName, Category, Price having Price < 500 order by Price desc ;

				select Category,mAX(Price) as Highest_Price from Products  group by Category, Price having Price < 500 order by Category asc ;

				-- SUBQUERY --
				select * from Products where Price = (SELECT max(Price) from Products); 
				--check--
				select max(Price) from Products;

				-- subquery with (in) operator --
				select ProductName , Price from Products where Price in (select Price from Products where Price >=500) order by Price asc;

				select ProductName, Price, Category from Products where ProductID  in (select ProductID from Products where Category = 'Electronics');

				-- IN => In multiple rows ke lye use hota hai --
				-- (=) => = single row print krta hai   --

				--create login ID for user--
				create login zaid with password = 'zaid';

				create user zaid for login zaid;
				go

				select * from Products;

				--grant acess deta hai (Permission)--
				grant select on Products to mubeen;

				grant update on Products to mubeen;

				--revoke acess wapas leta hai (grant opposite)--
				revoke update on Products from mubeen;

				--Functions (block of code ko reuse krne ke lye)--

				--Scaler Function
				create function StudentName ()
				returns varchar(255)
				begin 
				return 'mubeen ahmed' ;
				end

				select dbo.StudentName() as Student

				--second example --
				create function Price()
				returns int
				begin 
				return 290.00
				end

				select dbo.Price() as FixedPrice

				--parameterize functions--
				create function addition(@num1 int , @num2 int)
				returns int 
				begin 
				return @num1 + @num2 ;
				end
				select dbo.addition(3,5);

				--second example with alter --
				alter function sub(@num1 int , @num2 int )
				returns int
				begin 
				return @num1 * @num2 ;
				end
				select dbo.sub(5,4) as subtraction;

				--third example--
				create function emp(@name1 varchar(255) , @name2 varchar(255) )
				returns varchar(255)
				begin 
				return @name1 + @name2 ;
				end
				select dbo.emp('sheikh ',' sahab') as Employee;

				--stored procedure--
				create proc tab

				as
				begin

			select * from course;
select * from students;
SELECT * FROM Employees;
				select * from Products
				
				end
				go

				 exec tab;

				 --stored procedure output parameter--
				  create proc sp_data
				  @name NVARCHAR(100)
				  as
				  begin

				  select * from Products where ProductName=@name

				  end 
				  go

				  exec sp_data 'Laptop'
				  --e.g--
				alter proc sp_mydata
				  @abc NVARCHAR(50)
				  as
				  begin

				  select * from Products where Category=@abc

				  end 
				  go

				  exec sp_mydata 'Electronics';

				 --stored procedure output parameter with like --
				  	 create proc wild_cards
				  @abc NVARCHAR(50)
				  as
				  begin

				  select * from Products where Category like @abc

				  end 
				  go

				  exec wild_cards 'h%'

				  --insert--
				 create procedure sp_productinsert
				 (
				 @ProductID INT ,
                 @ProductName NVARCHAR(100),
                 @Category NVARCHAR(50),
                 @Price DECIMAL(10, 2)
				
				 )
				 as 
				 begin 
				 insert into Products values(@ProductID, @ProductName, @Category, @Price)
				 end 
				 go

				 exec sp_productinsert '31','Pen','Stationary','200' ;

				 --update--
				 alter proc sp_proupdate
				 @ProductID INT,
				 @ProductName NVARCHAR(100)
				 as 
				 begin

				UPDATE Products SET ProductName =@ProductName WHERE ProductID =@ProductID

				end
				go


				exec sp_proupdate '31' , 'INK PEN'

				--DELETE--
				 create proc sp_prodelete
				 @ProductID INT
				
				 as 
				 begin

				DELETE from Products where ProductID =@ProductID

				end
				go

				exec sp_prodelete 31;

				--view-- 

				CREATE TABLE Users (
    UserID INT PRIMARY KEY ,
    Username NVARCHAR(50) null,
    Email NVARCHAR(100)  null
);

INSERT INTO Users (UserID, Username, Email)
VALUES
    (1, 'JohnDoe', 'john.doe@example.com'),
    (2, 'JaneSmith', 'jane.smith@example.com'),
    (3, 'AliceJohnson', 'alice.johnson@example.com');

	SELECT * FROM Users;


	--select view--
				create view user_view 
				as
				SELECT * FROM Users
         
		 --insert view--
			  insert into user_view values (4 , 'Zaid' , 'zaidi@gmail.com')
			  
			  --update view--
			  update user_view set Username = 'Murtaza'  where UserID = 3 

			  --delete view--
			  delete from user_view where UserID=2

			  --create view with using joins --
			  create table Orders(
			  O_ID int primary key,
			  Order_Details nvarchar(50),
			  product_id int references Products(ProductID)
			  );
			  DROP TABLE Orders;

			  insert into Orders (O_ID,Order_Details,product_id) values(1,'delivered',4)
              insert into Orders values(2,'pending',2)
               insert into Orders values(3,'limited stock',1)
               insert into Orders values(4,'pending',5)
              insert into Orders values(6,'rejected',11);

			  select * from Orders;

			  create view Order_Detail
			  as
			  select ProductID,ProductName,Category, Order_Details
             from Products inner join Orders
           on Products.ProductID=Orders.product_id;

		   --select --
		   select * from Order_Details
            order by ProductID;

			--insert (does not inserting only checking)--
			insert into Order_Detail values (8 , 'face wash','limited');


			----------Triggers---------

			--After--
			create table EmployeeInfo
			(
			Emp_ID int ,
			Emp_Name varchar(200),
			Emp_Country varchar(100)
			);

			insert into EmployeeInfo values (107 , 'hassanbawla' , 'Dubai');

			delete from EmployeeInfo where Emp_ID = 104; 

			update EmployeeInfo Set Emp_Country = 'Ireland' where Emp_ID = 104;

			select * from EmployeeInfo;
			select * from Employee_Audit;

			create table Employee_Audit 
			(
			emp_id int,
			emp_name varchar(200),
			emp_country varchar(100),

			Audit_Action varchar(100),
			Action_Date Date
			);

			---insert--
			create Trigger T_After_INS
			ON EmployeeInfo
			for insert 
			AS
			  Begin 
			  Declare @E_ID int
			  Declare @E_Name varchar(200)
			  Declare @E_Country varchar(100)
			  Declare @Audit varchar(200)

			  select @E_ID = Emp_ID from inserted
			   select @E_Name = Emp_Name from inserted
			   select @E_Country = Emp_Country from inserted

				Set @Audit = 'Insert Action'

				insert into Employee_Audit (emp_id,emp_name,emp_country,Audit_Action,Action_Date)
				values (@E_ID,@E_Name,@E_Country,@Audit,getdate())

				End

				--delete--
				create Trigger T_After_Del
				on EmployeeInfo
				for delete 
				AS 
				Begin 
				Declare @E_ID int
			  Declare @E_Name varchar(200)
			  Declare @E_Country varchar(100)
			  Declare @Audit varchar(200)

			    select @E_ID = Emp_ID from deleted
			   select @E_Name = Emp_Name from deleted
			    select @E_Country = Emp_Country from deleted

				Set @Audit = 'Delete Action'

				insert into Employee_Audit (emp_id,emp_name,emp_country,Audit_Action,Action_Date)
				values (@E_ID,@E_Name,@E_Country,@Audit,getdate())

				End

				--update--
				alter Trigger T_After_Up
				on EmployeeInfo
				for update 
				AS 
				Begin
			  Declare @E_ID int
			  Declare @Audit varchar(100)
			  Declare @E_Name varchar(200)
			  Declare @E_N varchar(200)
			  Declare @E_Country varchar(100)
			  Declare @E_C varchar(100)

			    select @E_ID = Emp_ID from inserted
				Set @Audit = 'Update Action'
			   select @E_Name = Emp_Name from inserted
			   select @E_N=Emp_Name from deleted
			    select @E_Country = Emp_Country from inserted
				select @E_C=Emp_Country from deleted

					insert into Employee_Audit (emp_id,emp_name,emp_country,Audit_Action,Action_Date)
				values (@E_ID,' Update' + @E_Name+ ' Old' + @E_N,' Update' +@E_Country + 'Old' + @E_C,@Audit,getdate())
				end

	-----------------------------------------INSTEAD OF TRIGGERS-------------------------------------------------


				      ----------------------------Insert---------------------------
		create Trigger insert_trigger
		ON EmployeeInfo
		INSTEAD OF INSERT
		AS 

			Begin 

			          Declare @E_ID int
			          Declare @E_Name varchar(200)
			          Declare @E_Country varchar(100)
			          Declare @E_Audit varchar(200)

			          select @E_ID = Emp_ID from inserted
			          select @E_Name = Emp_Name from inserted
			          select @E_Country = Emp_Country from inserted
			
			          Set @E_Audit = 'Insert Action' 

				      insert into Employee_Audit (emp_id, emp_name, emp_country, Audit_Action, Action_Date)
				      values (@E_ID, @E_Name, @E_Country, @E_Audit, getdate())

		     End


			 	 ----------------------------Delete---------------------------
		create Trigger delete_trigger
		ON EmployeeInfo
		INSTEAD OF DELETE
		AS 

			Begin 

			          Declare @E_ID int
			          Declare @E_Name varchar(200)
			          Declare @E_Country varchar(100)
			          Declare @E_Audit varchar(200)

			          select @E_ID = Emp_ID from deleted
			          select @E_Name = Emp_Name from deleted
			          select @E_Country = Emp_Country from deleted
			
			          Set @E_Audit = 'Delete Action' 

				      insert into Employee_Audit (emp_id, emp_name, emp_country, Audit_Action, Action_Date)
				      values (@E_ID, @E_Name, @E_Country, @E_Audit, getdate())

		     End

			 	 ----------------------------Update---------------------------
		create Trigger update_trigger
		ON EmployeeInfo
		INSTEAD OF UPDATE
		AS 

			Begin 

			           Declare @E_ID int
			           Declare @Audit varchar(100)
			           Declare @E_Name varchar(200)
			           Declare @E_N varchar(200)
			           Declare @E_Country varchar(100)
			           Declare @E_C varchar(100)

			          
					  select @E_ID = Emp_ID from inserted 

				      Set @Audit = 'Update Action'

			          select @E_Name = Emp_Name from inserted
			          select @E_N=Emp_Name from deleted
			          select @E_Country = Emp_Country from inserted
				      select @E_C=Emp_Country from deleted

				      insert into Employee_Audit (emp_id,emp_name,emp_country,Audit_Action,Action_Date)
				      values (@E_ID,' Update' + @E_Name+ ' Old' + @E_N,' Update' +@E_Country + 'Old' + @E_C,@Audit,getdate())

		     End		
	

--------------------------------------------------------Transaction-----------------------------------------------------------------

---------------------------------------DEPOSIT AMOUNT----------------------------------------------
create table Bankacc
(
Acc_ID int primary key,
Acc_Holder varchar(255),
Amount int
);			

INSERT INTO Bankacc (Acc_ID, Acc_Holder, Amount)
VALUES
    (1, 'John Doe', 1000),
    (2, 'Jane Smith', 1500),
    (3, 'Michael Johnson', 2000),
    (4, 'Emily Davis', 1200),
    (5, 'Christopher Brown', 1800),
    (6, 'Jessica Wilson', 1300),
    (7, 'Daniel Taylor', 1700),
    (8, 'Sarah Martinez', 1900),
    (9, 'David Anderson', 1100),
    (10, 'Ashley Thomas', 1600);

	select * from Bankacc;

create procedure DepositTrans
(
    @id int,
	@amount int
	)
AS
BEGIN 
      BEGIN TRAN DT1
	              declare @num int 
			      select @num = count(*) from Bankacc where Acc_ID = @id
IF(@num = 0)
            BEGIN
			      print 'Record does not exist.......'
			      ROLLBACK TRAN DT1
			END
ELSE 
            BEGIN
			     update Bankacc set Amount = Amount + @amount where Acc_ID = @id
			     print 'Amount Deposited Successfully...'
			     COMMIT TRAN DT1
			END
	    END
		
-----------------WITHDRAW AMOUNT------------------------------
create procedure WithdrawTrans
(
    @id int,
	@amount int
	)
AS
BEGIN 
      BEGIN TRAN DT1
	               declare @num int 
			       select @num = count(*) from Bankacc where Acc_ID = @id
IF(@num = 0)
            BEGIN
			     print 'Record does not exist.......'
			     ROLLBACK TRAN DT1
			END
ELSE 
         BEGIN
			  declare @currentBalance int
			  select @currentBalance = Amount from Bankacc where  Acc_ID = @id
IF(@currentBalance < @amount)
            BEGIN
			     print 'Your Current Balance is less than your desired withdrawal Amount...'
			     ROLLBACK TRAN DT1
	 		END
         END 
IF (@amount <= @currentBalance)
         BEGIN
		      update Bankacc set Amount = Amount - @amount where Acc_ID = @id
		      print 'Amount Withdrawl Successfully...'
		      COMMIT TRAN DT1
		 END
    END

	EXEC DepositTrans 2,25000;
    EXEC WithdrawTrans 7,700;

	---------------------------------------------------Sender,Reciever Transaction---------------------------------------------------------
create procedure SR_Trans
(
  @Source_ID int,
  @Source_Amount int,
  @Dest_ID int
)
AS
BEGIN
     BEGIN TRAN T1
	        declare @num1 int , @num2 int
			select @num1 = count(*) from Bankacc where Acc_ID = @Source_ID
			select @num2 = count(*) from Bankacc where Acc_ID = @Dest_ID
	   IF(@num1 = 0 )
	   BEGIN
	        print 'Amount can not be transfered because Sender does not exist...'
	   END
	   ELSE IF(@num2 = 0 )
	   BEGIN
	        print 'Amount can not be transfered because Receiver does not exist...'
	   END
	   ELSE 
	   BEGIN
	        declare @currentBalance int
			select @currentBalance = Amount from Bankacc where Acc_ID = @Source_ID

	    IF (@currentBalance < @Source_Amount)
		BEGIN
		     print 'Transfer Amount EXCEEDS the Current Balance in your Amount...'
			 ROLLBACK TRAN T1
		END
	   END
	    IF(@Source_Amount <= @currentBalance)
		BEGIN
		     update Bankacc set Amount = Amount - @Source_Amount where Acc_ID = @Source_ID
		     update Bankacc set Amount = Amount + @Source_Amount where Acc_ID = @Dest_ID
			 print 'Amount Transfered Successfully...THANK YOU!'
			 declare @newBalance_S int , @newBalance_D int 
			 select @newBalance_S = Amount from Bankacc where  Acc_ID = @Source_ID
			 select @newBalance_D = Amount from Bankacc where  Acc_ID = @Dest_ID
			 print 'Dear Sender, Your Current Balance is now ' + cast(@newBalance_S as varchar)
			 print 'Dear Reciever, Your Current Balance is now ' + cast(@newBalance_D as varchar)

			 COMMIT TRAN T1

		END

	 END


	 ---------------------------------- CLASS TASK [Check Account Balance]--------------------------------- 
	 ALTER procedure Check_Balance
(
    @id int
	)
AS
BEGIN 
      BEGIN TRAN DT1
	              DECLARE @Balance INT
			    select @Balance = count(*) from Bankacc where Acc_ID = @id
 IF(@Balance = 0 )
	   BEGIN
	        print 'Your Account does not Exists...'
				 ROLLBACK TRAN DT1
	   END
	    ELSE 
	   BEGIN
	        declare @currentBalance int
			select @currentBalance = Amount from Bankacc where Acc_ID = @id
			   PRINT 'Your Account Balance is: ' + CAST(@CurrentBalance AS VARCHAR) + '...'
			   COMMIT TRAN DT1
	    END
	END
	
	EXEC Check_Balance 1;

--------------------------------------INDEXES------------------------------------------------


EXEC sys.sp_helpindex @objname = N'Employees';
