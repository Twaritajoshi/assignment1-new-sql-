#Table 1: SalesPeople
#Snum is Primary key
#Sname is Unique constraint
#Snum Sname City Comm
#1001 Peel. London .12
#1002  Serres Sanjose .13
#1004 Motika London .11
#1007 Rifkin Barcelona .15
#1003 Axelrod Newyork .10
#Table 2: Customers
#Cnum is Primary Key
#City has not null constraint .
#Snum is foreign key constraint refers Snum column of SalesPeople table.
#Cnum Cname City Snum
#2001  Hoffman London 1001
#2002  Giovanni Rome 1003
#2003  Liu Sanjose 1002
#2004  Grass Berlin 1002
#2006 Clemens London 1001
#2008 Cisneros Sanjose 1007
#2007 Pereira Rome 1004
#Table 3: Orders
#Onum is Primary key
#Cnum is foreign key refers to Cnum column of Customers table. Snum is foreign key refers Snum column of SalesPeople table.
#Onum Amt Odate Cnum Snum
#3001 18.69 3-10-1990 2008 1007
#3003 767.19 3-10-1990 2001 1001
#3002 1900.10 3-10-1990 2007 1004
#3005  5160.45 3-10-1990 2003 1002
#3006  1098.16 3-10-1990 2008 1007
#3009 1713.23 4-10-1990 2002 1003
#3007  75.75 4-10-1990 2004 1002
#3008  4273.00 5-10-1990 2006 1001
#3010  1309.95 6-10-1990 2004 1002
#3011  9891.88 6-10-1990 2006 1001

#On the basis of above tables perform given below questions

# Count the number of Salesperson whose name begin with ‘a’/’A’.
# Display all the Salesperson whose all orders worth is more than Rs. 2000.
# Count the number of Salesperson belonging to Newyork.
# Display the number of Salespeople belonging to London and belonging to Paris.
#Display the number of orders taken by each Salesperson and their date of orders







SHOW DATABASES;

CREATE DATABASE Twarita;

USE Twarita;

CREATE TABLE SalesPeople (
Snum varchar(30),
Sname varchar(20),
City varchar(20),
Comm varchar(40),
primary key(Snum),
unique(Sname)
);

INSERT INTO SalesPeople (Snum,SName,City,Comm) VALUES(1001,"Peel","London",12);
INSERT INTO SalesPeople (Snum,SName,City,Comm) VALUES(1002,"Serres","Sanjose",13);
INSERT INTO SalesPeople (Snum,SName,City,Comm) VALUES(1004,"Motika","London",11);
INSERT INTO SalesPeople (Snum,SName,City,Comm) VALUES(1007,"Rifkin","Barcelona",15);
INSERT INTO SalesPeople (Snum,SName,City,Comm) VALUES(1003,"Axelrod","Newyork",10);


CREATE TABLE Customers (
Cnum int,
Cname varchar(20),
City varchar(20) not null,
Snum varchar(40),
primary key(Cnum),
foreign key(Snum) references SalesPeople(Snum)
);

INSERT INTO Customers(Cnum,CName,City,Snum) VALUES(2001,"Hoffman","London",1001);
INSERT INTO Customers (Cnum,CName,City,Snum) VALUES(2002,"Giovanni","Rome",1003);
INSERT INTO Customers (Cnum,CName,City,Snum) VALUES(2003,"Liu","Sanjose",1002);
INSERT INTO Customers (Cnum,CName,City,Snum) VALUES(2004,"Grass","Berlin",1002);
INSERT INTO Customers (Cnum,CName,City,Snum) VALUES(2006,"Clemens","London",1001);
INSERT INTO Customers (Cnum,CName,City,Snum) VALUES(2008,"Cisneros","Sanjose",1007);
INSERT INTO Customers (Cnum,CName,City,Snum) VALUES(2007,"Pereira","Rome",1004);

CREATE TABLE Orders (
    Onum INT,
    Amt FLOAT,
    Odate INT,
    Cnum INT,
    Snum VARCHAR(40),
    PRIMARY KEY (Onum),
    FOREIGN KEY (Cnum)
        REFERENCES Customers (Cnum),
    FOREIGN KEY (Snum)
        REFERENCES SalesPeople (Snum)
);

INSERT INTO Orders (Onum,Amt,Odate,Cnum,Snum) VALUES(3001,18.69,3-10-1990,2008,1007);
INSERT INTO Orders (Onum,Amt,Odate,Cnum,Snum) VALUES(3003,767.19,3-10-1990,2001,1001);
INSERT INTO Orders (Onum,Amt,Odate,Cnum,Snum) VALUES(3002,1900.10,3-10-1990,2007,1004);
INSERT INTO Orders (Onum,Amt,Odate,Cnum,Snum) VALUES(3005,5160.45,3-10-1990,2003,1002);
INSERT INTO Orders (Onum,Amt,Odate,Cnum,Snum) VALUES(3006,1098.16,3-10-1990,2008,1007);
INSERT INTO Orders (Onum,Amt,Odate,Cnum,Snum) VALUES(3009,1713.23,4-10-1990,2002,1003);
INSERT INTO Orders (Onum,Amt,Odate,Cnum,Snum) VALUES(3007,75.75,4-10-1990,2004,1002);
INSERT INTO Orders (Onum,Amt,Odate,Cnum,Snum) VALUES(3008,4273.00,5-10-1990,2006,1001);
INSERT INTO Orders (Onum,Amt,Odate,Cnum,Snum) VALUES(3010,1309.95,6-10-1990,2004,1002);
INSERT INTO Orders (Onum,Amt,Odate,Cnum,Snum) VALUES(3011,9891.88,6-10-1990,2006,1001);



SELECT 
    COUNT(Sname) 'Name'
FROM
    Salespeople
WHERE
    Sname LIKE 'A%' OR 'a%' Display all the Salesperson whose all orders worth is more than Rs. 2000.
select Sname,Amt
from Orders
    inner join SalesPeople on Orders.Snum = SalesPeople.Snum
where Orders.Amt > 2000;

# 3. Count the number of Salesperson belonging to Newyork.
Select count(Sname)"Name"
 from Salespeople
 where City="Newyork";
 
# 4.Display the number of Salespeople belonging to London and belonging to Paris.
Select City,count(*)
 from Salespeople
 where City="London" or "Paris";
 
 
# 5.Display the number of orders taken by each Salesperson and their date of orders.
select Salespeople.Sname,count(*),Orders.Odate
from SalesPeople
    inner join Orders on SalesPeople.Snum = Orders.Snum
group by
Salespeople.Sname,
Orders.Odate;