use jxgl
go
begin tran
select 时间1=getdate(),* from 学生 with(holdlock) where 学号='19010101' 
go
waitfor delay '00:00:06'
update 学生 set 总分=总分-10 where 学号='19010101' 
waitfor delay '00:00:06'
rollback tran
go
select 时间2=getdate(),* from 学生 where 学号='19010101'
