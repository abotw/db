use library
go 
create trigger del_����
on ����
after delete
as
delete from ���� where ���߱�� in (
select ���߱�� from deleted)
