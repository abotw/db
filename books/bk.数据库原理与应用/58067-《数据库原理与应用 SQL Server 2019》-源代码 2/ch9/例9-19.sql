use jxgl
go
create trigger up_学生
on 学生
for update
as
declare @oldid char(8),@newid char(8)
select @oldid=deleted.学号,@newid=inserted.学号
  from deleted,inserted where deleted.姓名=inserted.姓名
update 选修 set 学号=@newid where 学号=@oldid
