use jxgl
go
set tran isolation level repeatable read
begin transaction
select * from ѧ��where ����='ɽ��'
waitfor delay '00:00:10'
select * from ѧ��where ����='ɽ��'
commit transaction
waitfor delay '00:00:10'
set tran isolation level read committed
