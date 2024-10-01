use jxgl
go
create function dbo.finfo(@xh char(8)='19010101')
returns table
as
return (
select 学生.学号,姓名,性别,课程号,成绩 from 学生,选修 
where 学生.学号=选修.学号 and 学生.学号=@xh)
go
select * from dbo.finfo(default)
