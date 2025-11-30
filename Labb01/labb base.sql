drop table Authors;
drop table Books;
drop table BookStores;
drop table Inventory;
drop table Publishers;
drop table BookPublishers;
drop table Customers;
drop table Order_details;
drop table Orders;

create table Authors
(
	Id int primary key identity (1, 1),
	Firstname nvarchar(20) default 'unkown' not null,
	Lastname nvarchar(20) default 'unkown' not null,
	DateOfBirth nvarchar(10) default 'Unkown'
	

);

create table Books
(
	ISBN13 nvarchar(13) primary key,
	Title nvarchar(50) not null,
	[Language] nvarchar(20),
	Price float,
	DateOfIssue nvarchar(10),
	AuthorId int default 0,
	constraint FK_books_authors Foreign key (AuthorId) References Authors(Id),
	constraint CK_ISBN13 Check (ISBN13 like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]')
);

create table Publishers
(
	Id int primary key,
	PublisherName nvarchar(50) not null,
	PublisherStreet nvarchar(50) default 'Closed',
	PublisherCity nvarchar(25),
	PublisherCountry nvarchar(25)
	
);
create table BookPublishers
(
	ISBN13 nvarchar(13),
	PublisherId int,
	primary key (ISBN13, PublisherId),
	constraint FK_bookpublishers_Books foreign key (ISBN13) references Books(ISBN13),
	constraint FK_bookpublishers_publishers foreign key (PublisherId) references Publishers(Id)
);

create table BookStores
(
	Id int  primary key Identity(1, 1),
	StoreName nvarchar(50) not null,
	StoreStreet nvarchar(25) not null,
	Zipcode nvarchar(10) not null,
	StoreCity nvarchar(25) not null,
	StoreCountry nvarchar(25) not null
);

create table Inventory
(
	StoreId int,
	ISBN13 nvarchar(13),
	Balance int default 1,
	primary key (Storeid, ISBN13),
	constraint FK_Inventory_Bookstores foreign key (StoreId) References BookStores(Id),
	constraint FK_Inventory_Books foreign key (ISBN13) references Books(ISBN13)
);

create table Customers
(
	Id nvarchar(13) primary key check(Id like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]'),
	Firstname nvarchar(25) not null,
	Lastname nvarchar(25) not null,
	StreetAddress nvarchar(25) not null,
	City nvarchar (25) not null,
	Country nvarchar(25) not null
);

create table Orders
(
	ID int primary key,
	CustomerId nvarchar(13) not null,
	StoreId int not null,
	OrderDate nvarchar(10) not null,
	constraint FK_orders_customers foreign key (CustomerId) references Customers(Id),
	constraint FK_orders_bookstores foreign key (StoreId) references BookStores(Id)

);
create table Order_details
(
	OrderId int,
	ISBN13 nvarchar(13),
	Quantity int Default 1 not null,
	Primary key (OrderId, ISBN13),
	constraint FK_orderdetails_orders foreign key (OrderId) references Orders(Id),
	constraint FK_orderdetails_Books foreign key (ISBN13) references Books(ISBN13)
);


select * from Authors