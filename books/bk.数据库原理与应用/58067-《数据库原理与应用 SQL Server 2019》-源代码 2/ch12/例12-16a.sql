use jxgl
go
set tran isolation level read committed
begin transaction
select ����=1,* from ѧ��where ����='ɽ��'
waitfor delay '00:00:10'
select ����=2,* from ѧ��where ����='ɽ��'
waitfor delay '00:00:10'
select ����=3,* from ѧ��where ����='ɽ��'
commit transaction
