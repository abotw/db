use jxgl
go
set tran isolation level repeatable read
begin transaction
select * from 学生where 籍贯='山东'
waitfor delay '00:00:10'
select * from 学生where 籍贯='山东'
commit transaction
waitfor delay '00:00:10'
set tran isolation level read committed
