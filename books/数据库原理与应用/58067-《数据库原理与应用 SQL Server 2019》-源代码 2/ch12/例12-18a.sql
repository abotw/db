use jxgl
go
set tran isolation level serializable
begin transaction
select * from ѧ�� where ����='ɽ��'
waitfor delay '00:00:10'
select * from ѧ�� where ����='ɽ��'
commit transaction
set tran isolation level read committed
