use jxgl
go
alter database JXGL set allow_snapshot_isolation on
set tran isolation level snapshot
begin transaction
select * from ѧ�� where ����='ɽ��'
waitfor delay '00:00:10'
select * from ѧ�� where ����='ɽ��'
commit transaction
alter database JXGL set allow_snapshot_isolation off
