use jxgl
go
create trigger del_ѧ�� on ѧ��
after delete
as
delete from ѡ��
where ѧ�� in (select ѧ�� from deleted)
