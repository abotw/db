use jxgl
go
begin tran
select ʱ��1=getdate(),* from ѧ�� with(holdlock) where ѧ��='19010101' 
go
waitfor delay '00:00:06'
update ѧ�� set �ܷ�=�ܷ�-10 where ѧ��='19010101' 
waitfor delay '00:00:06'
rollback tran
go
select ʱ��2=getdate(),* from ѧ�� where ѧ��='19010101'
