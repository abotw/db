use library
go 
create trigger del_¶ÁÕß
on ¶ÁÕß
after delete
as
delete from ½èÔÄ where ¶ÁÕß±àºÅ in (
select ¶ÁÕß±àºÅ from deleted)
