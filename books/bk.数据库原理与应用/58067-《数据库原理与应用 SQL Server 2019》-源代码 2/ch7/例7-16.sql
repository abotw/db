use jxgl
go
create function dbo.fage(@priordate datetime,@currentdate datetime)
returns int
as
begin
return year(@currentdate)-year(@priordate)
end
go
select dbo.fage(��������,getdate()) as ���� from ѧ��
go
select dbo.fage(��������,getdate()) as ���� from ��ʦ
go
declare @j int
execute @j=dbo.fsum 2,8
print @j
execute @j=dbo.fsum @num1=90,@num2=10
print @j
