


truncate table authors

delete from authors where id = 5
delete from books where AuthorId = 3;

update authors 
set unique(Firstname, Lastname, Dateofbirth)




/*

ondskan 
Norstedts förlag 1981
Tryckerigatan 4, Stockholm, Sweden


Herr Arnes penningar
Albert Bonniers Förlag
Sveavägen 56 Stockholm

*/
 
 select * from Authors

select * from books

select * from BookStores

alter table Author drop constraint DF__Authors__DateOfB__67DE6983
alter constraint StoreName nvarchar(100)

insert into Authors(Firstname, Lastname, DateofBirth) 
values 
	('Richard', 'Dawkins', '1941-03-26'),
	('Stephen', '´King', '1947-09-21'),
	('Selma', 'Lagerlöf', '1858-11-20'),
	('Astrid', 'Lindgren', '1907-11-14'),
	('Jan', 'Guillou', '1944-01-17')

insert into books 
values
	('9780198788607', 'The Selfish Gene', 'English', 100, '1976', '1' ),
	('9781501175466', 'It', 'English', 100, '1986', '2' ),
	('9789164204110', 'Ondskan', 'Svenska', 100, '1986', '5' ),
	('9786586398205', 'Gösta Berlings saga', 'Svenska', 100, '1891', '3' ),
	('9780913780015', 'Herr Arnes penningar', 'Svenska', 100, '1904', '3' ),	
	('9789164202468', 'Tempelriddaren', 'Svenska', 99, '1999', '5' ),
	('9789100114244', 'Jerusalem', 'Svenska', 100, '1901', '3' ),	
	('9789129741506 ', 'Emil och soppskålen', 'Svenska', 100, '1963', '4' ),
	('9785389003347', 'The God Delusion', 'English', 100, '2006', '1' ),
	('9780393315707', 'The Blind Watchmaker', 'English', 100, '1986', '1' )


insert into Publishers values(1, 'Norstedts', 'Tryckerigatan 4', 'Stockholm', 'Sweden')
-- insert into Publishers values(2, 'Albert Bonniers Förlag', 'Sveavägen 56' , 'Stockholm' , 'Sweden')

select * from Bookpublishers

insert into BookPublishers 
values
	('9781501175466', 1),
	('9780913780015', 1)

	alter table bookstores
	alter column StoreName nvarchar(50)

Insert into BookStores 
values
	('Akademibokhandeln', 'Norra Hamngatan 26' , '411 06', 'Göteborg', 'Sverige'),
	('Science Fiction-Bokhandeln', 'Kungsgatan 19' , '411 19', 'Göteborg', 'Sverige'),
	('Adlibris', 'Kungsgatan 34', '411 19', 'Göteborg', 'Sverige')

select * from Inventory

insert into Inventory
values
	(3, '9780913780015', 3),
	(3, '9780198788607', 2),
	(1, '9780913780015', 1),
	(2, '9789164202468', 2)
	
insert into Customers
values
	('19850622-4853', 'Pelle', 'Svanslös', 'Malörtsgatan 23', 'Göteborg', 'Sverige'),
	('19720101-4631', 'Göran', 'Bengtsson', 'Faggotgatan 12', 'Göteborg', 'Sverige'),
	('19850422-7242', 'Maria', 'Sanchez', 'Basungatan 26', 'Göteborg', 'Sverige')

insert into Orders
values
	(1, '19850622-4853', 3, '2025-02-02'),
	(2, '19850422-7242', 2, '2025-02-02')

insert into order_details
values
	(1, '9780393315707', 2),
	(2, '9785389003347', 1)



select * from orders
