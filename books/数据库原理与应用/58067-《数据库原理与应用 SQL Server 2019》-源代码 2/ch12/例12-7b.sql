begin tran
select ʱ��1=getdate(),* from ѧ�� with(updlock) where ѧ��='19010101' 
go
waitfor delay '00:00:06'
update ѧ�� set �ܷ�=�ܷ�+10 where ѧ��='19010101' 
select ʱ��2=getdate(), * from ѧ�� where ѧ��='19010101'
commit tran
