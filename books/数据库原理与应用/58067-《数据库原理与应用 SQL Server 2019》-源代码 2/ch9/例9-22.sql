use jxgl
go
create trigger ins_选修 on 选修
after insert
as
if (select count(*) from 学生,inserted where 学生.学号=inserted.学号)=0
begin
print '该学号不存在学生表中，不能插入该记录'
rollback transaction
end
