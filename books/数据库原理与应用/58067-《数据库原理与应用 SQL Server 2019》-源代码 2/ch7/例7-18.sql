use jxgl
go
create function dbo.finfo(@xh char(8)='19010101')
returns table
as
return (
select ѧ��.ѧ��,����,�Ա�,�γ̺�,�ɼ� from ѧ��,ѡ�� 
where ѧ��.ѧ��=ѡ��.ѧ�� and ѧ��.ѧ��=@xh)
go
select * from dbo.finfo(default)
