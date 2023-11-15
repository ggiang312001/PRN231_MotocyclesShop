drop database MGiangStore

create database MGiangStore
 
use MGiangStore

create table Categories(
CategoryId int primary key identity not null,
CategoryName nvarchar(255) not null,
)

create table Products(
ProductId int primary key identity not null,
ProductName nvarchar(max) not null,
ProductImage varchar(max) not null,
ProductDescription nvarchar(max),
CategoryId int not null,
Price money not null,
Discount float not null,
Quantity int not null,
Active bit not null
FOREIGN KEY (CategoryId) REFERENCES Categories(CategoryId)
)

create table Roles(
RoleId int primary key identity not null,
RoleName nvarchar(255) not null
)

create table Accounts(
AccountId int primary key identity not null,
Email varchar(255) not null,
[Password] varchar(255) not null,
Fullname nvarchar(max) not null,
Avatar varchar(max),
DOB date,
Gender bit,
Phone varchar(50) not null,
[Address] nvarchar(max),
RoleId int not null
FOREIGN KEY (RoleId) REFERENCES Roles(RoleId)
)

create table Orders(
OrderId int primary key identity not null,
AccountId int not null,
OrderDate datetime not null,
TotalAmount money not null,
FOREIGN KEY (AccountId) REFERENCES Accounts(AccountId)
)

create table OrderDetails(
OrderDetailId int primary key identity not null,
OrderID int not null,
ProductId int not null,
Quantity int not null,
Price money not null,
Discount float not null,
FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
FOREIGN KEY (ProductId) REFERENCES Products(ProductId)
)

create table Carts(
CartId int primary key identity not null,
ProductId int not null,
AccountId int not null,
Quantity int not null
FOREIGN KEY (AccountId) REFERENCES Accounts(AccountId),
FOREIGN KEY (ProductId) REFERENCES Products(ProductId)
)