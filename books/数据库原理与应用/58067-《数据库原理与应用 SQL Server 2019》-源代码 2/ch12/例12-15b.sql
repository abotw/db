set transaction isolation level read uncommitted
begin transaction
select * from 学生 where 籍贯='山东'
commit transaction
