use jxgl
go
alter trigger ins_stu
on 学生
instead of insert
as
raiserror('禁止插入记录',10,1)
