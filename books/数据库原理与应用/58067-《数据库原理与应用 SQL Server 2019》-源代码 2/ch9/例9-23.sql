use jxgl
go
create trigger up_班级 on 班级
after update
as
if update(班级号)
begin
print '课程表的班级号不能修改'
rollback transaction
end
