use library
go
create function dbo.tushu_inform(@tsbh char(6))
returns @total_tushu table (
书名 varchar(20),出版社 varchar(20),作者 varchar(20),定价 money)
as
begin
insert @total_tushu
select 书名,出版社,作者,定价
from 图书
where 图书编号=@tsbh
return 
end 
go 
select  * from dbo.tushu_inform('TP0001')