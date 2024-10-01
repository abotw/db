use library
go
create function dbo.duzhe_borrow(@DZBh char(4)='1001')
returns table 
as 
return(
select 姓名,性别,书名,借书日期 from 读者,借阅,图书
where 读者.读者编号=借阅.读者编号 and 
图书.图书编号=借阅.图书编号 and 读者.读者编号=@dzbh)
go 
select * from dbo.duzhe_borrow(default)
go
