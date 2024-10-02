use jxgl
go
create trigger ins_choose
on 选修
after insert
as
if (select count(*) from 课程,inserted where 课程.课程号=inserted.课程号)=0
begin
   raiserror('没有此课程',16,1)
   rollback transaction
end
