use jxgl
go
create trigger up_ѧ��
on ѧ��
for update
as
declare @oldid char(8),@newid char(8)
select @oldid=deleted.ѧ��,@newid=inserted.ѧ��
  from deleted,inserted where deleted.����=inserted.����
update ѡ�� set ѧ��=@newid where ѧ��=@oldid
