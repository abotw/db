alter database JXGL set allow_snapshot_isolation on
use jxgl
go
alter database JXGL set read_committed_snapshot on
set transaction isolation level read committed
begin transaction
select * from ѧ�� where ����='ɽ��'
waitfor delay '00:00:10'
select * from ѧ�� where ����='ɽ��'
commit transaction
