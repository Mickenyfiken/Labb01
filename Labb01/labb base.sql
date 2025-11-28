drop table Authors;
drop table Books;
drop table BookStores;
drop table Inventory;
drop table Publishers;


create table Authors
(
	Id int primary key,
	Firstname nvarchar(max),
	Lastname nvarchar(max),
	Birthdate date
);


create table Books
(
	ISBN13 nvarchar(13) primary key check(len(ISBN13) = 13),
	Title nvarchar(max),
	Language nvarchar(max),
	Price int,
	[Issue Date] date,
	AuthorsId int,
	constraint FK_books_authors Foreign key (AuthorsId) References Authors(Id),
	
);

create table Publishers
(
	Id int primary key,
	[Publisher Name] nvarchar(max),
	[Publisher Adress] nvarchar(max)
	
)
create table BookPublishers
(
	ISBN13 nvarchar(13),
	PublisherId int,
	constraint FK_bookpublishers_Books foreign key (ISBN13) references Books(ISBN13),
	constraint FK_bookpublishers_publishers foreign key (PublisherId) references Publishers(Id),
)

create table BookStores
(
	Id int Identity(1, 1) primary key,
	[Store Name] nvarchar(max),
	[Store Adress] nvarchar(max)
);

create table Inventory
(
	StoreId int,
	ISBN13 nvarchar(13),
	Balance int,
	constraint FK_Inventory_Bookstores foreign key (StoreId) References BookStores(Id),
	constraint FK_Inventory_Books foreign key (ISBN13) references Books(ISBN13)
);







/*
create table order
create table orderdetails
*/

insert into Writers(id, Birthdate) values (1, '1990-01-01')

select * from writers