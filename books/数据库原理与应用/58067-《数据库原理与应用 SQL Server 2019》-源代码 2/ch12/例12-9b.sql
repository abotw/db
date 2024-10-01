--B事务：
use jxgl
go
begin tran
  select * from 学生 where 学号='19010101'		--等待A事务结束才能执行
commit tran
