create trigger ins_stu
on 学生
for insert
as
raiserror('禁止插入记录',10,1)
