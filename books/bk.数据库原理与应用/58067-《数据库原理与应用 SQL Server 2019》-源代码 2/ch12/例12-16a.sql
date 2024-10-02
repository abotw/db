use jxgl
go
set tran isolation level read committed
begin transaction
select 次数=1,* from 学生where 籍贯='山东'
waitfor delay '00:00:10'
select 次数=2,* from 学生where 籍贯='山东'
waitfor delay '00:00:10'
select 次数=3,* from 学生where 籍贯='山东'
commit transaction
