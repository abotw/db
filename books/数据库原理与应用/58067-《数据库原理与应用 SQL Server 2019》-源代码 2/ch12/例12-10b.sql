--B事务：
use jxgl
go
begin tran
  select 时间1=getdate(),* from 学生 where 学号='19010101'--不等待，立即执行
  go
  update 学生 set 姓名='任伟锁' where 学号='19010101'		--伴随A事务延迟
  select 时间2=getdate(), * from 学生 where 学号='19010101'
commit tran
