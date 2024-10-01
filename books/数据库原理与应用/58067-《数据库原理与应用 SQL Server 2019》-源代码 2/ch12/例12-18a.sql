use jxgl
go
set tran isolation level serializable
begin transaction
select * from 学生 where 籍贯='山西'
waitfor delay '00:00:10'
select * from 学生 where 籍贯='山西'
commit transaction
set tran isolation level read committed
