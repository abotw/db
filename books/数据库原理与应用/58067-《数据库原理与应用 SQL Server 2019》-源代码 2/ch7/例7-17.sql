use jxgl
go
create function dbo.fage(@priordate datetime,@currentdate datetime)
returns int
as
begin
return year(@currentdate)-year(@priordate)
end
go
select dbo.fage(出生日期,getdate()) as 年龄 from 学生
go
select dbo.fage(工作日期,getdate()) as 工龄 from 教师
go
declare @j int
execute @j=dbo.fsum 2,8
print @j
execute @j=dbo.fsum @num1=90,@num2=10
print @j
