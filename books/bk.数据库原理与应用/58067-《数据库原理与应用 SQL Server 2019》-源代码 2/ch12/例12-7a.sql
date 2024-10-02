--A事务：
begin tran
select 时间1=getdate(),* from 学生 with(updlock) where 学号='19010101' 
go
waitfor delay '00:00:06'							--暂停6秒
update 学生 set 总分=总分-10 where 学号='19010101'		--updlock升级为排他锁
waitfor delay '00:00:06'
rollback tran
go
select 时间2=getdate(),* from 学生 where 学号='19010101'
