use jxgl
go
begin tran
  select 时间0=getdate(),* from 学生 with (tablock)		--人为加tablock锁
  where 学号='19010101'
  waitfor delay '00:00:10'								--延迟10秒后结束事务
commit tran
