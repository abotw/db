use jxgl
go
set tran isolation level read committed
begin transaction
update 学生 set 总分=总分-5 where 籍贯='山东'
select * from 学生 where 籍贯='山东'
waitfor delay '00:00:10'
commit transaction
