--A事务：
use jxgl
go
begin tran
  update 学生 set 姓名='席同锁' where 学号='19010101'
  waitfor delay '00:00:10' 						--等待10秒
commit tran
