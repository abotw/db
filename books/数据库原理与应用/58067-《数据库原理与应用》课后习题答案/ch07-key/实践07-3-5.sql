use library
go
create function dbo.duzhe_borrow(@DZBh char(4)='1001')
returns table 
as 
return(
select ����,�Ա�,����,�������� from ����,����,ͼ��
where ����.���߱��=����.���߱�� and 
ͼ��.ͼ����=����.ͼ���� and ����.���߱��=@dzbh)
go 
select * from dbo.duzhe_borrow(default)
go
