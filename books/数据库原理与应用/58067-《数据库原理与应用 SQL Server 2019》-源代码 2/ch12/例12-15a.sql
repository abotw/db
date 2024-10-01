use jxgl
go
set transaction isolation level read uncommitted
begin tran 
 update 学生set 总分=总分+5 where 籍贯='山东'
 select 次数=1,* from 学生 where 籍贯='山东'
 waitfor delay '00:00:10'		--暂停10秒
 rollback transaction			--回滚事务
 select 次数=2,* from 学生 where 籍贯='山东'
