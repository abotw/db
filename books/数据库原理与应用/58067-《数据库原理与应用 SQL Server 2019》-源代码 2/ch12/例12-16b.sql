use jxgl
go
set tran isolation level read committed
begin transaction
update ѧ�� set �ܷ�=�ܷ�-5 where ����='ɽ��'
select * from ѧ�� where ����='ɽ��'
waitfor delay '00:00:10'
commit transaction
