use jxgl
go
alter database JXGL set allow_snapshot_isolation on
set tran isolation level snapshot
begin transaction
select * from 学生 where 籍贯='山东'
waitfor delay '00:00:10'
select * from 学生 where 籍贯='山东'
commit transaction
alter database JXGL set allow_snapshot_isolation off
