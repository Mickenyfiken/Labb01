

create procedure TransferBook 
	@FromStoreId int,
	@ToStoreId int,
	@ISBN13 nvarchar(13),
	@Ammount int
as
begin tran
update inventory
set Balance = Balance - @Ammount
where ISBN13 = @ISBN13 and StoreId = @FromStoreId

merge inventory as tgt
using (values(@ToStoreId, @ISBN13)) as src (StoreId, ISBN13)
on tgt.StoreId = src.StoreId
and tgt.ISBN13 = src.ISBN13

when Matched 
Then Update set tgt.Balance = tgt.balance + @Ammount

When not Matched
then 
insert (StoreId, ISBN13, Balance) values(@ToStoreId, @ISBN13, @Ammount);
rollback
go


begin tran

exec TransferBook 3, 2, '9780913780015', 1

rollback


select * from books



begin tran
update inventory
set Balance = Balance - @Ammount
where ISBN13 = @ISBN13 and StoreId = 3

merge inventory as tgt
using (values(2, '9780913780015')) as src (StoreId, ISBN13)
on tgt.StoreId = src.StoreId
and tgt.ISBN13 = src.ISBN13

when Matched 
Then Update set tgt.Balance = tgt.balance + 1

When not Matched
then 
insert (StoreId, ISBN13, Balance) values(2, '9780913780015', 1);