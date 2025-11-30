

alter view TitlesPerAuthor as
select
	concat(a.FirstName,' ', a.LastName) 'Name',
	datediff(year ,cast(a.DateOfBirth as datetime), getdate()) 'Age',
	Count(b.Title) 'Titles',
	sum(i.balance*b.price) 'Stock value'
from bookstores bs
	left join inventory i on bs.Id = i.StoreId
	left join books b on i.ISBN13 = b.ISBN13
	left join authors a on b.authorid = a.id	
group by
	a.Firstname, a.Lastname, a.Dateofbirth


select * from TitlesPerAuthor